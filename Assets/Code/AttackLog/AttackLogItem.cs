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
      SetFlashing(false);
    }

    public string MessageField {
      get {
        return _messageText;
      }
      set {
        _messageText = value;
        messageField.text = _messageText;
      }
    }

    public string TimeField {
      get {
        return _timeText;
      }
      set {
        _timeText = value;
        messageField.text = _timeText;
      }
    }

    public void SetFlashing (bool flashing) {
      _flashingImage1.enabled = flashing;
      _flashingImage2.enabled = flashing;
      _flashingImage3.enabled = flashing;

    }
}
