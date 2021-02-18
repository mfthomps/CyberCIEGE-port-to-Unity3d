using System;
using System.IO;
using UnityEngine;

namespace Code.Factories {
  //Factory that creates Organization GameObjects
  public class OrganizationFactory : MonoBehaviour, iFactory {
    [SerializeField] private OrganizationScript prefab;

    private Transform _parent;

    //-------------------------------------------------------------------------
    private void Start() {
      _parent = new GameObject("Organizations").transform;
    }

    //-------------------------------------------------------------------------
    public void Create(string filename) {
      throw new NotImplementedException();
    }

    //-------------------------------------------------------------------------
    // Note, I think there can be only one Organization (?)
    public void CreateAll(string path) {
      OrganizationScript newOrg = Instantiate(prefab, _parent);
      LoadOrganization(newOrg, path);
      newOrg.name = $"Organization - {newOrg.GetValue("Name")}";
    }

    //-------------------------------------------------------------------------
    private void LoadOrganization(OrganizationScript organization, string path) {
      var full_path = Path.Combine(path, "organization.sdf");
      ccUtils.ParseSDFFile(full_path, (tag, value) => {
        if (tag == "Organization") {
          ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
            organization.SetValue(subTag, subValue);
          });
        }
      });
    }
  }
}