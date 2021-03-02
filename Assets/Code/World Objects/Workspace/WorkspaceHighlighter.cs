using UnityEngine;

namespace Code.World_Objects.Workspace {
  public class WorkspaceHighlighter : MonoBehaviour {
    [Tooltip("The renderer of the highlighter")]
    public Renderer highlightRenderer;

    // ------------------------------------------------------------------------
    public void SetAvailable() {
      highlightRenderer.material.color = new Color(1.0f, 1.0f, 0.0f, 0.5f);
    }

    // ------------------------------------------------------------------------
    public void SetUnavailable() {
      highlightRenderer.material.color = new Color(1.0f, 0.0f, 0.0f, 0.5f);
    }

    // ------------------------------------------------------------------------
    public void ToggleActive(bool active) {
      gameObject.SetActive(active);
    }

    // ------------------------------------------------------------------------
    public void SetPosition(float x, float y) {
      transform.position = new Vector3(x, transform.position.y, y);
    }
  }
}
