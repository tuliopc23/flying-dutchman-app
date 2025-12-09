# Quickstart: macOS Containerization

1) **Prereqs**: macOS Tahoe 26+, Apple Silicon; Xcode/Swift 6.2; Containerization framework + `container` CLI installed.
2) **Bootstrap workspace**: `tuist generate` (or `swift package resolve`) to fetch deps; ensure Package.swift includes containerization, NIO, Hummingbird, AsyncHTTPClient, SwiftkubeClient, GRDB.
3) **Run engine**: `swift run FlyingDutchmanEngine` (or launchd plist); verify health at `http://localhost:PORT/health` and XPC availability.
4) **Run app**: `tuist generate && open .` → build `FlyingDutchmanApp` target; confirm status panel renders and shows engine state.
5) **CLI**: `swift run FlyingDutchmanCLI version`, `doctor`, `containers list|start|stop|restart <id|name>`, `images list`, `stacks list`; set `DOCKER_HOST=unix:///var/run/flyingdutchman-docker.sock` for shim tests.
6) **Shim check**: start shim server, run `docker ps` (expect Flying Dutchman-backed list) and `docker run` basic image; observe unsupported-feature errors when applicable.
7) **Dev cluster** (once implemented): `flyingdutchman cluster create dev` → verify kubeconfig and `kubectl get nodes` succeeds.
