# Snapshot Eraser
* Demo https://youtu.be/fFa_ZBh2-2E
* Sample Project http://kwiksher.com/daily/blog/snapshotEraser/SnapshotEraser.zip

### PSD - page1
* there are two pictures as "Fall" and "Mt" layers
* Fall layer to be scrached to reveal "Mt" layer beneath it.
* attaching canvas to Fall layer
* Publish and then customise the lua file of Fall canvas

<img src="./img/snapshotEraser/snapshot 0000.jpg" width= 600 />

<img src="./img/snapshotEraser/snapshot 0001.jpg" width= 300 />


### Custom Fall_canvas_.lua
*  \build4\components\page01 folder, you find Fall_canvas_.lua
* create page01 folder under \build4\custom\components\
* copy Fall_canvas_.lua to  \build4\custom\components\page01
* then overwrite it as the codes below
* If you change the layer name from "Fall" or "Mt", just change them at **UI.canvas** and **UI.background** variables inside _M:localPos() function.
* You may change UI.canvas.brushSize as you like
* You may change brush shape by setting your own png image file to createBrush() function.

```lua
-- Code created by Kwik - Copyright: kwiksher.com 2016
-- Version: 4.0.1 01
-- Project: SnapshotEraser
--
local _M = {}
---------------------
local _K = require "Application"
---------------------
local bs = 25/4
-- local canvas
--
function _M:localPos(UI)
  local layer          = UI.layer
  UI.canvas            = layer.Fall -- set front layer to erase
  UI.background        = layer.Mt   -- set back layer to appear
  UI.canvas.name       = "UI.canvas"
  UI.canvas.brushSize  = 25
end
--
local function createBrush(x, y, UI)
  -- return display.newImage( "assets/images/p1/brush.png", x, y )
  return display.newCircle(x, y, UI.canvas.brushSize)
end
--
function _M:allListeners(UI)
  local sceneGroup = UI.scene.view
  local layer      = UI.layer
  local lineTable  = UI.canvas.lineTable
  local linePoints = nil
  UI.canvas.x = 0
  UI.canvas.y = 0
  local snapshot = display.newSnapshot(UI.canvas.width, UI.canvas.height)
  snapshot:translate(UI.canvas.oriX, UI.canvas.oriY)
  snapshot.canvas:insert( UI.canvas )
  snapshot:invalidate( "canvas" )
  sceneGroup:insert(snapshot)
  --
  local previousX, previousY
  local threshold = 10
  local thresholdSq = threshold*threshold
  --
  local function draw( x, y )
    local o = createBrush(x, y, UI)
    o.fill.blendMode = { srcColor = "zero", dstColor="oneMinusSrcAlpha" }
    snapshot.canvas:insert( o )
    snapshot:invalidate( "canvas" ) -- accumulate changes w/o clearing
  end
  -- UI.Canvas code
  local function listener( event )
    local x,y = event.x - snapshot.x, event.y - snapshot.y
    if ( event.phase == "began" ) then
      previousX,previousY = x,y
      draw( x, y )
    elseif ( event.phase == "moved" ) then
      if previousX == nil or previousY == nil then return end
      local dx = x - previousX
      local dy = y - previousY
      local deltaSq = dx*dx + dy*dy
      if ( deltaSq > thresholdSq ) then
        draw( x, y )
        previousX,previousY = x,y
      end
    end
  end
  UI.background:addEventListener("touch", listener)
  -- sceneGroup:insert(snapshot)
end
--
function _M:willHide(UI)
  local sceneGroup = UI.scene.view
  local layer      = UI.layer
end
--
function _M:toDispose(UI)
  local sceneGroup = UI.scene.view
  local layer      = UI.layer
end
--
function _M:toDestroy(UI)
  local sceneGroup = UI.scene.view
  local layer      = UI.layer
end
--
return _M
```
