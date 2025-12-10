# Quickstart: macOS Containerization

1) **Prereqs**: macOS Tahoe 26+, Apple Silicon; Xcode/Swift 6.2; Containerization framework + `container` CLI installed.
2) **Bootstrap workspace**: `tuist generate` (or `swift package resolve`) to fetch deps; Package.swift now includes NIO, Hummingbird, AsyncHTTPClient, SwiftkubeClient, GRDB, swift-argument-parser, swift-log, swift-service-lifecycle.
3) **Lint (optional)**: `./scripts/lint.sh` runs SwiftFormat (lint) + SwiftLint using repo configs.
4) **Run engine**: `swift run FlyingDutchmanEngine` (or launchd plist); verify health at `http://localhost:PORT/health` and XPC availability. Health/status responses include containerization mode (`native` vs `stub`) and worker statuses.
5) **Run app**: `tuist generate && open .` → build `FlyingDutchmanApp` target; confirm status panel renders, shows engine state, and surfaces banners if platform/framework unsupported.
6) **CLI**: `swift run FlyingDutchmanCLI version`, `doctor`, `containers list|start|stop|restart <id|name>`, `images list|pull <ref>`, `stacks list`, `volumes list`, `networks list`; set `DOCKER_HOST=unix:///var/run/flyingdutchman-docker.sock` for shim tests.
7) **Shim check**: start shim server (uses `FD_DOCKER_SHIM_SOCKET` if set), run `docker ps`, `docker start/stop`, `docker create`, `docker logs`, and `docker events` to exercise stub routes; `docker events` supports SSE-style output; state/logs persist via GRDB with pruning; unsupported paths still return hints until Containerization-backed mode is available.
8) **Dev cluster** (once implemented): `flyingdutchman cluster create dev` → verify kubeconfig and `kubectl get nodes` succeeds.
