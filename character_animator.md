This new feature in Video replacement supports to play PNG sequence files generated from Adobe Character Animator or any other software.

You need the latest Kwik4. Corona runs at 30 fps. You can check it with debug print with [FPSCalculator](https://gist.github.com/rannerboy/5553cc6b2dc6024484f5cd594e214e17)

However if you create hundreds of pngs with full screen size, the app size becomes huge. Be careful.

## In Character Animator

* A background psd file is added. 

    <img src="https://github.com/kwiksher/blog/raw/master/img/character_animator/2019-08-28-14-31-54.png" width="800">

* Blending Mode is normal for Blank Face's Character Layer.

    <img src="https://github.com/kwiksher/blog/raw/master/img/character_animator/2019-08-28-14-34-10.png" width="600">

* Export PNG Sequence

    <img src="https://github.com/kwiksher/blog/raw/master/img/character_animator/2019-08-28-14-35-53.png" width="600">

## In Kwik

* Video Replacement for bg layer.

    <img src="https://github.com/kwiksher/blog/raw/master/img/character_animator/2019-08-28-14-38-53.png" width="600">

* Click Use png files

    <img src="https://github.com/kwiksher/blog/raw/master/img/character_animator/2019-08-28-14-40-20.png" width="500">

    * Input the filename of the first PNG sequence. For instance, the sequence starts from "Blank Face.000.png",
        * Blank Face
        * 000
    
            don't need .png at the end

* Click File: to browse the folder of PNG sequence

    <img src="https://github.com/kwiksher/blog/raw/master/img/character_animator/2019-08-28-14-44-56.png" width="400">

* Folder is selected and press Create

    <img src="https://github.com/kwiksher/blog/raw/master/img/character_animator/2019-08-28-14-46-23.png" width="400">


### Actions

* Video action: play and pause work for PNG sequence too. rewind is not supported.

### FPSCalculator

* you can enable it in extlib/movieclip_player.lua

    <img src="https://github.com/kwiksher/blog/raw/master/img/character_animator/2019-08-28-19-48-38.png" width="600">

Publish and Enjoy!

<img src="https://github.com/kwiksher/blog/raw/master/img/character_animator/2019-08-28-14-48-19.png" width="600">