# HTTP Contract: Engine Status

- **Endpoint**: `/status`
- **Method**: GET
- **Description**: Returns current engine readiness and worker statuses
- **Response 200**:
  ```json
  {
    "engine": "running",
    "uptimeSeconds": 123,
    "workers": {
      "http": "ready",
      "xpc": "ready|stub|error",
      "containerization": "stub|ready|error"
    }
  }
  ```
- **Response 503**:
  ```json
  {
    "engine": "starting",
    "message": "not ready"
  }
  ```
