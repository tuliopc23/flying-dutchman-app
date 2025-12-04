# XPC Contract: Engine Status

- **Service Name**: `com.flyingdutchman.engine.xpc`
- **Interface**: `EngineXPCProtocol`
- **Method**: `fetchStatus(reply:)`
- **Request**: none
- **Response**:
  ```json
  {
    "engine": "running",
    "uptimeSeconds": 0,
    "workers": {
      "http": "ready",
      "xpc": "ready|stub|error"
    }
  }
  ```
- **Error Handling**: connection failure implies engine offline; clients should fall back to HTTP `/health`.
