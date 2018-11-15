### Part 2 - OneSignal Corona SDK Push Notification Plugin Example

[Part1](Part1.md) descirbed a basic setting to receive a push notification.

You would like to use these OneSignla APIs

* ClearAllNotifications function
* SetSubscription function to control on/off notifications

moreover

* PromptLocation function to get a user's permission for location and send the location info to OneSignal
* SendTag function

your may post a nification via OneSignal to others by
* PostNotification function

---
### Complete list of all the APIs
OneSinal plugin supports the following functions - [SDK Document](https://documentation.onesignal.com/docs/corona-sdk)

* init(callback)
    * callback(message, additionalData, isActive)
* DisableAutoRegister()
* ~~kOSSettingsKeyInAppLaunchURL~~
* RegisterForNotifications()
* IdsAvailableCallback(callback)
    * callback(userID, pushToken)
* GetTags(callback)
    * callback(tags)
* SendTag(key, value)
* SendTags(keyValuePairs)
* DeleteTag(key)
* DeleteTags(keys)
* PromptLocation()
    * build.settings plist
        * NSLocationUsageDescription
        * NSLocationWhenInUseUsageDescription
* PostNotification(notification(notification, onSuccess, onError)
    * onSuccess(json)
    * onError(json)
* ~~cancelNotification~~
* ClearAllNotifications()
* SetSubscription(enable)

* ~~OSHandleNotificationReceivedBlock~~
* ~~OSNotificationOpenedResult~~
* ~~OSNotification~~
* ~~OSNotificationAction~~
* ~~OSNotificationDisplayType~~
* ~~OSNotificationPayload~~

Android
* EnableVibrate(enable)
* EnableSound(enable)

Debug
* SetLogLevel(logLevel, visualLevel)

