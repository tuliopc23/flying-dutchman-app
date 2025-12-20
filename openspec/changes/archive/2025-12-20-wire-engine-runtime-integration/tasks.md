## 1. Engine Runtime Integration

- [x] 1.1 Update `FlyingDutchmanEngineMain.swift` to instantiate runtime via `RuntimeFactory.makeRuntime()` with GRDB stores
- [x] 1.2 Pass runtime instance to HTTP server and XPC service constructors
- [x] 1.3 Add structured logging for engine startup and runtime mode detection

## 2. HTTP Routes Implementation

- [x] 2.1 Wire `ContainersRoutes.list()` to call `runtime.list()` and return JSON
- [x] 2.2 Wire `ContainersRoutes.create()` to parse request, call runtime, persist to GRDB, return container
- [x] 2.3 Wire `ContainersRoutes.start(id:)` to call `runtime.start()`, update GRDB, return updated container
- [x] 2.4 Wire `ContainersRoutes.stop(id:)` to call `runtime.stop()`, update GRDB, return updated container
- [x] 2.5 Wire `ContainersRoutes.remove(id:)` to call runtime, delete from GRDB, return 204
- [x] 2.6 Wire `ContainersRoutes.logs(id:)` to stream logs from runtime via AsyncStream
- [x] 2.7 Wire `ImagesRoutes.list()` to call `runtime.list()` for images
- [x] 2.8 Add error handling: map runtime errors to HTTP 404/409/500 with clear messages

## 3. XPC Service Implementation

- [x] 3.1 Wire `EngineXPCService.listContainers()` to call `runtime.list()` and encode response
- [x] 3.2 Wire `EngineXPCService.startContainer(id:)` to call runtime and return updated state
- [x] 3.3 Wire `EngineXPCService.stopContainer(id:)` to call runtime and return updated state
- [x] 3.4 Wire `EngineXPCService.getStatus()` to return engine + runtime health info
- [x] 3.5 Add XPC error handling with proper NSError codes

## 4. CLI Command Updates

- [x] 4.1 Update `flyingdutchman containers list` to parse engine HTTP JSON response correctly
- [x] 4.2 Update `flyingdutchman containers start <id>` to call engine endpoint and display result
- [x] 4.3 Update `flyingdutchman containers stop <id>` to call engine endpoint and display result
- [x] 4.4 Update `flyingdutchman doctor` to show runtime mode (stub/cli/native) and engine connectivity
- [x] 4.5 Add error handling: display clear messages when engine is unreachable

## 5. State Synchronization

- [x] 5.1 Ensure `ContainerStore.update()` is called after every runtime state change
- [x] 5.2 Add periodic sync: engine polls runtime every 5s and updates GRDB if state diverges
- [x] 5.3 Add event recording: log all lifecycle transitions to `ShimEventStore` for debugging

## 6. Testing & Validation

- [x] 6.1 Manual test: Start engine, run CLI `containers list`, verify output matches stub data
- [x] 6.2 Manual test: CLI `start <id>` changes status to running, persists to GRDB
- [x] 6.3 Manual test: CLI `stop <id>` changes status to stopped, persists to GRDB
- [x] 6.4 Manual test: Launch UI, verify containers display correctly from engine
- [x] 6.5 Integration test: Round-trip (CLI create → engine → runtime → GRDB → UI fetch)
- [x] 6.6 Error test: Stop engine, verify CLI shows clear "engine unreachable" message
- [x] 6.7 Performance test: Verify CLI commands complete <500ms, UI updates <200ms

## 7. Documentation

- [x] 7.1 Update `openspec/project.md` with "Phase A.2: Engine-Runtime Integration" status
- [x] 7.2 Add quickstart example: `swift run FlyingDutchmanEngine & swift run FlyingDutchmanCLI containers list`
- [x] 7.3 Document runtime selection: `FD_RUNTIME=stub` (default), `FD_RUNTIME=cli`, `FD_RUNTIME=native`
