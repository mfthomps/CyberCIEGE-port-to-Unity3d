using System;
using UnityEngine;

//Contains the data regarding a single ViewPoint
namespace Code.ViewPoint {
  [Serializable]
  public class ViewPointDataObject {
    public Vector3 From;
    public Vector3 To;
    public float ZoomLevel;
    public float MagicHeight = 0;
    public bool SkipTab = false;
    public string Site;
  }
}