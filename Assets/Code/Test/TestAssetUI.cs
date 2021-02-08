using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.Test {
  public class TestAssetUI : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    // ------------------------------------------------------------------------
    void OnDestroy() {
      selectedObject.Reset();
    }
  }
}
