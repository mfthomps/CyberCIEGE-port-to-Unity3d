namespace Code.Policy {
  //What flavor of Policy -- what it applies to.
  public enum PolicyType {
    None = 0,
    ProceduralSecurity = 1,
    Configuration = 2,
    ProceduralOther = 4,
    PhysicalSecurity = 8,
  }
}