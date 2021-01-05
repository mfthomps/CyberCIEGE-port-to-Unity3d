using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AttackLogScript : MonoBehaviour {
  public static List<string> attack_log = new List<string>();

  public static void AddEntry(string entry) {
    Debug.Log("AttackLogScript add " + entry);
    attack_log.Add(entry);
  }

  // Use this for initialization
  void Start() {
  }
}