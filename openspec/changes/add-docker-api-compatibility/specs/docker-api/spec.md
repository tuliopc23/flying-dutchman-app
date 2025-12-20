# docker-api Specification

## Purpose

Provide Docker API v1.41 compatibility layer that translates Docker commands to native Apple Containerization framework operations, enabling seamless integration with existing Docker tooling.

## ADDED Requirements

### Requirement: Docker API Container Listing

The engine MUST expose `GET /v1.41/containers/json` endpoint that returns containers in Docker API format.

#### Scenario: List containers via Docker API

- **WHEN** client sends `GET /v1.41/containers/json`
- **THEN** engine returns HTTP 200 with JSON array of containers
- **AND** each container includes: `Id`, `Names`, `Image`, `State`, `Status`, `Created`
- **AND** format matches Docker API v1.41 specification

### Requirement: Docker API Container Creation

The engine MUST expose `POST /v1.41/containers/create` endpoint that creates containers via Docker API.

#### Scenario: Create container via Docker API

- **WHEN** client sends `POST /v1.41/containers/create` with Docker API request body
- **THEN** engine parses Docker API format
- **AND** translates to native `createContainer` call
- **AND** returns HTTP 201 with created container in Docker format

### Requirement: Docker API Container Lifecycle

The engine MUST expose Docker API endpoints for container start/stop operations.

#### Scenario: Start container via Docker API

- **WHEN** client sends `POST /v1.41/containers/{id}/start`
- **THEN** engine calls native `startContainer(id:)`
- **AND** returns HTTP 204 (no content) on success

#### Scenario: Stop container via Docker API

- **WHEN** client sends `POST /v1.41/containers/{id}/stop`
- **THEN** engine calls native `stopContainer(id:)`
- **AND** returns HTTP 204 (no content) on success

### Requirement: Docker API Image Operations

The engine MUST expose Docker API endpoints for image listing and pulling.

#### Scenario: List images via Docker API

- **WHEN** client sends `GET /v1.41/images/json`
- **THEN** engine returns HTTP 200 with JSON array of images
- **AND** each image includes: `Id`, `RepoTags`, `Size`, `Created`
- **AND** format matches Docker API v1.41 specification

#### Scenario: Pull image via Docker API

- **WHEN** client sends `POST /v1.41/images/create?fromImage=alpine:latest`
- **THEN** engine calls native `pullImage(reference:)`
- **AND** streams progress updates in Docker API format
- **AND** returns HTTP 200 on completion

### Requirement: Docker API System Information

The engine MUST expose `GET /v1.41/info` endpoint with system information.

#### Scenario: Get system info via Docker API

- **WHEN** client sends `GET /v1.41/info`
- **THEN** engine returns HTTP 200 with system information
- **AND** includes: `Containers`, `Images`, `OperatingSystem`, `Architecture`
- **AND** format matches Docker API v1.41 specification

