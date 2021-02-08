using UnityEngine;

namespace Code.Test {
  public class TestGameLoader : MonoBehaviour {
    [Tooltip("Game Load Behavior")]
    public GameLoadBehavior gameLoader;

    // --------------------------------------------------------------------------
    void Start() {
      gameLoader.AfterServerReady();
    }
  }
}
