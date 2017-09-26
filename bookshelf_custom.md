# BookShelfTmplt with book versions

this is an experiment of BookShelfTmplt. I added a feature to download a different version of a book

Here is the original BookShelfTmplt
http://kwiksher.com/doc/tutorials/kwik/bookshelf/bookshelf_tmplt.html

Modified sample project is here 

* http://kwiksher.com/tutorials/Kwik4/BookShelfTmplt_V.zip
    * Book01v01
    * BookServer
    * BookShelfTmplt_v

## Model
components/store/model.lua,  the versions are added to in M.epsodes table

```lua
M.epsodes = {
            book01  = {
                name = "book01", dir = "book01", numOfPages = 6, 
                info = "book01 info", 
                versions = {"ver01", "ver02", "ver03"}
            },

            book02  = {
                name = "book02", dir = "book02", numOfPages = 3, 
                info = "book02 info", 
                versions = {"ver01", "ver02"}
            },
    }
```

when user purchase book01,  user can download the default of book01 or ver01, ver02 or ver03. Kwik internally downloads book01.zip or book01v01/assets.zip or book01v02/assets.zip or book01v03/assets.zip

for instance, Book01v01 is the kwik project of the version01 of book01

use copy_books.command to make assets.zip 
```
MyCopy Book01v01 book01v01
```

> BookShelfTmplt_V.zip does not contain book01v02 and book01v3 project. It works only with book01 and book01v01. It shows the error message not found to download the assets.zip if you try downloading version02, version03.

## UI
page2-INFO now has version01, version02 and version03 layers.

<img src="https://github.com/kwiksher/blog/raw/master/img/bookshelf_custom/2017-09-26_1219.png" width=500 />

"version01",  "version02",  "version03" are enabled to download each version once user purchases the book.

### changes
* when user click purchase button and the transaction is completed, the original sample automatically starts downloading book.zip. This feature is disabled. User needs to click download/version button to get the assets.zip

* page1-Shelf, purchase button is removed (alpha=0) and does not automatically opens book01. Now it always shows the page2-INFO ovelay

* book01 is associated to DownloadBtn and SavedTxt

* version01, version02, version03 buttons will be firstly to download the assets.zip and once the zip downloaded, user can click to open the version book.



