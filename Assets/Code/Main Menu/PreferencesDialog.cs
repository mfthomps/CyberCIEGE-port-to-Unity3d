using System.IO;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Shared.ScriptableVariables;

namespace Code.MainMenu {
  // Logic class for Preferences Dialog UI
  public class PreferencesDialog : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Path of the installed CyberCIEGE core game")]
    public StringVariable ccInstallPath;
    [Tooltip("Whether we want to play the opening video on startup or not")]
    public BooleanVariable playIntroMovie;
    [Tooltip("Whether to show in game tips or not on startup")]
    public BooleanVariable showTipsOnStartup;
    [Tooltip("Whether all scenarios are unlocked by default or not")]
    public BooleanVariable scenariosUnlocked;
    [Header("UI Elements")]
    [Tooltip("Root object of the Preferences Dialog UI")]
    public GameObject uiRoot;
    [Tooltip("Input field for editing CyberCIEGE install path")]
    public TMP_InputField ccInstallPathInput;
    [Tooltip("Toggle for playing intro movie option")]
    public Toggle playIntroMovieToggle;
    [Tooltip("Toggle for playing tips on startup option")]
    public Toggle showTipsOnStartupToggle;
    [Tooltip("Toggle for unlocking all scenarios")]
    public Toggle scenariosUnlockedToggle;
    [Tooltip("Button to accept and close dialog")]
    public Button acceptButton;
    [Header("File Browser Style")]
    public GUISkin skin;
    public Texture2D file, folder, back, drive;

    private static string PREF_KEY_EXE_PATH = @"CyberCIEGE Install Path";
    private static string PREF_KEY_INTRO_MOVIE = @"Play Intro Movie";
    private static string PREF_KEY_INTRO_TIPS = @"Show Startup Tips";
    private static string PREF_KEY_UNLOCK_SCENARIOS = @"Unlock Scenarios";

    private FileBrowser _fileBrowser;

    // ------------------------------------------------------------------------
    void Awake() {
      // Setup our UI with their saved PlayerPrefs values
      ccInstallPathInput.text = PlayerPrefs.GetString(PREF_KEY_EXE_PATH);
      playIntroMovieToggle.isOn = PlayerPrefs.GetInt(PREF_KEY_INTRO_MOVIE, 1) != 0;
      showTipsOnStartupToggle.isOn = PlayerPrefs.GetInt(PREF_KEY_INTRO_TIPS, 1) != 0;
      scenariosUnlockedToggle.isOn = PlayerPrefs.GetInt(PREF_KEY_UNLOCK_SCENARIOS, 0) != 0;

      // Set our values based on initial UI values
      SetExecutablePath(ccInstallPathInput.text);
      ToggleIntroMovie(playIntroMovieToggle.isOn);
      ToggleIntroTips(showTipsOnStartupToggle.isOn);
      ToggleScenariosUnlocked(scenariosUnlockedToggle.isOn);

      // Start listening to changes from our UI
      ccInstallPathInput.onValueChanged.AddListener(SetExecutablePath);
      playIntroMovieToggle.onValueChanged.AddListener(ToggleIntroMovie);
      showTipsOnStartupToggle.onValueChanged.AddListener(ToggleIntroTips);
      scenariosUnlockedToggle.onValueChanged.AddListener(ToggleScenariosUnlocked);

      // If we don't have an executable path, then force this dialog open since
      // nothing else will work until we have one, otherwise hide it until
      // the player requests to open it
      ToggleDialog(string.IsNullOrEmpty(ccInstallPath.Value));
    }

    // ------------------------------------------------------------------------
    void OnDestroy() {
      // Stop listening to all of our UI
      ccInstallPathInput.onValueChanged.RemoveListener(SetExecutablePath);
      playIntroMovieToggle.onValueChanged.RemoveListener(ToggleIntroMovie);
      showTipsOnStartupToggle.onValueChanged.RemoveListener(ToggleIntroTips);
      scenariosUnlockedToggle.onValueChanged.RemoveListener(ToggleScenariosUnlocked);

      // Reset all of our variables to their default state
      ccInstallPath.Reset();
      playIntroMovie.Reset();
      showTipsOnStartup.Reset();
      scenariosUnlocked.Reset();
    }

    // ------------------------------------------------------------------------
    public void ToggleDialog(bool isVisible) {
      uiRoot.SetActive(isVisible);
    }

    // ------------------------------------------------------------------------
    public void SetExecutablePath(string path) {
      // If the value is different from what we currently have and the install
      // directory actually exists, then set our path variable
      if (ccInstallPath.Value != path && Directory.Exists(path)) {
        ccInstallPath.Value = path;

        // Save the new value to our player preferences
        PlayerPrefs.SetString(PREF_KEY_EXE_PATH, path);
      }
      else {
        ccInstallPath.Value = null;
      }

      // Enable/disable our accept button based on having a valid executable path
      acceptButton.interactable = !string.IsNullOrEmpty(ccInstallPath.Value);
    }

    // ------------------------------------------------------------------------
    public void ShowFileBrowser() {
      // Create our file browser
      _fileBrowser = new FileBrowser();

      // Set the starting skin
      _fileBrowser.guiSkin = skin;

      // Set the various textures
      _fileBrowser.fileTexture = file;
      _fileBrowser.directoryTexture = folder;
      _fileBrowser.backTexture = back;
      _fileBrowser.driveTexture = drive;

      // Show the search bar
      _fileBrowser.showSearch = true;
    }

    // ------------------------------------------------------------------------
    public void ToggleIntroMovie(bool isOn) {
      playIntroMovie.Value = isOn;

      // Save the new value to our player preferences
      PlayerPrefs.SetInt(PREF_KEY_INTRO_MOVIE, isOn ? 1 : 0);
    }

    // ------------------------------------------------------------------------
    public void ToggleIntroTips(bool isOn) {
      showTipsOnStartup.Value = isOn;

      // Save the new value to our player preferences
      PlayerPrefs.SetInt(PREF_KEY_INTRO_TIPS, isOn ? 1 : 0);
    }

    // ------------------------------------------------------------------------
    public void ToggleScenariosUnlocked(bool isOn) {
      scenariosUnlocked.Value = isOn;

      // Save the new value to our player preferences
      PlayerPrefs.SetInt(PREF_KEY_UNLOCK_SCENARIOS, isOn ? 1 : 0);
    }

    // ------------------------------------------------------------------------
    private void OnGUI() {
      if (_fileBrowser != null) {
        // True is returned when a file has been selected
        if (_fileBrowser.draw()) {
          // The output file is a member if the FileInfo class, if cancel was selected the value is null
          if (_fileBrowser.outputDirectory != null) {
            ccInstallPathInput.text = _fileBrowser.outputDirectory.ToString();
          }
          _fileBrowser = null;
        }
      }
    }
  }
}
