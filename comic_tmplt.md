# Template Costomization for Comic Reader

It is experimental how to customize the template files of Kwik4 for a comic reader.

David Fox at Electric Eggplant introduced Corona Comic SDK 2.0 in 2011. It is used in the Middle School Confidential Series

* http://www.middleschoolconfidential.com
* https://github.com/Eddy34743/Corona-Comics-SDK-2.0

<img src="http://kwiksher.com/daily/comic1223/2016-12-23_1647.png" width=600 />

Here is the comic project I made up  

* http://kwiksher.com/daily/comic1223/Comic.zip

unzip and run build4/main.lua with corona simulator

#### copyright 
The actual page images are proprietary. Excerpted from Be Confident in Who You Are by Annie Fox, M.Ed., © 2008.  Used with permission of Free Spirit Publishing Inc., Minneapolis, MN; 800-735-7323;  www.freespirit.com. All rights reserved. 

Images are from the app, “Middle School Confidential 1: Be Confident in Who You Are”  from Electric Eggplant 

http://MiddleSchoolConfidential.com

---
## Page 1

page1 consists of the following layers:

* “Auto” layer is a button to start the transition of panels and frames
* “Tap” layer is also a button to move forward the transition one by one immediately
* “Whole image” button to show the whole page1 image
* “-panels” is a layer group and panel coordinates are specified with each rectangle
* “ballons” group has the ballon images with text
* “background” is the art layer

<img src="http://kwiksher.com/daily/comic1223/2016-12-23_1645.png" width=600 />

if you want to set an animation to panel, panel’s name must follow the layer naming rule of Kwik.
If you don’t use animation to panel or ballon, number digit is allowed

the layer group of “-panels” defines each panel. A panel can have two frames.
the layer group of “ballon” defines each ballon.

<img src="http://kwiksher.com/daily/comic1223/2016-12-23_1650.png" width=600 />

Each ballon name must have substring of panel’s name or frame’s name.
For instance, the panel name is “1”, the ballon name “1” is dispayed.

<img src="http://kwiksher.com/daily/comic1223/2016-12-23_1652.png" width=600 />

When a panel have the two frames “11” and “12”, the ballon “bl11” has “11” , so frame “11” with “bl11” are matched. “bl11” has the prefix “bl” for animation naming

the frame “12” and the ballon “12” are paired.
the ballon “21-31” are displayed across the frame 21 and the frame 31

<img src="http://kwiksher.com/daily/comic1223/2016-12-23_1654.png" width=600 />

Button “Auto”

<img src="http://kwiksher.com/daily/comic1223/2016-12-23_1718.png" width=600 />


auto.lua

```lua
local panels = require(“components.”..UI.page..”.page_meta_panels”)
panels:reset()
panels:start(1, false)
```

Button “Tap”

<img src="http://kwiksher.com/daily/comic1223/2016-12-23_1720.png" width=600 />

tap.lua
```lua
local panels = require(“components.”..UI.page..”.page_meta_panels”)
panels:tap()
return true
```

Button “Whole Image”

<img src="http://kwiksher.com/daily/comic1223/2016-12-23_1721.png" width=600 />

wholeImage.lua

```lua
local panels = require(“components.”..UI.page..”.page_meta_panels”)
panels:reset()
```

panel “pn1” animation

<img src="http://kwiksher.com/daily/comic1223/2016-12-23_1722.png" width=400 />

ballon “bl11” animation

<img src="http://kwiksher.com/daily/comic1223/2016-12-23_1723.png" width=400 />

## Modified Tmplt files

Modified template files are under components/pageXXX. Replace all the codes in layer_anim.lua with the codes in layer_anim_comic.lua . 

* layer_anim_comic.lua for layer_anim.lua
* layer_image_set.lua for layer_image.lua
* page_meta_comic.lua for layer_meta.lua
* page_swipe_comic.lua for page_swipe.lua

<img src="http://kwiksher.com/daily/comic1223/2016-12-23_1726.png" width=500 />

* Alternatively you can check out the comic branch from gitHub https://github.com/kwiksher/kwik4tmplt/tree/comic

* page_meta_comic.lua
    * The default transition duration is 3 secounds at line 10(**_Duration**).
    * Your background image’s width and height must be set at line 11(**_SheetWidth**) and line 12(**_SheetHeight**)

    <img src="http://kwiksher.com/daily/comic1223/2016-12-23_1730.png" width=400 />

* page_swipe_comic.lua

    Your background image’s width and height must be set at line 12(**bgW, bgH**) devided by 4

    <img src="http://kwiksher.com/daily/comic1223/2016-12-23_1733.png" width=400 />

Before publish, let preload disabled for page curl

<img src="http://kwiksher.com/daily/comic1223/2016-12-23_2033.png" width=500 />

## Animation

Animation supported for panel and ballon but not supporte to frames

Supported
* Linear
* Rotation
* Pulse
* Bounce
* Blink
*Shake are supported

Not supported
* Path
* Switch
* Filer animation

Please check on **child component enabled** from Setting > Genaral in order to set an animation to a panel or a ballon.

<img src="http://kwiksher.com/daily/comic1223/comic 0001.jpg" width=600 />

Enjoy!