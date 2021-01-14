using System;
using System.IO;
using System.Text;
using UnityEngine;

namespace Code.Factories {
  //Factory that creates Organization GameObjects
  public class OrganizationFactory : MonoBehaviour, iFactory {
    [SerializeField] private OrganizationScript prefab;
    
    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      throw new NotImplementedException();
    }

    //-------------------------------------------------------------------------
    // Note, I think there can be only one Organization (?)
    public void CreateAll(string path, Transform parent = null) {
      OrganizationScript newOrg = Instantiate(prefab, parent);
      LoadOrganization(newOrg, path);
    }

    //-------------------------------------------------------------------------
    private void LoadOrganization(OrganizationScript organization, string path) {
      string tag;
      string full_path = Path.Combine(path, "organization.sdf");

      StreamReader reader = new StreamReader(full_path, Encoding.Default);
      using (reader) {
        ccUtils.PositionAfter(reader, "Organization");
        string value = null;
        do {
          value = ccUtils.SDTNext(reader, out tag);
          if ((value == null) || (tag == null)) continue;
          organization.SetValue(tag, value);
        } while (value != null);
      }
    }
  }
}