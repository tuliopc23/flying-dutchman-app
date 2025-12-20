## 1. Image & RootFS Handling

- [x] 1.1 Implement `prepareRootFS` in `ContainerizationRuntime.swift` to extract image layers
- [x] 1.2 Update `pullImage` to ensure layer blobs are stored in a layout accessible for extraction
- [x] 1.3 Implement `cleanupRootFS` to recursively remove container directory

## 2. VM Configuration

- [x] 2.1 Update `ContainerizationRuntime.startContainer` to use `config.cpuLimit` (defaulting to 2)
- [x] 2.2 Update `ContainerizationRuntime.startContainer` to use `config.memoryLimit` (defaulting to 512MB)
- [x] 2.3 Add validation to ensure limits are within host capabilities (basic checks)

## 3. Lifecycle Management

- [x] 3.1 Improve `startContainer` error handling (catch VM boot errors)
- [x] 3.2 Improve `stopContainer` with timeout: try VSOCK stop -> wait 5s -> force VM stop
- [x] 3.3 Ensure `activeContainers` map is kept in sync even if crash occurs (reconcile on init)

## 4. Verification

- [ ] 4.1 Manual Test: Pull `alpine`, create container with 1GB RAM, start it
- [ ] 4.2 Manual Test: Verify VM process exists and rootfs is populated
- [ ] 4.3 Manual Test: Stop container and verify cleanup
