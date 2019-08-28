## Kwik 4.1.1 
relased on 3rd of September, 2018

* https://kwiksher.com/daily/Kwik4_2018_0903.zip

* New icons and splashscreen image are generated with [Project Properties > Publish](https://kwiksher.com/doc/kwik/toolset/project_and_pages/project_properties/publish.html
) tab.

    * You need to reset your icon image and the old launch screen images from the panel
    * Splash screen control needs to be purchased from [Corona Lab's market](https://marketplace.coronalabs.com/corona-plugins/splash-screen-control)

* LaunchScreen of iOS, you need to open launchimage-master/LaunchImage.xcodeproj from XCode. Please read [the instruction from Corona Labs](https://docs.coronalabs.com/guide/distribution/launchFile/index.html), and then export LaunchScreen.storyboardc to build4 folder.


* Messages of Permissions (iOS only) in build.settings
    * For instancec NSCameraUsageDescription = "This app would like to access the camera.",

    * https://docs.coronalabs.com/guide/distribution/buildSettings/index.html

    * https://docs.coronalabs.com/guide/distribution/localization/index.html

      * en.lproj, ja.lproj folders are created under build4 folder. Kwik generates them from the language codes set in Project Properties > Languages

Update Doc
* https://kwiksher.com/doc/kwik/toolset/project_and_pages/project_properties/publish.html
* http://kwiksher.com/doc/tutorials/kwik/publish/ios11_corona_updates.html

Changes between June 13-Sep 3

* FIX: button disable/enable
* FIX: IAP simple page lock, googleID was empty
* FIX: multilingual button with a shared asset image
* FIX: path animation’s auto turn
* FIX: path animation’s flipX and flipY
* Modify: pause at complete is now halt at end. It stops the * animation for a second and start it again.
* FIX: path animation in utlimate config
* FIX: physics body with polygon path
* FIX: path animation FlipX, FlipY without autoTurn
* FIX: Under export image off, if publishing with pressing * shift key, Kwik exports an image of a single layer selected
* Modify: time .sec for complete in gotoPage action
* Modify: up/down/left/right with action for swipe interaction * tool
* FIX: audio dispose crash
* New
    * LaunchScreen of iOS (Android not supported)
        * LaunchScreen.storyboardc
    * splashScreen if purchased
    * multi lingual project
        * CFBundleLocalizations

* Modification
    * Permissions&Features
    * generate Images.xcassets's iconXX.png
    * mySplashScreen 1536x1536



