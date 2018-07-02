# iOS 11 and Corona SDK updates

I have been aware of iOS11 and Corona SDK updates for Kwik to follow up. It passed a few month since their updates, I am late but here is the information from Coroba Labs.

# Icon & Safe areas

* [iOS 11 update: icons and safe area APIs](https://coronalabs.com/blog/2017/09/21/ios-11-update-icons-and-safe-area-apis/)
    * Icons
        * Icon-1024.png is new icon you need to add
        * [Images.xcassets](https://docs.coronalabs.com/guide/distribution/xcAssets/index.html) is made with xCode. It is the Icon assets you need to create
        ```lua
        settings =
          {
            iphone =
            {
                xcassets = "Images.xcassets",
        ```
    * iPhone X
        * total area 360x693. Need to enlarge the background image 

## Launch image/CoronaSplash image
You need to purchase CoronaSplashControl plugin if you want to  display your own splash screen instead of corona labs' default image.

iOS loads Apple's launch images of LaunchScreen.storyboardc made by Xcode. You need to create it with Xcode.

```
On Android:
    Start App
    Show Corona's controlled splash screen
    App's first screen shows.

On iOS:
    Start App
    Show Apple's launch images
    Show Corona's controlled splash screen
    App's first screen shows.
```

* [CoronaSplashControl](https://docs.coronalabs.com/plugin/CoronaSplashControl/index.html)
    * build.settings > splashScreen
        * you may turn it off for iOS because iOS loads another launch screen with LaunchScreen.stroybordc
        * tunr it on for Android with your own splash image

    ```lua
    settings =
    {
        splashScreen =
        {
            ios = {
                enable = true,
                image = "mySplashScreen_iOS.png"
            },
            android = {
                enable = true,
                image = "mySplashScreen_Android.png"
            }
        },
    }
    ```

    > note:[Default Splash Screen](https://forums.coronalabs.com/topic/65687-default-splash-screen-no-more-single-codebase-for-multiple-platforms/)
        * Default.png is outdated. No more single codebase for multiple platforms(iOS&Android)


* [Building Launch Screens — iOS](https://docs.coronalabs.com/guide/distribution/launchFile/index.html)
    * You have to use Apple launcher images because otherwise black screen while the app is loading the splash screen
    * XCode to create LaunchScreen.storyboardc
        * build.settings > **UILaunchStoryboardName**

    * Or Alternatively you can do with Static Method by using **UILaunchImages** in build.settings

## Summary
* create Icon-1024.png Curren Kwik does not generate it automatically from Project settings
* please read  [Images.xcassets](https://docs.coronalabs.com/guide/distribution/xcAssets/index.html) doc on corona labs and create the icon assets
    * build.settings > xcassets = "Images.xcassets"
* enlarge you background image 360x693. It means 
    * 360 × 693  @1x
    * 720 × 1386 @2x 
    * 1440 × 2772 @4x
* purchase [CoronaSplashControl plugin](https://docs.coronalabs.com/plugin/CoronaSplashControl/index.html) if you want to use own splash image
    * build.settings > splashScreen
* XCode to create LaunchScreen.storyboardc
    * build.settings > UILaunchStoryboardName

