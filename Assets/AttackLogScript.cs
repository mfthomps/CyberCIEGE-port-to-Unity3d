using System.Collections.Generic;
using UnityEngine;

public class AttackLogScript : MonoBehaviour {
  public static List<string> attack_log = new List<string>();

  // Use this for initialization
  private void Start() {
  }

  public static void AddEntry(string entry) {
    Debug.Log("AttackLogScript add " + entry);
    attack_log.Add(entry);
  }
}