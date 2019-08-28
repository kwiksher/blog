### Part 1 - OneSignal Corona SDK Push Notification Plugin Example

OneSignal is a free push notification service for mobile apps. They've partnered with Corona SDK to make it easy to use OneSignal in your Corona Apps. Simply follow [our directions](https://documentation.onesignal.com/docs/corona-sdk-setup) to get started.

---
#### setup
build.settings
```
settings = {
	orientation = {
		default = "portrait",
		supported = { "portrait", "portraitUpsideDown" }
	},
	
	iphone = {
		plist = {
			UIBackgroundModes = {"remote-notification"},
			UIStatusBarHidden = false,
			UIPrerenderedIcon = true, -- set to false for "shine" overlay
		}
	},
	
	plugins = {
    ["plugin.OneSignal"] =
    {
        publisherId = "com.onesignal"
    },
		["plugin.google.play.services"] =
		{
			publisherId = "com.coronalabs",
			supportedPlatforms = { android=true, ["android-kindle"]=true }
		},
  },
}
```

----
## main.lua
```
local OneSignal = require("plugin.OneSignal")
```

---
#### receive notificaton
```
function DidReceiveRemoteNotification(message, additionalData, isActive)
    native.showAlert("message:", message, { "OK" } )
end
```
* message is message of OneSignal
* addionalData is a key/value pair of OneSignal message
* isActive 
    * true if app is in active foreground
    * false if app is in backgroud or not running when a notification is received

---
#### init
replace the following id&number with yours

* OneSignal AppID: b2f7f966-d8cc-11e4-bed1-df8f05be55ba
* Google Project number (for Android) :703322744261
```
OneSignal.DisableAutoRegister()
OneSignal.Init("b2f7f966-d8cc-11e4-bed1-df8f05be55ba", "703322744261", DidReceiveRemoteNotification)
OneSignal.EnableInAppAlertNotification(true)
```

---
#### Butoon - Get Ids
pressing the button to enable user to receive Notification
```
OneSignal.RegisterForNotifications()
```

---


---
### check

```
OneSignal.IdsAvailableCallback( function (userId, pushToken)
    print("userId:" .. userId)
    if (pushToken) then
        print("pushToken:" .. pushToken)
    end
end)
```

if pushuToken is  nil , there was a connection issue or on iOS notification permissions were not accepted.

* does the provisioning profile contains push?
* app is built with the provisining profile
* is the provisioning profile installed in the real device?

---
## Test

send a push notification from OneSignal while your app is under each state of 

* Not ruuning
* Backgronded
* Forgrounded

    reference [Local/Push Notification in Corona Labs Doc](https://docs.coronalabs.com/guide/events/appNotification/index.html)

