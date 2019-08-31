## Camera Frame with Pan & Zoom 

Youtube Demo https://youtu.be/msLM1P9syiY

Using linear animation to the entire page (sceneGroup) for a shot,panning and zooming.

<img src="https://github.com/kwiksher/blog/raw/master/img/camera_frame_zoom_pan/2019-08-31-22-07-56.png" width="200">

↓

<img src="https://github.com/kwiksher/blog/raw/master/img/camera_frame_zoom_pan/2019-08-31-22-08-24.png" width="200">

↓

<img src="https://github.com/kwiksher/blog/raw/master/img/camera_frame_zoom_pan/2019-08-31-22-08-57.png" width="200">

↓

<img src="https://github.com/kwiksher/blog/raw/master/img/camera_frame_zoom_pan/2019-08-31-22-09-20.png" width="200">

## Steps

0. prepare a large background layer 

    <img src="https://github.com/kwiksher/blog/raw/master/img/camera_frame_zoom_pan/2019-08-31-22-01-27.png" width="300">

1. create a folder (layer set) named as "**-frames**" . Notice the hyphen is prefixed with "frames". It tells the layers in **-frames** are used for camera framing such as Zoom or Pan.

    * rectangles in **-frames** should have the same aspect ratio of content area. 
        * Kwik displays the specified area of rectangles to zoom in/out to the size of the content area.

    for instance, the following rectangles are created. You can set an unique name to each layer in **-frames**. Make them transparent to see through the layers under.

    * buildings
    * cat
    * page
    * sky
    
    <img src="https://github.com/kwiksher/blog/raw/master/img/camera_frame_zoom_pan/2019-08-31-11-16-06.png" width="800">

2. Page Properites, you can find Camera Frames section to configure delay time, time for transition and easing type.

    <img src="https://github.com/kwiksher/blog/raw/master/img/camera_frame_zoom_pan/2019-08-31-21-27-30.png" width="200">


    <img src="https://github.com/kwiksher/blog/raw/master/img/camera_frame_zoom_pan/2019-08-31-21-29-17.png" width="400">

    if you clikc a row, it opens a dialog

    <img src="https://github.com/kwiksher/blog/raw/master/img/camera_frame_zoom_pan/2019-08-31-21-29-49.png" width="200">

    press OK

3. Publish 

That's all. 

---
Other kwik4 tutorials for page transition

* [Background layer](https://kwiksher.com/doc/getting_startted/guidelines/screenshot/)
    * Kwik.ATN for resizing the canvas size of a PSD could be useful to view the entire background layer
* [A Four Panel Cartoon](https://kwiksher.com/doc/kwik_tutorial/page_controls/comic_simple/)
* [Comic Advanced](https://kwiksher.com/doc/kwik_tutorial/page_controls/comic_tmplt/)
* [Swipe and Go to Page](https://kwiksher.com/blog/2018/08/16/swpe-and-gotopage/)