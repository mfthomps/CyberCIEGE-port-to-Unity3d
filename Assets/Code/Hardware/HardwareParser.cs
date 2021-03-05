using System;
using System.IO;
using System.Text;
using System.Collections.Generic;
using UnityEngine;

namespace Code.Hardware {
  // Parses information about all hardware in game and available hardware in a given scenario from files
  public static class HardwareParser {
    private static string HARDWARE_CATALOG = "catalog.sdf";
    private static string HARDWARE_BEGIN = "Component:";
    private static string HARDWARE_NAME = "Name";
    private static string HARDWARE_ID = "HW";
    private static string HARDWARE_DESCRIPTION = "Description";
    private static string HARDWARE_OS = "OS";
    private static string HARDWARE_COST = "Cost";
    private static string HARDWARE_END = ":end";

    // ------------------------------------------------------------------------
    //public static Dictionary<string, HardwareAsset> GetHardwareAssets(HardwareTypeProperties hardwareTypeProperties) {
    //public static Dictionary<string, HardwareAsset> GetHardwareAssets(HardwareAsset hardwareAsset) {

    //  var hardwareMap = new Dictionary<string, HardwareAsset>();
    //  //var hardwareAsset = new HardwareAsset();
    //  //hardwareAsset.mesh = hardwareTypeProperties.
    //  //hardwareAsset.material = hardwareTypeProperties.material;
    //  hardwareAsset.icon = hardwareTypeProperties.image;
    //  hardwareMap.Add(hardwareTypeProperties.name, hardwareAsset);

    //  return hardwareMap;
    //}

    // ------------------------------------------------------------------------
    public static List<Hardware> GetScenarioSpecificHardware(string scenarioHardwareCatalogDirectory) {
      var hardwareList = new List<Hardware>();

      try {
        var catalogFile = Path.Combine(scenarioHardwareCatalogDirectory, HARDWARE_CATALOG);
        StreamReader reader = new StreamReader(catalogFile, Encoding.Default);
        using (reader) {
          var line = reader.ReadLine();
          Hardware currentHardware = null;
          while (line != null) {
            line = line.Trim();
            // If this is the start of a hardware element, start our current hardware object over
            if (line.StartsWith(HARDWARE_BEGIN)) {
              currentHardware = new Hardware();
            }
            // Set the hardware's name property if that's this line
            else if (line.StartsWith(HARDWARE_NAME)) {
              currentHardware.name = ccUtils.SDTField(line, HARDWARE_NAME);
            }
            // Set the hardware's id property if that's this line
            else if (line.StartsWith(HARDWARE_ID)) {
              currentHardware.id = ccUtils.SDTField(line, HARDWARE_ID);
            }
            // Set the hardware's description property if that's this line
            else if (line.StartsWith(HARDWARE_DESCRIPTION)) {
              currentHardware.description = ccUtils.SDTField(line, HARDWARE_DESCRIPTION);
            }
            // Set the hardware's OS property if that's this line
            else if (line.StartsWith(HARDWARE_OS)) {
              currentHardware.os = ccUtils.SDTField(line, HARDWARE_OS);
            }
            // Set the hardware's cost property if that's this line
            else if (line.StartsWith(HARDWARE_COST)) {
              currentHardware.cost = Convert.ToInt32(ccUtils.SDTField(line, HARDWARE_COST));
            }
            // If this is the end of a hardware element, then add the current hardware to our list
            else if (line.StartsWith(HARDWARE_END)) {
              hardwareList.Add(currentHardware);
            }
            line = reader.ReadLine();
          }
        }
      }
      catch (Exception e) {
        Debug.LogError(e);
      }

      return hardwareList;
    }

    // ------------------------------------------------------------------------
    private static List<string> GetHardwareList(string filename) {
      var list = new List<string>();

      try {
        StreamReader reader = new StreamReader(filename, Encoding.Default);
        using (reader) {
          var line = reader.ReadLine();
          while (line != null) {
            list.Add(line.Trim());
            line = reader.ReadLine();
          }
        }
      }
      catch (Exception e) {
        Debug.LogError(e.Message);
      }

      return list;
    }
  }
}
