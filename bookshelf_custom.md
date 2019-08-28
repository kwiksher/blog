# BookShelfTmplt with book versions

this is an experiment of BookShelf Embedded. I added a feature to download a different version of a book such as English book01 or Japanese book01.

Here is the original BookShelf Embedded

* https://kwiksher.com/doc/kwik_tutorial/bookshelf/embedded/

Modified sample project is here. Please find **_v** suffixed folders.

* https://kwiksher.com/tutorials/Kwik4/BookShelf.zip
    * BookShelfEmbedded_v
    * BookShelfTmplt_v
    * BookTOC_v
    * BookServer
        * copy_books.bat
        * copy_books.command

In BookSever, copy_books.bat, .command, you find the following codes

Win bat
```
...
@rem for bookshelf with versions
call :MyCopy Book01en book01 en true
call :MyCopy Book01jp book01 jp
call :MyCopy Book02en book02 en true
call :MyCopy Book02jp book02 jp
...
```

Mac command
```
...
# For bookshelf with versions
MyCopy Book01en book01 en true
MyCopy Book01jp book01 jp
MyCopy Book02en book02 en true
MyCopy Book02jp book02 jp
...
```

## Model
components/store/model.lua,  the versions are added to in M.epsodes table

```lua
M.epsodes = {
            book01  = {
                name = "book01", dir = "book01", numOfPages = 6, 
                info = "book01 info", 
                versions = {"en", "jp"}
            },

            book02  = {
                name = "book02", dir = "book02", numOfPages = 3, 
                info = "book02 info", 
                versions = {"en", "jp"}
            },
    }
```

when user purchase book01,  user can download the default of book01 or en, jp. Kwik internally downloads book01.zip or book01en/assets.zip or book01jp/assets.zip

for instance, Book01en is the kwik project of the version01 of book01

use copy_books.command to make assets.zip 
```
MyCopy Book01en book01 en
```

## UI

page2-INFO has version01, version02 version03 layers.

<img src="https://github.com/kwiksher/blog/raw/master/img/bookshelf_custom/2019-06-12-10-56-11.png" width=500 />

"English",  "Japanese" are enabled to download each version once user purchases the book.

### changes in the version model

* when user click purchase button and the transaction is completed, the original sample automatically starts downloading book.zip. This feature is disabled. User needs to click download/version button to get the assets.zip

* page1-Shelf, purchase button is removed (alpha=0) and does not automatically opens book01. Now it always shows the page2-INFO overlay

* book01 is associated to DownloadBtn and SavedTxt

* english, japanese buttons will be firstly to download the assets.zip and once the zip downloaded, user can click to open the version book.

