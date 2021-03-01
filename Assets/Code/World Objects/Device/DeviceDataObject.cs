using System;

namespace Code {
  //Data related to a single instance of a Device
  [Serializable]
  public class DeviceDataObject : ComponentDataObject {
    public string os;
    public string vnpKeyType;
  }
}