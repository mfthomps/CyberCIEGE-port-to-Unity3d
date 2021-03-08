using System;

namespace Code.Hardware {
  //The data representing one unique piece of hardware available in the game
  [Serializable]
  public class HardwareTypeProperties {
    public string name;
    public string description;
    public HardwareAsset hardwareAsset;
    public HardwareType hardwareType;
  }
}