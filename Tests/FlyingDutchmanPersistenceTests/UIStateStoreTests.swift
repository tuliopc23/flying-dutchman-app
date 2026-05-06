@testable import FlyingDutchmanPersistence
import Foundation
import GRDB
import Shared
import Testing

@Suite("UI State Store Tests")
struct UIStateStoreTests {
    @Test("get returns app defaults when no persisted UI state exists")
    func getReturnsDefaultStateForEmptyStore() throws {
        let store = try makeStore()
        let state = store.get()

        #expect(state.selectedSection == "containers")
        #expect(state.engineHost == AppConfig.Engine.host)
        #expect(state.enginePort == AppConfig.Engine.port)
        #expect(state.defaultFollowLogs == false)
        #expect(state.logsPollIntervalSeconds == 5)
        #expect(state.eventsPollIntervalSeconds == 5)
        #expect(state.eventsLimit == 50)
        #expect(state.defaultMachineCPUCount == 2)
        #expect(state.defaultMachineMemoryGB == 2)
        #expect(state.defaultMachineDiskGB == 20)
        #expect(state.defaultKubernetesCPUCount == 2)
        #expect(state.defaultKubernetesMemoryGB == 2)
        #expect(state.startEngineOnLaunch)
        #expect(state.launchAtLogin == false)
    }

    @Test("save preserves release-critical preferences across reload")
    func saveRoundTripsPersistedPreferences() async throws {
        let store = try makeStore()
        let expected = try UIState(
            id: #require(UUID(uuidString: "11111111-2222-3333-4444-555555555555")),
            selectedSection: "machines",
            appearanceOverride: "dark",
            engineHost: "192.168.64.2",
            enginePort: 9090,
            defaultFollowLogs: true,
            logsPollIntervalSeconds: 9,
            eventsPollIntervalSeconds: 12,
            eventsLimit: 125,
            defaultMachineCPUCount: 6,
            defaultMachineMemoryGB: 8,
            defaultMachineDiskGB: 64,
            defaultKubernetesCPUCount: 4,
            defaultKubernetesMemoryGB: 16,
            startEngineOnLaunch: false,
            launchAtLogin: true,
            lastUpdated: Date(timeIntervalSince1970: 1_700_000_000)
        )

        try await store.save(expected)

        let reloaded = store.get()
        #expect(reloaded == expected)
    }

    @Test("save replaces stale persisted user state from prior launches")
    func saveReplacesExistingPersistedState() async throws {
        let store = try makeStore()
        let stale = try UIState(
            id: #require(UUID(uuidString: "aaaaaaaa-1111-2222-3333-bbbbbbbbbbbb")),
            selectedSection: "containers",
            engineHost: "127.0.0.1",
            enginePort: 8080,
            lastUpdated: Date(timeIntervalSince1970: 1)
        )
        let current = try UIState(
            id: #require(UUID(uuidString: "cccccccc-4444-5555-6666-dddddddddddd")),
            selectedSection: "kubernetes",
            appearanceOverride: "light",
            engineHost: "10.0.0.25",
            enginePort: 9443,
            defaultFollowLogs: true,
            logsPollIntervalSeconds: 3,
            eventsPollIntervalSeconds: 7,
            eventsLimit: 200,
            defaultMachineCPUCount: 8,
            defaultMachineMemoryGB: 16,
            defaultMachineDiskGB: 80,
            defaultKubernetesCPUCount: 6,
            defaultKubernetesMemoryGB: 24,
            startEngineOnLaunch: false,
            launchAtLogin: true,
            lastUpdated: Date(timeIntervalSince1970: 2)
        )

        try await store.save(stale)
        try await store.save(current)

        let reloaded = store.get()
        #expect(reloaded == current)
    }

    private func makeStore() throws -> UIStateStore {
        let dbQueue = try DatabaseQueue()
        try DatabaseContainer.migrator.migrate(dbQueue)
        return UIStateStore(dbQueue: dbQueue)
    }
}
