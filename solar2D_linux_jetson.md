Solar2DTux/external
    * CryptoPP
        * cryptopp-CRYPTOPP_8_2_0
    * openssl
        * openssl-1.1.1h
    * curl
        * curl-7.64.1
    * wx
        * wxWidgets-3.1.4

wxWidgets
    https://wiki.wxwidgets.org/Compiling_and_getting_started
    https://yasriady.blogspot.com/2015/10/how-to-build-wxwidgets-for-raspberry-pi.html

        cd external/wx/wxWidgets-3.1.4
        mk gtk-build
        cd gtk-build

            build.sh
            ```
            ./configure --with-opengl --with-gtk3 --disable-shared --enable-monolithic --enable-webview --enable-webviewwebkit --enable-mediactrl

            sudo apt-get install freeglut3-dev
            sudo apt-get install libglw1-mesa libglw1-mesa-dev
            ```
    
    static

        ../configure --prefix=$(pwd)/../../../../platform/linux --with-opengl --disable-shared --enable-monolithic --enable-webview --enable-webviewwebkit --enable-mediactrl  CXX="g++ -O2 -g3  -std=c++11"
        make -j 3
        make instal
    
    shared for webkit2_extu

        ../configure --prefix=$(pwd)/../../../../platform/linux --with-opengl  --enable-webview --enable-webviewwebkit --enable-mediactrl  CXX="g++ -O2 -g3  -std=c++11"
        make -j 3
        make instal

openssl
    https://wiki.openssl.org/index.php/Compilation_and_Installation
    
    cd external/openssl/openssl-1.1.1h
    ./config --prefix=$(pwd)/../../../platform/linux --openssldir=/usr/local/ssl
    make depend
    make all
    make install

curl
    https://curl.se/docs/install.html
    https://raspberrypi.stackexchange.com/questions/96646/installing-multiple-versions-of-curl-on-raspbian-stretch

    cd external/curl/curl-7.64.1
    ./configure --prefix=$(pwd)/../../../platform/linux  CPPFLAGS="-I../../../platform/linux/include/openssl" LDFLAGS="-L../../../platform/linux/lib"  --with-ssl --disable-shared
    make
    make install


CryptoPP
    https://www.cryptopp.com/wiki/Linux_(Command_Line)
    https://github.com/weidai11/cryptopp/blob/master/Install.txt

    cd external/CryptoPP/cryptopp-master
    export CXXFLAGS="-DNDEBUG -std=c++11"
    make libcryptopp.a  
    make install PREFIX=$(pwd)/../../../platform/linux


codelite
    https://github.com/eranif/codelite

    sudo apt-get install libgtk-3-dev pkg-config build-essential git cmake libssh-dev libwxgtk3.0-gtk3-dev libsqlite3-dev
    git clone https://github.com/eranif/codelite.git
    cd codelite
    mkdir build-release
    cd build-release
    cmake .. -DCMAKE_BUILD_TYPE=Release
    cmake --build . -j $(nproc)
    sudo cmake --build . --target install


Solar2DTux/plaform/linux

    ln -s ./include/wx-3.1/wx
    
    cp lib/wx/include/gtk3-unicode-static-3.1/wx/setup.h wx/
    
    codelite-make --workspace=Solar2DTux.workspace --project=Solar2DBuilder --config=Release --execute

        external/loop-2.3-beta/lua/precompiler.constant.lua
        
        bin/linux/lua2c.sh
            ../../bin/mac/lua2c.sh $1 $2 $3 $4 /usr/bin

    ./setup_dev.sh

        sudo cp ../../external/wx/wxWidgets-3.1.4/gtk-build-so/webkit2_extu-3.1.4.so /usr/local/lib/wx/3.1.4/web-extensions/webkit2_extu-3.1.4.so


    codelite-make --workspace=Solar2DTux.workspace --project=Solar2DConsole --config=Release --execute

    codelite-make --workspace=Solar2DTux.workspace --project=Solar2Dcar --config=Release --execute

    codelite-make --workspace=Solar2DTux.workspace --project=Solar2DSimulator --config=Release --execute -d clean

    codelite-make --workspace=Solar2DTux.workspace --project=Solar2DSimulator --config=Release --execute

caveats

    using jdk header in Solar2DSimulator?
        $(IncludeSwitch)/usr/lib/jvm/java-14-openjdk/include/ $(IncludeSwitch)/usr/lib/jvm/java-14-openjdk/include/linux/ 
