# Lip Sync - Spine and Papagayo
* animation state
* events
* papagoya lip-sync
* spine plugin support for preview with audio

Demo https://youtu.be/WtlpPBiawa8
Sample Project https://kwiksher.com/daily/blog/lipSync/LipSync.zip

## Lip Sync with Papagayo

Papagayo with Spine Export is available from here. 

* https://github.com/SteamNGears/Papagayo

Papagayo 2.0b1 with Spine Export is a fork of LostMoho/Papagayo that adds an exporter for Spine. You need to Qt Creator to build the app. Qt Open Source is here.

* https://info.qt.io/download-qt-for-application-development

### Papagayo

* You can choose Spine from Export

<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine-20-03-707.jpg" width = 600 />

* Open JSON button to select your json data of Spine

<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine-20-53-590.jpg" width = 600  />

* Select the bone to attache the mouth

<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine-21-49-702.jpg" width = 600  />

* Import the json data with the mouse  and save the project

<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine-23-06-190.jpg" width = 600  />

* MouthShape Slot and Events are there.

<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine-31-42-401.jpg" width = 600  />

* Mouth bone is centered. You need to translate it to correct position.

<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine-39-06-178.jpg" width = 600  />

* Now you can check the mouth animation

<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine-39-51-878.jpg" width = 600  />

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

### Export json and atlas
export json and atlas files for Kwik project folder - build4/assets/sprites

## Kwik
there are 3 layers
* dialog shows the event data that the animation of Spine sends. Each word is dispatched from Papagoya animation.
* face will be replaced as Spine animation
* bg


<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine 0003.jpg" width = 600  />

### Layer replacement > text

dialog layer is replaced as text

<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine 0004.jpg" width = 300  />
<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine 0005.jpg" width = 400  />

## Project And Pages > Add Audio
lame.wav from Papagoya tutorial's spoken audio file is added to kwik

<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine 0006.jpg" width = 300  />

* Controls > Loop: times = 1

<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine 0007.jpg" width = 600  />

## Project And Pages > add Action
Creates the acitions that will be exected when Spine's animation state sends onStart, onEnd events. 

<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine 0008.jpg" width = 300  />

action name is **state_start** and plays audio lame.wav

<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine 0009.jpg" width = 600  />

action name is **state_end** and stops the audio playing lame.wav

<img src="https://github.com/kwiksher/blog/raw/master/img/lip_sync/spine 0010.jpg" width = 600  />

### Custom the file 
\build4\components\page01\face_image_.lua to be enabled for importing the spine data.

* create page01 folder under \build4\custom\components\
* copy face_image_.lua to  \build4\custom\components\page01
* then edit the three functions. Add extlib.spine library, replace display.newImageRect for spine:newImageRect, add event functions.

```lua
local spine = require("extlib.spine").new("face")

function _M:localPos(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
    
    layer.face = spine:newImageRect( _K.imgDir..imagePath, imageWidth, imageHeight)

    layer.face.imagePath = imagePath
    layer.face.x = mX
    layer.face.y = mY
    layer.face.alpha = oriAlpha
    layer.face.oldAlpha = oriAlpha
    layer.face.blendMode = ""
    layer.face.oriX = layer.face.x
    layer.face.oriY = layer.face.y
    layer.face.oriXs = layer.face.xScale
    layer.face.oriYs = layer.face.yScale
    layer.face.name = "face"
    sceneGroup.face = layer.face
    sceneGroup:insert( layer.face)
  
  layer.face.state.onStart = function(entry)
    UI.animName  = entry.animation.name
    UI.scene:dispatchEvent({name = "action_state_start", entry=entry })
  end
  
  layer.face.state.onInterrupt = function(entry)
    UI.animName  = entry.animation.name
    UI.scene:dispatchEvent({name = "action_state_interrupt", entry=entry })
  end
  
  layer.face.state.onEnd = function (entry)
    UI.animName  = entry.animation.name
    UI.scene:dispatchEvent({name = "action_state_end", entry=entry })
  end
  
  layer.face.state.onComplete = function (entry)
    UI.animName  = entry.animation.name
    UI.scene:dispatchEvent({name = "action_state_complete", entry=entry })
  end
  
  layer.face.state.onDispose = function (entry)
    UI.animName  = entry.animation.name
    UI.scene:dispatchEvent({name = "action_state_dispose", entry=entry })
  end
  
  layer.face.state.onEvent = function (entry, event)
    UI.animName  = entry.animation.name
    UI.eventName = event.data.name
    layer.dialog.text = layer.dialog.text .." "..event.data.name
    UI.scene:dispatchEvent({name = "action_state_event", entry=entry })
  end

end
```

###
* layer.dialog.text is updated onEvent function as seen above
* dialog text starts empty and setAnimationByName is added at _M:allListeners func
* animation track 0 and "animation" with looping true

```lua
function _M:allListeners(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer

  layer.dialog.text = ""
  layer.face.state:setAnimationByName(0, "Mojo Jojo", false)

end
```

###
dipose is added in _M:toDispose func
```lua
function _M:toDispose(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer

  layer.face:dispose()

end
```

### Publish
press Publish on Kwik Panel to enable the custom file injected to the built codes.
