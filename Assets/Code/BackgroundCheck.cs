using System;
using UnityEngine;

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
    public static int GetCost(Level backgroundCheckLevel) {
      switch (backgroundCheckLevel) {
        case Level.Low:
          return 1000;
        case Level.Medium:
          return 20000;
        case Level.High:
          return 60000;
      }
      return 0;
    }

    // ------------------------------------------------------------------------
    public static int GetCostDifference(Level oldLevel, Level newLevel) {
      return Mathf.Max(0, GetCost(newLevel) - GetCost(oldLevel));
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
