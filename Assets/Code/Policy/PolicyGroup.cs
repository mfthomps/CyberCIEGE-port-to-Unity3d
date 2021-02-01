using System;
using System.Collections.Generic;
using UnityEngine;

namespace Code.Policies {
  [Serializable]
  public class PolicyGroup {
    [Tooltip("List of policies that are mutually exclusive")]
    public List<Policy> policies = new List<Policy>();
  }
}
