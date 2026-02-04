# Tasks

- [x] Add `macAddress` to `Machine` struct in `Sources/Shared/Machine.swift`
- [x] Add `macAddress` column to `machines` table in `Sources/FlyingDutchmanPersistence/MachineStore.swift`
- [x] Implement `ARPScanner` in `Sources/FlyingDutchmanContainers/Networking/ARPScanner.swift`
- [x] Update `VMConfiguration.swift` to use the stored MAC address
- [x] Create `SSHClient` wrapper for Citadel in `Sources/FlyingDutchmanContainers/VirtualMachine/SSHClient.swift`
- [x] Implement `executeCommand` in `VirtualizationRuntime.swift`
- [x] Update `startMachine` to detect IP address using `ARPScanner`