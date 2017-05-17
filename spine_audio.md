# Spine Audio

* when the "animation" starts, onStart event is called back. So let's play audio.
* touching the rocket set the "launch" animation and onStop of the "animation" and onStart of the "launch" is called back 
* during "launch" animation, "landOff" event is dispatched.

Here is the sample project to download 

* http://kwiksher.com/daily/blog/spine/Spine_audio.zip

* Demo https://youtu.be/88HJYue2nfQ

## Lua
custom/components/page01/rocket_image_.lua has addEventListner and onXXX functions.

```lua
local spine = require("extlib.spine").new("rocket")

function _M:localPos(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
    
    layer.rocket = spine:newImageRect( _K.imgDir..imagePath, imageWidth, imageHeight)

    layer.rocket.imagePath = imagePath
    layer.rocket.x = mX
    layer.rocket.y = mY
    layer.rocket.alpha = oriAlpha
    layer.rocket.oldAlpha = oriAlpha
    layer.rocket.blendMode = ""
    layer.rocket.oriX = layer.rocket.x
    layer.rocket.oriY = layer.rocket.y
    layer.rocket.oriXs = layer.rocket.xScale
    layer.rocket.oriYs = layer.rocket.yScale
    layer.rocket.name = "rocket"
    
    layer.rocket:addEventListener("touch", function (event)
        if event.phase ~= "ended" and event.phase ~= "cancelled" then return end
        local state = layer.rocket.state
        local name = state:getCurrent(0).animation.name
        if name == "animation" then
        state:setAnimationByName(0, "launch", false)
        elseif name == "launch" then
        state:setAnimationByName(0, "animation", true)
        end
    end)
  
    layer.rocket.state.onStart = function(entry)
        UI.animName  = entry.animation.name
        UI.scene:dispatchEvent({name = "action_state_start", entry=entry })
    end
    
    layer.rocket.state.onInterrupt = function(entry)
        UI.animName  = entry.animation.name
        UI.scene:dispatchEvent({name = "action_state_interrupt", entry=entry })
    end
    
    layer.rocket.state.onEnd = function (entry)
        UI.animName  = entry.animation.name
        UI.scene:dispatchEvent({name = "action_state_end", entry=entry })
    end
    
    layer.rocket.state.onComplete = function (entry)
        UI.animName  = entry.animation.name
        UI.scene:dispatchEvent({name = "action_state_complete", entry=entry })
    end
    
    layer.rocket.state.onDispose = function (entry)
        UI.animName  = entry.animation.name
        UI.scene:dispatchEvent({name = "action_state_dispose", entry=entry })
    end
    
    layer.rocket.state.onEvent = function (entry, event)
        UI.animName  = entry.animation.name
        UI.eventName = event.data.name
        UI.scene:dispatchEvent({name = "action_state_event", entry=entry })
    end
    
    sceneGroup.rocket = layer.rocket
    sceneGroup:insert( layer.rocket)

end
```

## Kwik

### Variable
* animeName and eventName receives the animation name and event name from Spine's animation state.

<img src="./img/spine_audio/spine 0100.jpg" width = 300 />

animName and eventName

<img src="./img/spine_audio/spine 0102.jpg" width = 400 />

<img src="./img/spine_audio/spine 0103.jpg" width = 400 />

### Action
* start, end and event actions are created.

<img src="./img/spine_audio/spine 0101.jpg" width = 300 />

state_start to play audio if "launch" animation starts

<img src="./img/spine_audio/spine 0104.jpg" width = 600 />
<img src="./img/spine_audio/spine 0105.jpg" width = 400 />

state_end to stop audio if "launch" ends

<img src="./img/spine_audio/spine 0106.jpg" width = 600 />

state_event to start aonther audio and play Kwik's linear animation if receiving "landOff" event 

<img src="./img/spine_audio/spine 0107.jpg" width = 600 />

<img src="./img/spine_audio/spine 0109.jpg" width = 400 />

## Spine

"landOff" event is set at frame 20.

<img src="./img/spine_audio/spine 0110.jpg" width = 600 />


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
