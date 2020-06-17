The project file is here

* https://kwiksher.com/tutorials/Kwik4/Storyboard.zip

The demo project consists of the two psd files and one storyboard that has been exported with [Storyboard Editor](https://storyboard.ink/learn)


* page1.psd
* viewer.psd
    
    <img src="https://github.com/kwiksher/blog/raw/master/img/storyboard_viewer/2020-06-17-15-58-11.png" width="400">

* assets/storyboards/spring02

    <img src="https://github.com/kwiksher/blog/raw/master/img/storyboard_viewer/2020-06-17-16-07-22.png" width="400">

each page uses the external code files. 

* 001-page01
    * ext/storyboard_show.lua
    * ext/storyboard_play.lua
    * ext/storyboard_hide.lua

* 002-viewer
    * ext/storyboard_init.lua
    * ext/storyboard_setup.lua
    * ext/storyboard_button_back.lua
    * ext/storyboard_dispose.lua

ext/lib must be copied to build4/lib manually

* img/
* storyboard.lua
* storyboardController.lua
* storyboardView.lua

---
## page1

there is a button to load the viewer that has the external code. The event handler for the button event is configured with another external code for the page 

<img src="https://github.com/kwiksher/blog/raw/master/img/storyboard_viewer/2020-06-17-16-10-19.png" width="800">

button

* external code
    * storyboard_play.lua

    <img src="https://github.com/kwiksher/blog/raw/master/img/storyboard_viewer/2020-06-17-16-18-50.png" width="800">


#### External code for the page

<img src="https://github.com/kwiksher/blog/raw/master/img/storyboard_viewer/2020-06-17-16-21-18.png" width="200">

code_dispose

* storyboard_hide.lua
*  Disposal

    <img src="https://github.com/kwiksher/blog/raw/master/img/storyboard_viewer/2020-06-17-16-17-16.png" width="600">

code_storyboard

* storyboard_show.lua
* After buttons and actions 

    <img src="https://github.com/kwiksher/blog/raw/master/img/storyboard_viewer/2020-06-17-16-15-33.png" width="600">


Codes

* storyboard_play.lua

    ```lua
    Runtime:dispatchEvent({name="showStoryboard", storyboard="spring02"})
    ```

* storyboard_hide.lua

    ```lua
    Runtime:removeEventListener("showStoryboard", _K.showStoryboard)
    ```

* storyboard_show.lua

    the second line sets the storyboard directory and the filename. You need to copy it to build4\assets folder manually

```lua
local storyboards = {}
storyboards["spring02"] = {dir="assets/storyboards/spring02", file="spring02.storyboarder"}
--
_K.showStoryboard = function(event)
    local composer = require("composer")
    composer.hideOverlay() -- if there has been another overlay opened
    --
    if _K.storyboardState == "pause" then
    _K.storyboardState = nil
    else
    _K.storyboardIndex = 1
    end
    --
    sceneGroup.alpha = 0.01
    --
    _K.storyboardDir = storyboards[event.storyboard].dir
    _K.storyboardFile = storyboards[event.storyboard].file
    _K.curPage        = UI.curPage
    --
    composer.showOverlay("views.page02Scene") -- viewer
    --
end

Runtime:addEventListener("showStoryboard", _K.showStoryboard)
```

---
## viewer

#### External code for the page

<img src="https://github.com/kwiksher/blog/raw/master/img/storyboard_viewer/2020-06-17-16-21-18.png" width="200">

code_init

* storyboard_init.lua
* After layers

<img src="https://github.com/kwiksher/blog/raw/master/img/storyboard_viewer/2020-06-17-16-28-52.png" width="600">

code_setup

* storyboard_setup.lua
* After buttons and actions

<img src="https://github.com/kwiksher/blog/raw/master/img/storyboard_viewer/2020-06-17-16-30-31.png" width="600">

code_dispose

* storyboard_dispose.lua
* Disposal

<img src="https://github.com/kwiksher/blog/raw/master/img/storyboard_viewer/2020-06-17-16-31-16.png" width="600">

Codes

* storyboard_init.lua

    the controller box of play, stop, pause and slider is placed width layer.viewer.contentBounds.yMax.

    ```lua
    local storyboard = require("lib.storyboard")

    storyboard:init(sceneGroup, display.contentCenterX, layer.viewer.contentBounds.yMax, display.actualContentWidth, display.viewableContentHeight-layer.viewer.contentBounds.yMax)

    storyboard:characterPos(layer.character.contentBounds.xMin+10, layer.character.y, layer.character.width, layer.character.height)
    storyboard:commentPos(layer.comment.contentBounds.xMax-10, layer.comment.y, layer.comment.width, layer.comment.height)
    storyboard:dialoguePos(layer.dialogue.x, layer.dialogue.y, layer.dialogue.width, layer.dialogue.height)
    -- 
    -- The storyboard:init function creates the display objects for the controller at the runtime. 
    -- The positions of the following image objects are referenced and the image objects are just reference
    -- so they should be invisible.
    layer.character.alpha = 0
    layer.comment.alpha = 0
    layer.dialogue.alpha = 0
    layer.slider.alpha = 0
    layer.timeTxt.alpha = 0
    layer.controls.alpha = 0
    ```

* storyboard_setup.lua

    when the page is loaded, the viewer starts to play with storyboard.controls:render(_K.storyboardIndex)

    ```lua
    local storyboard = require("lib.storyboard")
    local composer = require("composer")

    storyboard.controls:init(layer.viewer)
    storyboard.controls:setStoryboarder(_K.storyboardDir, _K.storyboardFile, _K.systemDir)
    storyboard.controls:decodeJson()

    storyboard.controls:render(_K.storyboardIndex)
    Runtime:addEventListener("enterFrame", storyboard.controls)

    -- tap to toggle show/hide the controller buttons
    storyboard.controls.image:addEventListener("tap", function()
        if storyboard.controls.group.alpha == 0 then
            storyboard.controls:showTextField()
            storyboard.controls.group.alpha = 1
            storyboard.view.timeTxt.alpha = 1
        else 
            storyboard.controls:hideTextField()
            storyboard.controls.group.alpha = 0
            storyboard.view.timeTxt.alpha = 0
        end
        return false
    end)
    ```

* storyboard_dispose.lua

    ```lua
    local storyboard = require("lib.storyboard")
    storyboard.controls:dispose()
    ```

<img src="https://github.com/kwiksher/blog/raw/master/img/storyboard_viewer/2020-06-17-16-49-28.png" width="400">

That's all. 