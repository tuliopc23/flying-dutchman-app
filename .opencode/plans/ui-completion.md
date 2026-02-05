# Implementation Plan: Full UI Completion & Modernization

## Goal
Deliver a complete, polished, and modern macOS UI for Flying Dutchman (Target: macOS 26+). This includes a new Dashboard with charts, improved Settings with native networking setup, and a fully functional sidebar navigation.

## Design Philosophy
-   **Framework**: SwiftUI with Observation (`@Observable`).
-   **Style**: "Glass & Steel" (translucent sidebars, glass cards, vibrant status colors).
-   **Navigation**: `NavigationSplitView` with a comprehensive Sidebar.
-   **Charts**: Swift Charts for visualization.

## Phase 1: The Dashboard (New Feature)
**Objective**: Create a "Home" view that gives an at-a-glance overview of the system.

### 1. New Module: `Features/Dashboard`
-   **Files**:
    -   `DashboardView.swift`: Main grid layout.
    -   `DashboardViewModel.swift`: Aggregates data from stores.
    -   `MetricsChart.swift`: Reusable Swift Chart component.
    -   `MetricsService.swift`: Background poller for resource usage.

### 2. Metrics Architecture (New)
-   **Store**: `MetricsStore` (Persistence).
    -   Table: `metric_points` (id, timestamp, metric_type, value, resource_id).
-   **Service**: `MetricsService` (Domain).
    -   Actor that polls `ContainerizationRuntime` every 5s.
    -   Calculates CPU% and Memory usage.
    -   Persists to `MetricsStore`.
-   **Visualization**:
    -   Swift Charts queries `MetricsStore` for the last 1 hour of data.

### 3. UI Components (Dashboard)
-   **Status Cards**: 
    -   "Containers": Running / Stopped count.
    -   "Machines": Active VM count + Total Resources (CPU/RAM).
    -   "Images": Total count + Disk usage estimate.
-   **Activity Chart**: 
    -   Line chart showing "CPU Usage" (from `MetricsStore`).
    -   Bar chart for "Events" (from `EventStore`).
-   **Quick Actions**:
    -   "New Container", "Pull Image", "Open Debug Shell".

### 4. Integration
-   **AppSection**: Add `.dashboard` case (first item).
-   **Sidebar**: Add "Dashboard" row with `house.fill` icon.
-   **MainWindow**: Add `case .dashboard` to `DetailContentView`.

## Phase 2: Settings & Networking UX
**Objective**: Replace CLI-based setup with native buttons and status checks.

### 1. Update `SettingsView`
-   **Dependency**: Inject `NetworkSetupManager`.
-   **UI Changes**:
    -   **DNS Section**:
        -   Status Indicator: `check.circle` (Green) if `/etc/resolver` exists, else `exclamationmark.triangle` (Orange).
        -   Button: "Install DNS Resolvers" (calls `NetworkSetupManager.installDNSResolvers`).
    -   **CA Trust Section**:
        -   Status Indicator: Check if CA cert is in System Keychain (proxy check via file existence + user confirmation).
        -   Button: "Trust Root CA" (calls `NetworkSetupManager.trustRootCA`).

## Phase 3: Debug Shell (Terminal Integration)
**Objective**: Provide a real terminal experience.

### 1. Components
-   **`TermView`**: A SwiftUI wrapper around a text editor (MVP) or `SwiftTerm` (Ideal). 
-   **Integration**: Connect `TermView` input/output to the `SSHClient` or `VSOCK` stream established by `DebugShellFeature`.

## Phase 4: Navigation & Polish
**Objective**: Refine the sidebar and icons.

### 1. Sidebar Structure
-   **Top**: Dashboard.
-   **Management**: Containers, Stacks, Images, Machines, Kubernetes.
-   **Infrastructure**: Volumes, Networks.
-   **Monitoring**: Logs, Events.
-   **Tools**: Debug Shell.

### 2. Icons (SF Symbols)
-   **Dashboard**: `house` or `gauge`.
-   **Containers**: `shippingbox`.
-   **Images**: `photo.on.rectangle`.
-   **Machines**: `server.rack`.
-   **Kubernetes**: `hexagon`.
-   **Settings**: `gear`.

## Execution Order
1.  **Core UI Types**: Update `AppSection` and `SidebarView`.
2.  **Dashboard Module**: Create the module and view.
3.  **Settings Upgrade**: Wire up `NetworkSetupManager`.
4.  **Wire It Up**: Update `MainWindow` to display the new views.

## Verification
-   **Dashboard**: Shows correct counts matching `docker ps`.
-   **Settings**: Clicking "Trust CA" prompts for sudo (via osascript) and updates UI to Success.
