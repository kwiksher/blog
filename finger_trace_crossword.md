## A finger-tracing crossword

the puzzle layer in page1.psd will become a crossword with the external codes for user to trace each letters of words with the finger. The sample kwik project is here

* https://kwiksher.com/tutorials/Kwik4/Crossword.zip

put these folders to your build4 folder

* assets/sprites/
* components/crossword

<img src="https://github.com/kwiksher/blog/raw/master/img/finger_trace_crossword/2020-11-13-16-53-32.png" width="600">

words are selected from data.lua 

* components/crossword/data.lua

    ```lua
    local data = {
        {"Apple","Mac"},
        {"Goole","Search"},
        {"Amazon","Ecommece"},
        {"Netflix","Video"},
        {"Microsoft","Windows"},
        {"Nvidia","GPU"},
        {"Facebook","SNS"},
        {"Oracle","RDB"},
        {"Cisico","Network"},
        {"Tesla","E-Car"},
        {"Samsung","Phone Asia"},
        {"Nokia","Phone Eu"},
        {"Yahoo","WWW"},
        {"Twitter","SNS"},
    }
    return data
    ```

the table size is defined in params.lua

* components/crossword/params.lua

    ```lua
    local params = {
        colNum      = 8,
        rowNum      = 8,
        rectWidth   = 20, -- this is @1x, so in psd, need to multiply by 4 becasue of @4x system
        rectHeight  = 20,
        fontSize    = 20,
        posX        = display.contentCenterX, 
        posY        = display.contentCenterY
    }

    return params
    ```

layers in photoshop 

* msgTxt layer
    * kwik text replacement
    * params.listener = "msgTxt" in the external code shows a message

<img src="https://github.com/kwiksher/blog/raw/master/img/finger_trace_crossword/2020-11-13-16-50-07.png" width="600">

* puzzle layer
    * command.create(params, "puzzle", UI) in the external code create a crossword 

external code

* ext/crossword_create.lua
* ext/crossword_show.lua
* ext/crossword_hide.lua

----
crowssowrd_create.lua

<img src="https://github.com/kwiksher/blog/raw/master/img/finger_trace_crossword/2020-11-13-16-45-34.png" width="600">


```lua
local params     = require("components.crossword.params")
local command    = require("components.crossword.command")

--params.hintGroup = "hnts"
params.listener = "msgTxt"
command.create(params, "puzzle", UI)
function UI.layer.msgTxt:crossword(event)
    local objs = event.objs
    local map = event.map
    print("====================")
    if event.type == "hit" then
        -- action for the word completed
        for i = 1, #objs do
            transition.to(
                objs[i],
                {
                    rotation = 360,
                    onComplete = function()
                        objs[i].rotation = 0
                    end
                }
            )
        end
        for k, v in pairs(map) do
            if v.completed == false then
                print(k, false)
                self.text = "Please find " .. k
                return
            end
        end
        -- all the words are completed
        self.text = "completed"
        print("all words are completed")
    end
end
UI.layer.msgTxt.text = "Please find " .. command.lastWord
```
----
crossword_show.lua

<img src="https://github.com/kwiksher/blog/raw/master/img/finger_trace_crossword/2020-11-13-16-46-24.png" width="600">

```lua
UI.layer.msgTxt:addEventListener("crossword", UI.layer.msgTxt)
```

----
crossword_hide.lua

<img src="https://github.com/kwiksher/blog/raw/master/img/finger_trace_crossword/2020-11-13-16-48-12.png" width="600">

```lua
UI.layer.msgTxt:removeEventListener("crossword", UI.layer.msgTxt)
```

---

If you want to use an imagesheet, set drawHandler to drawSpirte in view.lua. 

The imagesheet in the sample is generated with Adobe Animate. Export spritesheet with JSON Array

* components/crossword/view.lua

    ```lua
    local drawHandler = require("components.crossword.drawText").command
    --local drawHandler = require("components.crossword.drawSprite").command

    ```

* components/crossword/drawSprite

    ```lua
    ...
    ...
    local jsonFile = "assets/sprites/alphabet_array.json"
    local imageFile = "assets/sprites/alphabet.png"
    ...
    ...

    local function newAlphabet(char, x, y, params)
        --65-90
        --97-122
        local frameIndex = char:byte()
        if frameIndex > 96 then
            local filename = char.."_1"
            frameIndex = frameMap[filename]
        else
            frameIndex = frameMap[char]
        end
        ...
        ...
    end
    ```

* assets/sprites/alphabet_array.json

    ```json
    ...
    ...
    ,{
        "filename": "Y",
        "frame": {"x":0,"y":99,"w":50,"h":47},
        "rotated": false,
        "trimmed": false,
        "spriteSourceSize": {"x":0,"y":0,"w":50,"h":47},
        "sourceSize": {"w":50,"h":47}
    }
    ,{
        "filename": "Z",
        "frame": {"x":50,"y":99,"w":40,"h":43},
        "rotated": false,
        "trimmed": false,
        "spriteSourceSize": {"x":0,"y":0,"w":40,"h":43},
        "sourceSize": {"w":40,"h":43}
    }
    ,{
        "filename": "a_1",
        "frame": {"x":90,"y":99,"w":23,"h":34},
        "rotated": false,
        "trimmed": false,
        "spriteSourceSize": {"x":0,"y":0,"w":23,"h":34},
        "sourceSize": {"w":23,"h":34}
    }
    ,{
        "filename": "b_1",
        "frame": {"x":113,"y":99,"w":27,"h":43},
        "rotated": false,
        "trimmed": false,
        "spriteSourceSize": {"x":0,"y":0,"w":27,"h":43},
        "sourceSize": {"w":27,"h":43}
    },
    ...
    ...
    ```

<img src="https://github.com/kwiksher/blog/raw/master/img/finger_trace_crossword/alphabet.png">

Enjoy!
