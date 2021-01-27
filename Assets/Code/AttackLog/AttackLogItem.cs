using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Shared.SEUI;


namespace Code.AttackLog {
  public class AttackLogItem : DynamicListItem<string> {
  
      // Start is called before the first frame update

      [SerializeField]
      private TMP_Text timeField;

      [SerializeField]
      private TMP_Text messageField;

      [SerializeField]
      private Image _flashingImage1;
      
      [SerializeField]
      private Image _flashingImage2;
      
      [SerializeField]
      private Image _flashingImage3;
      
        
      //-------------------------------------------------------------------------
      public override void SetItem(string item) {
        messageField.text = item;
        SetAsRead(false);
      }

      //---------------------------------------------------------------------------
      // set to true to display this item as read
      public void SetAsRead (bool isRead) {

        _flashingImage1.enabled = !isRead;
        _flashingImage2.enabled = !isRead;
        _flashingImage3.enabled = !isRead;

      }
  }
}