import Foundation
import Logging
import Shared

public actor KubernetesClusterManager {
    private let logger = Loggers.make(category: "flyingdutchman.kubernetes")

    public init() {}

    public func createK3sCloudInit(
        machineName: String,
        sshPublicKey: String,
        enableIngress: Bool = true,
        enableLoadBalancer: Bool = true
    ) -> String {
        k3sCloudInitTemplate(
            machineName: machineName,
            sshPublicKey: sshPublicKey,
            enableIngress: enableIngress,
            enableLoadBalancer: enableLoadBalancer
        )
    }

    private func k3sCloudInitTemplate(
        machineName: String,
        sshPublicKey: String,
        enableIngress: Bool,
        enableLoadBalancer: Bool
    ) -> String {
        let traefikCrd = enableIngress
            ? "- kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v2.10/docs/content/reference/dynamic-configuration/kubernetes-crd-definition-v1.yml"
            : ""
        let traefikRbac = enableIngress
            ? "- kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v2.10/docs/content/reference/dynamic-configuration/kubernetes-crd-rbac.yml"
            : ""
        let metallb = enableLoadBalancer
            ? "- kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.12/config/manifests/metallb-native.yaml"
            : ""
        return k3sCloudInitBase(
            machineName: machineName,
            sshPublicKey: sshPublicKey,
            traefikCrd: traefikCrd,
            traefikRbac: traefikRbac,
            metallb: metallb
        )
    }

    private func k3sCloudInitBase(
        machineName: String,
        sshPublicKey: String,
        traefikCrd: String,
        traefikRbac: String,
        metallb: String
    ) -> String {
        """
        #cloud-config
        hostname: \(machineName)

        users:
          - name: root
            ssh_authorized_keys:
              - \(sshPublicKey)
          - name: ubuntu
            sudo: ALL=(ALL) NOPASSWD:ALL
            groups: users, admin, docker
            shell: /bin/bash
            ssh_authorized_keys:
              - \(sshPublicKey)

        ssh_pwauth: false
        disable_root: false

        package_update: true
        package_upgrade: true

        packages:
          - curl
          - wget
          - vim
          - git
          - ca-certificates
          - gnupg
          - lsb-release

        write_files:
          - path: /etc/rancher/k3s/config.yaml
            content: |
              write-kubeconfig-mode: "0644"
              tls-san:
                - "127.0.0.1"
                - "localhost"
                - "\(machineName).fd.local"
              disable:
                - traefik
              cluster-init: true

        runcmd:
          - systemctl enable ssh
          - systemctl start ssh
          - curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --disable traefik" sh -
          - mkdir -p /home/ubuntu/.kube
          - cp /etc/rancher/k3s/k3s.yaml /home/ubuntu/.kube/config
          - chown -R ubuntu:ubuntu /home/ubuntu/.kube
          - chmod 600 /home/ubuntu/.kube/config
          - until kubectl get nodes; do sleep 2; done
          \(traefikCrd)
          \(traefikRbac)
          \(metallb)
          - echo "k3s installation complete"

        final_message: "k3s cluster is ready!"
        """
    }

    public func extractKubeconfig(from machineDirectory: URL) throws -> String? {
        let kubeconfigPath = machineDirectory.appendingPathComponent("kubeconfig")

        guard FileManager.default.fileExists(atPath: kubeconfigPath.path) else {
            return nil
        }

        return try String(contentsOf: kubeconfigPath, encoding: .utf8)
    }

    public func saveKubeconfig(_ kubeconfig: String, to machineDirectory: URL) throws {
        let kubeconfigPath = machineDirectory.appendingPathComponent("kubeconfig")
        try kubeconfig.write(to: kubeconfigPath, atomically: true, encoding: .utf8)

        // Set proper permissions
        try FileManager.default.setAttributes(
            [.posixPermissions: 0o600],
            ofItemAtPath: kubeconfigPath.path
        )

        logger.info("Saved kubeconfig to \(kubeconfigPath.path)")
    }

    public func configureKubectlContext(
        machineName: String,
        machineIP: String,
        kubeconfigPath: URL
    ) throws -> String {
        // Read the k3s kubeconfig
        guard let k3sConfig = try? String(contentsOf: kubeconfigPath, encoding: .utf8) else {
            throw KubernetesError.kubeconfigNotFound
        }

        // Replace localhost with actual machine IP
        return k3sConfig
            .replacingOccurrences(of: "https://127.0.0.1:6443", with: "https://\(machineIP):6443")
            .replacingOccurrences(of: "default", with: machineName)
    }

    public func mergeKubeconfigToHost(
        machineName: String,
        kubeconfig: String
    ) throws {
        let homeDir = FileManager.default.homeDirectoryForCurrentUser
        let hostKubeconfigPath = homeDir.appendingPathComponent(".kube/config")

        // Create .kube directory if it doesn't exist
        let kubeDir = homeDir.appendingPathComponent(".kube")
        try? FileManager.default.createDirectory(at: kubeDir, withIntermediateDirectories: true)

        // For now, save as separate context file
        let contextPath = kubeDir.appendingPathComponent("config-\(machineName)")
        try kubeconfig.write(to: contextPath, atomically: true, encoding: .utf8)

        logger.info("Saved kubectl context to \(contextPath.path)")
        logger.info("Use: export KUBECONFIG=\(contextPath.path)")
    }
}

public enum KubernetesError: Error {
    case kubeconfigNotFound
    case clusterNotReady
    case invalidConfiguration
}
