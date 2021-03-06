﻿using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace Code.Hardware {
  // Data structure for all known hardware information in game
  public class HardwareCatalog {
    // Note: catalog.sdf is dynamically created by the headless process and contains only HW that will be used in the scenario, so we need to load meshes and materials for *all* objects in the catalog.
    
    private Dictionary<string, HardwareAsset> _hardwareAssetMap = new Dictionary<string, HardwareAsset>();
    private Dictionary<string, HardwareType> _hardwareTypeMap = new Dictionary<string, HardwareType>();
    private Dictionary<HardwareType, List<Hardware>> _scenarioHardwareMap = new Dictionary<HardwareType, List<Hardware>>();

    // ------------------------------------------------------------------------
    // Input params:
    // - assetBundle: The asset bundle containing the art assets for our hardware
    // - hardwareDefinitionInformations: List of hardware types and filepaths to where the hardware of that type is defined
    // - scenarioHardwareCatalogDirectory: Directory to load scenario specific hardware catalog from
    public HardwareCatalog(IEnumerable<HardwareTypeProperties> hardwareTypes, string scenarioHardwareCatalogDirectory) {
      // Gather all of the hardware assets we have to choose from.
      foreach (var hardwareAsset in hardwareTypes) {
        _hardwareAssetMap.Add(hardwareAsset.name, hardwareAsset.hardwareAsset);
        _hardwareTypeMap.Add(hardwareAsset.name, hardwareAsset.hardwareType);
      }

      // Get the list of hardware available for this scenario and add it to our maps
      var scenarioSpecificHardware = HardwareParser.GetScenarioSpecificHardware(scenarioHardwareCatalogDirectory);
      foreach (var hardware in scenarioSpecificHardware) {
        // Only add hardware we have assets to use in game
        if (_hardwareAssetMap.ContainsKey(hardware.name)) {
          var hardwareType = _hardwareTypeMap[hardware.name];
          // If this hardware type has not been mapped yet, add it
          if (!_scenarioHardwareMap.ContainsKey(hardwareType)) {
            _scenarioHardwareMap.Add(hardwareType, new List<Hardware>());
          }
          _scenarioHardwareMap[hardwareType].Add(hardware);
        }
      }
    }

    // ------------------------------------------------------------------------
    public HardwareAsset GetHardwareAsset(string hardwareID) {
      if (_hardwareAssetMap.ContainsKey(hardwareID)) {
        return _hardwareAssetMap[hardwareID];  // TODO: can we obtain a value with a string? think we need to .Find(...
      }
      return null;
    }

    // ------------------------------------------------------------------------
    public HardwareType GetHardwareType(string hardwareID) {
      if (_hardwareTypeMap.ContainsKey(hardwareID)) {
        return _hardwareTypeMap[hardwareID];
      }
      return HardwareType.Invalid;
    }

    // ------------------------------------------------------------------------
    public ReadOnlyCollection<Hardware> GetHardwareOfType(HardwareType hardwareType) {
      if (_scenarioHardwareMap.ContainsKey(hardwareType)) {
        return _scenarioHardwareMap[hardwareType].AsReadOnly();
      }
      return new List<Hardware>().AsReadOnly();
    }
  }
}
