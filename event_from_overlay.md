
* myListener.lua in the page's external code
    ```lua
    ---
    Runtime:addEventListener( "myEvent", function(event)
            print("event.text")
        end)
    ---
    ```

    <img src="./img/event_from_overlay/2020-04-23-10-20-54.png" width="200">

* myDispatcher.lua in the button of overlay

    ```lua
    ---
    Runtime:dispatchEvent({ name="myEvent", text="Changed By dispatchEvent" })
    ---
    ```

    <img src="./img/event_from_overlay/2020-04-23-10-22-15.png" width="600">


Alternatively use a global varibale set with Kwik

* myListener.lua in the page' external code
    ```lua
    ---
    Runtime:addEventListener( "enterFrame", function(event)
            print(_K.myVar)
        end)
    ---
    ```

* myDispatcher.lua in the button of overlay
    ```lua
    ---
    local _K = require 'Application'
    _K.myVar = "Changed From Overlay"
    ---
    ```
