using UnityEngine;

namespace Code.Hardware {
  // Data for all art assets that represent a piece of Hardware
  [System.Serializable]
  public class HardwareAsset {
    public Mesh mesh;
    public Material material;
    public Sprite icon;
  }
}
