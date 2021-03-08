# CyberCIEGE: Porting to Unity3d #
This repo includes a PoC for porting the CyberCIEGE educational
video game to the Unity3D game engine.  Details are in [this porting report](CyberCIEGEPortingReport.pdf).

The existing CyberCIEGE game is found here: <http://my.nps.edu/web/c3o/cyberciege>
Install it, selecting a writable directory, e.g., Documents.  Then put this executable (SimSecNoUI.exe) into your CyberCIEGE/game/exec directory: <https://nps.box.com/s/xn88owrsvj0fhskmf10coqz83vccn6dd>

In Unity, open and play the `MainMenu` scene.  Use the Settings button to select the CyberCIEGE directory,
i.e., where you installed CyberCIEGE.  A good example scenario for UI development is the "Starting Scenarios"
campaign's "Introduction" scenario.  Select that and play.

## Building an Executable
1. Create a target directory somewhere outside of the source code directory (e.g., name it `CyberCIEGE-port-to-Unity3d_executable`)
2. In the Unity Editor go to File -> Build Settings
3. Choose _PC, Mac & Linux Standalone_ for _Platform_
4. Select Windows for the _Target Platform_, and x86_64 for the _Architecture_
5. Set _Compression Method_ to Default, and leave any box unchecked
6. Click _build_ and select the target directory - this initiates the build process
7. Double-clicking `CyberCIEGE-port-to-Unity3d.exe` in the target directory should launch the application.
