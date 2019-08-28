Kwik Cat Puzzle のサンプルプロジェクトは以下からダウンロードできます。

* https://kwiksher.com/tutorials/Kwik4/KwikCatPuzzle.zip

Bojan Živković 氏のパズルピースの作成のフォトショップのツールを使って、ジグゾーパズルをつくることができます。無料で利用できる良くできたツールです。

* https://exchange.adobe.com/creativecloud.details.12143.free-puzzle-pieces.html

<img src="https://github.com/kwiksher/blog/raw/master/img/jig_saw_jp/2019-07-27-09-37-12.png" width="600">

Kwikでジグゾーパズルのアプリを作りましょう。また オンラインの印刷サービスで本物のジグゾーパズルを作ってくれるところもあります。

<img src="https://github.com/kwiksher/blog/raw/master/img/jig_saw_jp/2019-07-27-09-41-50.png" width="600">

### puzzle pieces ATN

パズルピース作成ツールは、フォトショップのアクションファイル（ATN)に形式のツールです。選択したレイヤーをジグソーパズルのピースとして バラバラのレイヤーにします。

サンプルプロジェクトの車に乗った猫の PSDファイルのサイズは 1920 x 1280です。これは Kwik4のデフォルトである Ultimate Config(UC @4x)のサイズです。

<img src="https://github.com/kwiksher/blog/raw/master/img/jig_saw_jp/2019-07-27-09-50-20.png" width="600">

free-puzzle piecesのATNを開きます。そして  **3:2 Aspect Ratio > 24 pieces(6x4)**, を選択します。これで 4行 x 6列のピースが作成されます。

<img src="https://github.com/kwiksher/blog/raw/master/img/jig_saw_jp/2019-07-27-09-56-16.png" width="400">

作成された各ピースのレイヤーは  A1 から D6 までの２４個のレイヤーです。

<img src="https://github.com/kwiksher/blog/raw/master/img/jig_saw_jp/2019-07-27-10-00-38.png" width="600">

このPSDファイルを保存して、Kwikのページに登録します。

* page4_puzzle.psd として保存しました。

---
### Kwikでの仕組み

page4_puzzle.psd が最初のジグゾーパズルのページです。次のpage4_anim.psdは 車に乗った猫のアニメーションのページです。

* 001 - page4_puzzle
    * 用意されたカスタムコードを使用して、ジグソーパズルのドラッグの操作とヒットテストを実現します。
        * 各ピースのコピーを作成してエンボス
        * ピースをランダムに配置
        * ドラッグ＆ドロップ
        * ヒットテスト
        * 完成時に onComplete のアクションをコール
    * onComplateのアクションは次のページ（002-page4_anim）に遷移

* 002 - page4_anim
    * 戻るボタン 001-page4_puzzle ページに遷移
    * 車のアニメーション

    <img src="https://github.com/kwiksher/blog/raw/master/img/jig_saw_jp/2019-07-27-10-08-08.png" width="600">

    <img src="https://github.com/kwiksher/blog/raw/master/img/jig_saw_jp/2019-07-27-10-09-07.png" width="600">

### 準備

002-page_animの車のアニメーションページを事前に完成させておきます。

* アニメーション 車
* ボタン page4_puzzleに戻る

### 手順

001-page4_puzzleをKwikで開きます。

1. アクションを作成。 次のページ（page4_anim ）に遷移する Go To Page
1. ドラッグを作成。カスタムコードを埋め込むLuaファイルを作成するためですので、任意のピース一つだけにドラッグのインタラクションを設定してください。

    > カスタムコードは ２４個のピース全てをドラッグにするコードです。

1. Publishしてください。
1. 先ほどドラッグを設定した Luaファイルを custom フォルダにコピーします。

  ```
  copy build4/components/page001/xxx_drag.lua buld4/custom/components/page001/xxx_drag.lua
  ```

1. custom にコピーしたファイルを編集します。ファイルの内容全てを下記のコードと入れ替えます。
1. Publish を再度行います。


例

drag_795を A1 レイヤーに設定

<img src="https://github.com/kwiksher/blog/raw/master/img/jig_saw_jp/2019-07-27-10-33-42.png" width="600">


onComplete アクションを作成

* go to page4_anim
    * flip
    * 待ち 2 秒
    * 時間 1 秒

<img src="https://github.com/kwiksher/blog/raw/master/img/jig_saw_jp/2019-07-27-10-36-57.png" width="600">

ドラッグとアクションの２つのコンポネントを作成して、パプリッシュします。

<img src="https://github.com/kwiksher/blog/raw/master/img/jig_saw_jp/2019-07-27-10-39-52.png" width="300">

---
### custom code の設定


1. build4/components/page001/xxx_drag.lua をコピーして  buld4/**custom**/components/page001/xxx_drag.lua として配置します。

    <img src="https://github.com/kwiksher/blog/raw/master/img/jig_saw_jp/2019-07-27-10-43-53.png" width="600">

