using UnityEngine;

namespace Code.User_Interface.View {
  public class ViewButton : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("The current view type we have selected")]
    public ViewTypeVariable currentViewType;

    // ------------------------------------------------------------------------
    public void Back() {
      currentViewType.Back();
    }
  }
}
