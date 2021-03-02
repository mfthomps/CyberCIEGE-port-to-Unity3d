using UnityEngine;

namespace Code.World_Objects.Workspace {
  public class WorkspaceHighlighter : MonoBehaviour {
    [Tooltip("The renderer of the highlighter")]
    public Renderer highlightRenderer;

    [Tooltip("Color of the highlight when the workspace is available.")]
    [SerializeField] private Color _availableColor = new Color(1.0f, 1.0f, 0.0f, 0.5f);

    [Tooltip("Texture of the highlight when the workspace is available.")]
    [SerializeField] private Texture2D _availableTexture;

    [Tooltip("Color of the highlight when the workspace is unavailable.")]
    [SerializeField] private Color _unavailableColor = new Color(1.0f, 0.0f, 0.0f, 0.5f);

    [Tooltip("Texture of the highlight when the workspace is unavailable.")]
    [SerializeField] private Texture2D _unavailableTexture;

    // ------------------------------------------------------------------------
    public void SetAvailable() {
      highlightRenderer.material.color = _availableColor;
      if (_availableTexture) {
        highlightRenderer.material.mainTexture = _availableTexture;
      }

    }

    // ------------------------------------------------------------------------
    public void SetUnavailable() {
      highlightRenderer.material.color = _unavailableColor;
      if (_unavailableTexture) {
        highlightRenderer.material.mainTexture = _unavailableTexture;
      }
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
