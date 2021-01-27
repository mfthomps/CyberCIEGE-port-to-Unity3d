using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class AttackLogItem : MonoBehaviour
{
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

    private string _messageText;
    private string _timeText;

    void Start () {
      SetAsRead(false);
    }

    //---------------------------------------------------------------------------
    // use this public field to change the message text
    public string MessageField {
      get {
        return _messageText;
      }
      set {
        _messageText = value;
        messageField.text = _messageText;
      }
    }
    //---------------------------------------------------------------------------
    // use this public field to change the time text
    public string TimeField {
      get {
        return _timeText;
      }
      set {
        _timeText = value;
        messageField.text = _timeText;
      }
    }

    //---------------------------------------------------------------------------
    // set to true to display this item as read
    public void SetAsRead (bool isRead) {

      _flashingImage1.enabled = !isRead;
      _flashingImage2.enabled = !isRead;
      _flashingImage3.enabled = !isRead;

    }
}
