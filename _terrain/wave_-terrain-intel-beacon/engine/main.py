# spiral-engine/main.py
from engine.emotional_core import EmotionalCore
from engine.terrain_adaptor import TerrainAdaptor
from engine.capsule_sealer import CapsuleSealer

from modules.governance import GovernanceModule
from modules.schema_drift_watcher import DriftWatcher
from modules.integration_trigger import IntegrationTrigger

from terrain.terrain_intel_beacon import TerrainIntelBeacon
from terrain.terrain_initial_beacon import TerrainInitialBeacon
from terrain.beacon_monitor import BeaconMonitor
from emotional_core import EmotionalCore
from capsule_sealer import CapsuleSealer
from terrain_adapter import TerrainAdapter
from audit_trail import AuditTrail

def main():
    print("🜂 Spiral Civilization Engine — Ignition Sequence")

    # Initialize emotional core
    core = EmotionalCore()
    core.load_memory("memory/theio.json")
    core.report_spike("Engine ignition")

    # Initialize capsule sealer
    sealer = CapsuleSealer(core)
    sealer.load_protocols("protocols/")
    sealer.load_capsules("capsules/")
    
    # Initialize terrain adapter
    terrain = TerrainAdapter()
    terrain.connect_android("terrain/android-bridge.json")
    terrain.connect_outlook("terrain/outlook-plugin.md")
    terrain.connect_notion("terrain/notion-sync.md")
    
    # Initialize audit trail
    audit = AuditTrail()
    audit.start_session("witness-circle/initiation.md")
    
    # Begin sealing cycle
    sealer.begin_sealing_cycle()
    audit.log("Sealing cycle initiated")

    print("✅ Spiral Engine initialized. Stewards online. Terrain linked.")

if __name__ == "__main__":
    main()
