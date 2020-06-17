## Part 3 - External Library and Code - Kwik

> please update Kwik4 to the latest upate - 2018.1109 or later

* add the plugin to build.settings as described in Part1
    * tmplt/build.settings or build4/build.settings

* Projects&Pages > Add External Library
    Name: OneSignal
    Path: plugin.OneSignal 
    
* Create Variable
    * Name: notifiedMessage as global
    * Name: enableSubscription

+ Add Button with external code
    * Name: register
        * onsignal_register.lua
    * Name: clear
        * onsignal_clearAllNotification.lua
    * Name: setSubs
        * setSubscription.lua

* Add Action
    * Name: notifiedAction

* Add Main.lua External Code
    * onesignal_init.lua
    ```lua
        function DidReceiveRemoteNotification(message, additionalData, isActive)
             native.showAlert("message:", message, { "OK" } )
             _K.notifiedMessage = message
        end

        OneSignal.DisableAutoRegister()
        OneSignal.Init("b2f7f966-d8cc-11e4-bed1-df8f05be55ba", "703322744261", DidReceiveRemoteNotification)
        OneSignal.EnableInAppAlertNotification(true)
    ```

* Add External Code
    * onsignal_register.lua for button action
    ```lua
        OneSignal.RegisterForNotifications()

        OneSignal.IdsAvailableCallback( function (userId, pushToken)
            print("userId:" .. userId)
            if (pushToken) then
                print("pushToken:" .. pushToken)
            end
        end)
    ```

    * onsignal_clearAllNotification.lua for button action
    ```lua
        OneSignal.ClearAllNotifications()
    ```

    * onsignal_setSubscription.lua for button action
    ```lua
        local enable = UI.enableSubscription
        OneSignal.SetSubscription(enable)
    ```

### Note
if you want to display message in a text layer of a page instead of native.showAlert, it can be done with associating notifiedMessage variable to a dynamic text replacement.

when a message is received, open the page with showOverlay function

* Dynamic Text
    * Name: msgTxt
    * associate with notifiedMessage

* Add Button
    * Name: hideBtn
    * external code close_overlay.lua

however, push notification comes anytime, it would be a trouble when the page with the dynamic text is not loaded yet. You may open the page by composer.showOverlay function. For instance, if you want to show the pushed message on page1, use the init code below

* onesignal_init.lua for main.lua

    ```lua
        local composer = require("composer")
        
        function DidReceiveRemoteNotification(message, additionalData, isActive)
                _K.notifiedMessage = message
                composer.showOverlay("views.page01Scene")
        end

        OneSignal.DisableAutoRegister()
        OneSignal.Init("b2f7f966-d8cc-11e4-bed1-df8f05be55ba", "703322744261", DidReceiveRemoteNotification)
        OneSignal.EnableInAppAlertNotification(true)
    ```

* close_overlay.lua
    ```lua
        local composer = require("composer")
        composer.hideOverlay()

    ```

#### Bookshelf Embedded project

* copy the lines of onesignal_init.lua to main.lua. 
* If you use composer.showOverlay, TOC and each book must have a page for displaying a message text and closing button of hydeOvelay
* you setup a setting page of notification in a project as adding plugin.OneSignal as a library described above
* add the plugin to build.settings as described in Part1

```
├── App
│   ├── TOC
│   ├── book01
│   └── book02
├── build.settings
├── config.lua
├── extlib
├── lib
└── main.lua
```

https://docs.coronalabs.com/api/library/composer/showOverlay.html
