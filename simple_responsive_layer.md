A Kwik4 new feature

## A simple responsive layer

Layer properties has the following checkbox 

<img src="https://github.com/kwiksher/blog/raw/master/img/simple_responsive_layer/2019-09-07_2240.png" width="500">

For instance, **Left** is checked, it translates the layer by the following codes.

```lua
(display.display.safeActualContentWidth -480)/2 -- iPhoneX notch is identified with safeActualContent
```

the red buttons are sticked to the borders

<img src="https://github.com/kwiksher/blog/raw/master/img/simple_responsive_layer/2019-09-10-11-08-06.png" width="700">

and then each button has set with TOP or Bottom, Right or Left. "Top Left" text layer is set with Top & Left

iPhone 6

<img src="https://github.com/kwiksher/blog/raw/master/img/simple_responsive_layer/2019-09-10-11-11-15.png" width="400">

iPhone X has a notch

<img src="https://github.com/kwiksher/blog/raw/master/img/simple_responsive_layer/2019-09-10-11-12-08.png" width="400">

iPad Pro

<img src="https://github.com/kwiksher/blog/raw/master/img/simple_responsive_layer/2019-09-10-11-12-43.png" width="400">


> This feature only works for Ultimate config @4x project only.

--
reference

* [Background layer](https://kwiksher.com/doc/getting_startted/guidelines/screenshot/)
    * Kwik.ATN for resizing the canvas size of a PSD could be useful to view the entire background layer
