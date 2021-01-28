using UnityEngine;

namespace Code.Policies {
  [CreateAssetMenu(menuName = "Scriptable Objects/Policy")]
  public class Policy : ScriptableObject {
    [Tooltip("Tag name from CyberCIEGE policy.cpp for this policy (word before :, e.g. PasswordLength in PasswordLength:Long)")]
    public string tag;
    [Tooltip("Subtag name from CyberCIEGE policy.cpp for this policy (word after :, e.g. Long in PasswordLength:Long)")]
    public string subTag;
    [Tooltip("User readable label for this policy")]
    public string displayName;
    [Tooltip("How much it costs to enforce this policy")]
    public int cost;

    // ------------------------------------------------------------------------
    public string GetName() {
      return $"{tag}:{subTag}";
    }
  }
}
