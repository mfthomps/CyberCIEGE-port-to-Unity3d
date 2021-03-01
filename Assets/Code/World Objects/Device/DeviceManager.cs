using System.IO;
using System.Xml;
using UnityEngine;
using Code.Scriptable_Variables;

namespace Code.World_Objects.Device {
  //Handles some functionality for DeviceBehaviors
  public class DeviceManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Devices in the current scenario")]
    public DeviceListVariable devices;

    //---------------------------------------------------------------------------
    public void UpdateStatus(string message) {
      StringReader xmlreader = new StringReader(message);
      //xmlreader.Read(); // skip BOM ???

      XmlDocument xml_doc = new XmlDocument();

      xml_doc.Load(xmlreader);
      XmlNodeList deviceNodes = xml_doc.SelectNodes("//device_status/device");
      foreach (XmlNode deviceNode in deviceNodes) {
        var deviceName = deviceNode["name"].InnerText;
        foreach (var device in devices.Value) {
          if (device.Data.component_name == deviceName) {
            UpdateStatus(device, deviceNode);
          }
        }
      }
    }

    //---------------------------------------------------------------------------
    private void UpdateStatus(DeviceBehavior device, XmlNode deviceNode) {
      device.Data.zone = deviceNode["zone"].InnerText;
    }
  }
}