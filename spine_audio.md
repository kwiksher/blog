# Spine Audio
* animation state
* events
* papagoya lip-sync
* spine plugin support for preview with audio

## Lip Sync with Papagoya

Papagayo with Spine Export is available from here. 

* https://github.com/SteamNGears/Papagayo

Papagayo 2.0b1 with Spine Export is a fork of LostMoho/Papagayo that adds an exporter for Spine. You need to Qt Creator to build the app. Qt Open Source is here.

* https://info.qt.io/download-qt-for-application-development

### Papagoya

* You can choose Spine from Export

<img src="./img/spine_audio/spine-20-03-707.jpg" width = 600 />

* Open JSON button to select your json data of Spine

<img src="./img/spine_audio/spine-20-53-590.jpg" width = 600  />

* Select the bone to attache the mouth

<img src="./img/spine_audio/spine-21-49-702.jpg" width = 600  />

* Import the json data with the mouse  and save the project

<img src="./img/spine_audio/spine-23-06-190.jpg" width = 600  />

* MouthShape Slot and Events are there.

<img src="./img/spine_audio/spine-31-42-401.jpg" width = 600  />

* Mouth bone is centered. You need to translate it to correct position.

<img src="./img/spine_audio/spine-39-06-178.jpg" width = 600  />

* Now you can check the mouth animation

<img src="./img/spine_audio/spine-39-51-878.jpg" width = 600  />

## Spine plugin support
you can preview animation with audio. You need to start java program to play your audio file and it communicates with Spine timeline.

* http://ja.esotericsoftware.com/forum/Spine-Plugin-in-Support-5859?p=27032

### Start Spine from the command line with --server 4567.
* Windows: Spine.exe --server 4567
* Mac: /Applications/Spine/Spine.app/Contents/MacOS/Spine --server 4567
* Linux: ./Spine.sh --server 4567

### Download and run the play.jar file:

* http://esotericsoftware.com/files/play.jar
* java -cp play.jar Play 4567 path/to/music.wav

You will need to have Java installed. When you click Play button on Spine timeline, the animation and aduio are played synclonised.
