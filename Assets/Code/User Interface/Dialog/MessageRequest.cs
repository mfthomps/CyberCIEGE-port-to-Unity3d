using System;

namespace Code.User_Interface.Dialog {
  public class MessageRequest {
    public string message;
    public Action callback;

    // ------------------------------------------------------------------------
    public MessageRequest(string message) {
      this.message = message;
    }

    // ------------------------------------------------------------------------
    public MessageRequest(string message, Action callback) {
      this.message = message;
      this.callback = callback;
    }
  }
}
