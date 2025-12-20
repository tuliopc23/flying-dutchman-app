## 1. Integration

- [x] 1.1 Wire DockerShimServer into Server.swift router
- [x] 1.2 Expose Docker API on `/v1.41/*` paths
- [x] 1.3 Keep existing `/containers/*` routes for backward compatibility

## 2. Container Endpoints

- [x] 2.1 Complete `GET /v1.41/containers/json` (list containers)
- [x] 2.2 Complete `POST /v1.41/containers/create` (create container)
- [x] 2.3 Implement `POST /v1.41/containers/{id}/start` (start container)
- [x] 2.4 Implement `POST /v1.41/containers/{id}/stop` (stop container)
- [x] 2.5 Implement `DELETE /v1.41/containers/{id}` (remove container)
- [x] 2.6 Implement `GET /v1.41/containers/{id}/logs` (stream logs)

## 3. Image Endpoints

- [x] 3.1 Implement `GET /v1.41/images/json` (list images)
- [x] 3.2 Implement `POST /v1.41/images/create` (pull image)
- [ ] 3.3 Implement `DELETE /v1.41/images/{id}` (remove image) - Not yet implemented, requires image deletion in runtime

## 4. System Endpoints

- [x] 4.1 Implement `GET /v1.41/info` (system information)
- [x] 4.2 Verify `GET /v1.41/version` works correctly

## 5. Testing

- [ ] 5.1 Test `docker ps` against Flying Dutchman engine
- [ ] 5.2 Test `docker run alpine:latest echo "hello"`
- [ ] 5.3 Test `docker stop <container>`
- [ ] 5.4 Test Docker Compose with simple stack

