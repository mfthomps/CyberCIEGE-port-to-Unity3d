using System;

namespace Code.User_Interface.Dialog {
  public class ConfirmationRequest {
    public string message;
    public string acceptText;
    public string declineText;
    public Action<bool> callback;

    // ------------------------------------------------------------------------
    public ConfirmationRequest(string message, string acceptText, string declineText, Action<bool> callback) {
      this.message = message;
      this.acceptText = acceptText;
      this.declineText = declineText;
      this.callback = callback;
    }
  }
}
