# Manual Validation: Native Container Lifecycle

This document describes the manual validation procedures for the Flying Dutchman 0.1 release native container lifecycle.

## Prerequisites

Ensure that you have:
1. Compiled the CLI: `swift build --target FlyingDutchmanCLI`
2. Compiled/run the backend Engine: `swift run FlyingDutchmanEngine`
3. A copy of the Linux Kernel at `~/Library/Application Support/flyingdutchman/kernel/vmlinux` (or using stub mode if virtualization isn't fully enabled on this host).

---

## 1. Image Pull and Caching

Verify that public and private image pulling works:

1. **Pull Hello-World**:
   ```bash
   swift run FlyingDutchmanCLI pull hello-world:latest
   ```
   *Expected Output*: Progress indicators showing layer downloads, manifest resolution, and successful cache storage in `~/Library/Application Support/flyingdutchman/cache/`.

2. **Pull from Private Registry**:
   ```bash
   swift run FlyingDutchmanCLI login ghcr.io
   # Input your GitHub username and PAT when prompted
   swift run FlyingDutchmanCLI pull ghcr.io/apple/containerization/vminit:0.13.0
   ```
   *Expected Output*: Authentication verification and retrieval of the image.

---

## 2. Container Creation & Startup

Verify that a container with environment variables, custom arguments, and custom workdir can be created and started.

1. **Create Container**:
   ```bash
   swift run FlyingDutchmanCLI create my-alpine alpine:latest --env "FOO=BAR" --env "HELLO=WORLD" --workdir "/var" --command "env"
   ```
   *Expected Output*: Output of created container UUID and status initialized as `.created`.

2. **Start Container**:
   ```bash
   swift run FlyingDutchmanCLI start <container-uuid>
   ```
   *Expected Output*: The state transitions to `starting` then `running`. Because this container is configured with the `env` command, it executes, dumps environment variables, and halts (transitions to `stopped`).

---

## 3. Bind Mounts and Named Volumes

Validate host-to-guest filesystem mapping:

1. **Bind Mount Validation**:
   - Create a test directory on the host: `mkdir -p /tmp/fd-test && echo "Hello from host" > /tmp/fd-test/host.txt`
   - Create container referencing the bind mount:
     ```bash
     swift run FlyingDutchmanCLI create mount-test alpine:latest --volume "/tmp/fd-test:/data" --command "cat /data/host.txt"
     ```
   - Start the container and check stdout/logs:
     ```bash
     swift run FlyingDutchmanCLI start <container-uuid>
     swift run FlyingDutchmanCLI logs <container-uuid>
     ```
     *Expected Output*: Logs output should read `"Hello from host"`.

2. **Named Volume Validation**:
   - Create container referencing a named volume:
     ```bash
     swift run FlyingDutchmanCLI create vol-test alpine:latest --volume "my-named-volume:/data" --command "touch /data/volume.txt"
     ```
   - Start container, let it exit, and check that the named volume directory exists on the host:
     `ls -la ~/Library/Application\ Support/flyingdutchman/volumes/my-named-volume`
     *Expected Output*: The directory contains `volume.txt`.

---

## 4. Port Mapping & Network Forwarding

Verify that mapped ports are reachable from the host:

1. **Create & Start Nginx**:
   ```bash
   swift run FlyingDutchmanCLI create my-web nginx:latest --publish "8080:80"
   swift run FlyingDutchmanCLI start <nginx-container-uuid>
   ```
2. **Access from Host**:
   ```bash
   curl -I http://127.0.0.1:8080
   ```
   *Expected Output*: HTTP/1.1 200 OK server response from Nginx.

3. **Stop & Verify Port Release**:
   ```bash
   swift run FlyingDutchmanCLI stop <nginx-container-uuid>
   # Check if port 8080 is freed:
   nc -z 127.0.0.1 8080
   ```
   *Expected Output*: No connection response (port successfully unbound).

---

## 5. Log Persistence and Teardown

Verify that logs are written to disk and deleted on removal:

1. **Locate Log File**:
   - Run a container that logs output (e.g., alpine pinging localhost):
     ```bash
     swift run FlyingDutchmanCLI create ping-test alpine:latest --command "ping -c 3 127.0.0.1"
     swift run FlyingDutchmanCLI start <ping-container-uuid>
     ```
   - Verify log file exists at:
     `cat ~/.flyingdutchman/logs/<ping-container-uuid>.log`
     *Expected Output*: ICMP ping responses.
   - Verify logs are still readable after the container process has terminated.

2. **Teardown & Cleanup**:
   - Remove the container:
     ```bash
     swift run FlyingDutchmanCLI rm <ping-container-uuid>
     ```
   - Verify that the log file is deleted on disk:
     `ls ~/.flyingdutchman/logs/<ping-container-uuid>.log`
     *Expected Output*: File not found.
   - Verify the database record is deleted from GRDB container tables.
