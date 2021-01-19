namespace Code.User_Interface.Objectives {
  public class Phase {
    public string name;
    public string displayName;
    public string uncompletedText;
    public string completedText;
    public bool isComplete;

    // ------------------------------------------------------------------------
    public string GetTitle() {
      var completionText = isComplete ? completedText : uncompletedText;
      if (!string.IsNullOrEmpty(displayName) && !string.IsNullOrEmpty(completionText)) {
        return $"{displayName}: {completionText}";
      }
      else if (!string.IsNullOrEmpty(displayName)) {
        return displayName;
      }
      else if (!string.IsNullOrEmpty(completionText)) {
        return completionText;
      }
      return null;
    }
  }
}
