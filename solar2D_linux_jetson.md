Solar2DTux/external
    * CryptoPP
    * openssl
    * curl
        * curl-7.64.1

wxWidgets
    https://wiki.wxwidgets.org/Compiling_and_getting_started
    https://yasriady.blogspot.com/2015/10/how-to-build-wxwidgets-for-raspberry-pi.html

    static

        ../configure --prefix=$(pwd)/../../ --with-opengl --disable-unicode --disable-shared  --disable-std_string CXX="g++ -O0 -g3  -std=c++11"
        make -j 3
        make install

        ar -rcs libwx_gtk3u-3.1.a *.o

    so

        ../configure --prefix=/home/kwiksher/Documents/wxWidgets-3.1.4/lib/gtk3_so --with-opengl --disable-std_string CXX="g++ -O0 -g3  -std=c++11"
        make -j 3
        make install


    unicode so

        ../configure --prefix=/home/kwiksher/Documents/wxWidgets-3.1.4/lib/gtk3_so_unicode --with-opengl --disable-std_string --enable--unicode CXX="g++ -O0 -g3  -std=c++11"
        make -j 3
        make install

openssl
    https://wiki.openssl.org/index.php/Compilation_and_Installation
    ./config --prefix=$(pwd)/../../../platform/linux/lib --openssldir=/usr/local/ssl
    make depend
    make all
    make install

curl
    https://curl.se/docs/install.html
    https://raspberrypi.stackexchange.com/questions/96646/installing-multiple-versions-of-curl-on-raspbian-stretch

    ./configure --prefix=$(pwd)/../../platform/linux/lib  --with-ssl=/usr/local/ssl --enable-libcurl-option

CryptoPP
    https://www.cryptopp.com/wiki/Linux_(Command_Line)
    https://github.com/weidai11/cryptopp/blob/master/Install.txt

    export CXXFLAGS="-DNDEBUG -std=c++11"
    make libcryptopp.a  
    make install PREFIX=$(pwd)/../linux

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
    Solar2DSimulator
        linux_rtt.project
    
    car
        car.project

    Solar2DConsole
        Solar2DTuxConsole.project

    Solar2DBuilder
        Solar2DBuilder.project


    wx-config --libs
    -L/usr/lib/aarch64-linux-gnu -pthread   -lwx_gtk3u_xrc-3.0 -lwx_gtk3u_html-3.0 -lwx_gtk3u_qa-3.0 -lwx_gtk3u_adv-3.0 -lwx_gtk3u_core-3.0 -lwx_baseu_xml-3.0 -lwx_baseu_net-3.0 -lwx_baseu-3.0 

    -L/home/kwiksher/Documents/wxWidgets-3.1.4/gtk-build/lib

    codelite-make --workspace=Solar2DTux.workspace --project=Solar2DSimulator --config=Release --execute
    codelite-make --workspace=Solar2DTux.workspace --project=car --config=Release --execute
    codelite-make --workspace=Solar2DTux.workspace --project=Solar2DConsole --config=Release --execute
    codelite-make --workspace=Solar2DTux.workspace --project=Solar2DBuilder --config=Release --execute

    using jdk header?
        $(IncludeSwitch)/usr/lib/jvm/java-14-openjdk/include/ $(IncludeSwitch)/usr/lib/jvm/java-14-openjdk/include/linux/ 


