using System;

namespace Code {
  public class BackgroundCheck {
    public enum Level {
      None = 0,
      Low,
      Medium,
      High
    }

    // ------------------------------------------------------------------------
    public static Level FromString(string backgroundCheckLevel) {
      switch (backgroundCheckLevel) {
        case "Low":
          return Level.Low;
        case "Medium":
          return Level.Medium;
        case "High":
          return Level.High;
      }
      return Level.None;
    }

    // ------------------------------------------------------------------------
    public static string ToString(Level backgroundCheckLevel) {
      return Enum.GetName(typeof(Level), backgroundCheckLevel);
    }

    // ------------------------------------------------------------------------
    public static Level GetHighestLevel(Level a, Level b) {
      if ((int)a > (int)b) {
        return a;
      }
      return b;
    }
  }
}
