namespace Code.Objectives {
  public class Objective {
    public Phase phase;
    public Phase lastPhase;
    public string name;
    public string displayName;
    public string uncompletedText;
    public string completedText;
    public bool isComplete;

    // ------------------------------------------------------------------------
    public string GetTitle() {
      if (!string.IsNullOrEmpty(displayName)) {
        return displayName;
      }
      return $"Objective missing display name: {name}";
    }

    // ------------------------------------------------------------------------
    public string GetDescription() {
      var descriptionText = isComplete ? completedText : uncompletedText;
      if (!string.IsNullOrEmpty(displayName)) {
        return $"{displayName}\n\n{descriptionText}";
      }
      return descriptionText;
    }
  }
}
