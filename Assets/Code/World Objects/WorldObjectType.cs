namespace Code.World_Objects {
  // Enum for types of world objects for use with property panel and moving camera to objects
  [System.Serializable]
  public enum WorldObjectType {
    Asset = 0,
    Component,
    Computer,
    Device,
    Staff,
    User,
    Workspace,
    Zone
  }
}
