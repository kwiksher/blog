# Book shelf app (Embedded version)

this book shelf app contains the mutlile kwik projects inside. The image files of each book are downloadable.
Due to Apple's regulation, you can not load the lua files (programming codes) via Internet. The lua files must be embedded in the app.

Bookshelf app controls which book to be loaded. Each book project can be built as a single standalone project.

Things to be implemented
* Context switch between books
* New downloadable/IAP handling out of http://kwiksher.com/doc/tutorials/kwik/network/downloadable_content.html

When you like to add new books, you need to update the book shelf app as well to include the new lua files of the new books.

>You can create each book without any restrictions but this bookshelf won't hold hundreds of books. 


# Book shelf app (Template version)

this book shelf app reuses the embedded lua files of each page. The bookshelf app is a kind of simple browser app and it loads the image assets of each book. The trick is to use the same layer names between the template page and the actural book page.

You create a bookshelf project and each book project separately. 

* Book shelf master contains TOC and the template pages.
* Each book projet produces the images of each page and they are zipped as book1.zip. The zip file will be loaded to Book shelf master. 

> So you can load the books as many as you like  via Internet without updating the Bookshelf app.

## Book Shelf Master

TOC page

<img src="https://github.com/kwiksher/blog/raw/master/img/bookshelf/bookshelf 0000.jpg" width=300 />

**page A** shows the two shapes and the one text layer with sync audio. Thease assets will be replaced when one book is downloaded and loaded to Bookshelf app. The positoin of each image of the book will be specified in json text.

<img src="https://github.com/kwiksher/blog/raw/master/img/bookshelf/bookshelf 0001.jpg" width=300 />

**page B** shows the one layer with rotation animation.  The roation animation will be applied the image with the same laye name of the book page.

<img src="https://github.com/kwiksher/blog/raw/master/img/bookshelf/bookshelf 0002.jpg" width=300 />

for instance, Book1 consists of 5 pages. Each page uses the same layer names of either **page A** or **page B**

---
|Book1|Master||
|:--|--|--:|
|page1|TOC|page1 image is diplayed in the thumbnail view of TOC|
|Page2|A|audacity.txt and readme.mp3, Shape1&Shape2(x,y, widht, height)|
|Page3|B|Shape1(x,y, widht, height)|
|Page4|B|Shape1(x,y, widht, height)|
|Page5|A|audacity.txt and readme.mp3, Shape1&Shape2(x,y, widht, height)|

### json file - book1 model.json
```json
[
    {"book":"BooK1", "pages":[
        {"type":"TOC"},
        {"type":"A", "shape1":{"x":100, "y":100, "width":100, "height":100}, "shape2":{"x":200, "y":200, "width":200, "height":200}, 
            "audacity":"xxx.txt", "mp3":"yyy.mp3"},
        {"type":"B", "shape1":{"x":300, "y":300, "width":300, "height":300}},
        {"type":"B", "shape1":{"x":400, "y":400, "width":400, "height":400}},
        {"type":"A", "shape1":{"x":500, "y":500, "width":500, "height":500}, "shape2":{"x":600, "y":600, "width":600, "height":600}, 
            "audacity":"zzz.txt", "mp3":"aaa.mp3"},
    ]},
]
```

### zip file - book1.zip
```
model.json
assets\images\p1\background.jpg
assets\images\p2\background.jpg, shape1.png, shape2.png
assets\images\p3\background.jpg, shape1.png
assets\images\p4\background.jpg, shape1.png
assets\images\p5\background.jpg, shape1.png, shape2.png
assets\audios\yyy.mp3, xxx.txt
assets\audios\aaa.mp3, zzz.txt
```

---
## Book1

page1 - Title. this title - background.jpg will be displayed in the thumbnail view of the TOC in Book shelf master

<img src="https://github.com/kwiksher/blog/raw/master/img/bookshelf/bookshelf 0003.jpg" width=300 />


page2 uses **page A** and the images - Shape1 and Shape2, the audacity text and readme audio are zipped in the book1.zip, They are loded to Book shelf master app. You need to use the same layer names of page A in the master project.

<img src="https://github.com/kwiksher/blog/raw/master/img/bookshelf/bookshelf 0004.jpg" width=300 />

page3 uses **page B** 

<img src="https://github.com/kwiksher/blog/raw/master/img/bookshelf/bookshelf 0005.jpg" width=300 />

page4 uses **page B**

<img src="https://github.com/kwiksher/blog/raw/master/img/bookshelf/bookshelf 0006.jpg" width=300 />

page5 uses **page A**

<img src="https://github.com/kwiksher/blog/raw/master/img/bookshelf/bookshelf 0007.jpg" width=300 />

---
## Lua 
Under construction.  The downloadable sample will be modified to implement the Bookshelf master 

* http://kwiksher.com/doc/tutorials/kwik/network/downloadable_content.html

    * Downloadable module
    * In App Purchase module
* Loading the images from a book in Book shelf app. 

For book project, create a json generator. 