2.  xxx_drag.lua が custom/components/page01 ファルダ内に配置されました。

    <img src="https://github.com/kwiksher/blog/raw/master/img/jig_saw_jp/2019-07-27-10-44-49.png" width="600">

 この **xxx_drag.lua** を編集します。テキストエディターを使用して、下記のコードに入れ替えます。コード全てを入れ替えてください。保存します。


再度 KwikのPublish を行ってください。パブリッシュを行うことで カスタムコードが組み込まれます。

<img src="https://github.com/kwiksher/blog/raw/master/img/jig_saw_jp/2019-07-27-10-39-52.png" width="300">

以上です。

---

```lua
-- Code created by Kwik - Copyright: kwiksher.com 2019
-- Version: 4.1.0
-- Project: KwikCatPuzzle
--
local _M = {}
--
local _K = require "Application"
--
local tiles    = {"A",  "B", "C", "D"}
local colNum   = 6
local rowNum   = 4
local hitCount = colNum * rowNum
local magneticMargin = 50
--
local function dragBeginEffect(obj)
  transition.to(obj, {time=500, rotation = 360*3})
end
--
local pieces = {}

-- Drag objects
function _M:didShow(UI)
  local sceneGroup = UI.scene.view
  local layer      = UI.layer
  local scene       = UI.scene

  for k, v in pairs(tiles) do
    for i=1,colNum do
      local dragLayer = layer[v..i]
      if dragLayer == nil then return end
      dragLayer.targetLayer = display.newImageRect(_K.imgDir..dragLayer.imagePath:lower(), _K.systemDir, dragLayer.width, dragLayer.height)
      dragLayer.targetLayer.x = dragLayer.x
      dragLayer.targetLayer.y = dragLayer.y
      dragLayer.targetLayer.fill.effect = "filter.emboss"
      dragLayer.targetLayer.fill.effect.intensity = 0.1
      scene.view:insert(dragLayer.targetLayer)
      table.insert(pieces, dragLayer)

      local randX = math.random(10,20)
      if randX % 2 == 0 then
        dragLayer.x = display.contentWidth -randX
      else
        dragLayer.x = randX
      end
      dragLayer.y = math.random(display.contentHeight)
      dragLayer:toFront()

      local randR = math.random(0, 360);
      dragLayer.rotation = randR
      dragLayer.oriRotation = randR

      local A1_lock = 0
      local A1_posX = 0
      local A1_posY = 0

      _K.MultiTouch.activate( dragLayer, "move", "single", {} )
        _K[v..i.."Drag"] = function (event )
          local t = event.target
          if event.phase == "began" then
            local parent = t.parent; parent:insert(t); display.getCurrentStage():setFocus(t); t.isFocus = true
            t.oriBodyType = t.bodyType
            t.bodyType ="kinematic"
            dragBeginEffect(t)
          elseif event.phase == "moved" then
            function hitTest(dropLayer)
              A1_posX = dragLayer.x - dropLayer.x
              A1_posY = dragLayer.y - dropLayer.y
              if (A1_posX < 0) then
                A1_posX = A1_posX * -1
              end
              if (A1_posY < 0) then
                A1_posY = A1_posY * -1
              end
              if (A1_posX <= magneticMargin) and (A1_posY <= magneticMargin) then  --in position\r\n'
                    dragLayer.x = dropLayer.x
                    dragLayer.y = dropLayer.y
                A1_lock = 1
              else
                A1_lock = 0
              end
            end
            hitTest(t.targetLayer)
          elseif event.phase == "ended" or event.phase == "cancelled" then
              t.bodyType = t.oriBodyType
              display.getCurrentStage():setFocus(nil); t.isFocus = false
              if (A1_lock == 1 and A1_posX <= magneticMargin) and (A1_posY <= magneticMargin) then
                t.x = t.targetLayer.x
                t.y = t.targetLayer.y
                _K.MultiTouch.deactivate(t)
                hitCount = hitCount -1
                t.hit = true
                if hitCount == 0 then
                    --native.showAlert("Kwik Puzzle", "Completed!")
                    Runtime:dispatchEvent({name=UI.page..".action_onComplete", event=event, UI=UI})
                end
              end
              for j, piece in pairs(pieces) do
                if not piece.hit  then
                  piece:toFront()
                end
              end
          end
          return true
        end
        dragLayer:addEventListener( _K.MultiTouch.MULTITOUCH_EVENT, _K[v..i.."Drag"] )

    end
  end
end
--
function _M:toDispose(UI)
  local sceneGroup = UI.scene.view
  local layer      = UI.layer
  local scene       = UI.scene
  for k, v in pairs(tiles) do
    for i=1,colNum do
      local dragLayer = layer[v..i]
        if (nil ~= dragLayer ) then
           dragLayer:removeEventListener ( _K.MultiTouch.MULTITOUCH_EVENT,  _K[v..i.."Drag"] );
        end
    end
  end
end
--
function _M:destroy()
    _K.A1Drag = nil
end
--
return _M
```
