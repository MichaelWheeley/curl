md build

cd build

rem note for Visual Studio 2010 replace "Visual Studio 16 2019" with "Visual Studio 10 2010"
cmake .. -DHTTP_ONLY=yes -DCURL_DISABLE_CRYPTO_AUTH=yes -DCURL_DISABLE_COOKIES=yes -DENABLE_IPV6=no -DCMAKE_USE_LIBSSH2=no -DCURL_ZLIB=no -DBUILD_CURL_EXE=ON -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON -G "Visual Studio 16 2019" -A Win32 -B "build32"

rem note for Visual Studio 2010 replace "Visual Studio 16 2019" with "Visual Studio 10 2010"
cmake .. -DHTTP_ONLY=yes -DCURL_DISABLE_CRYPTO_AUTH=yes -DCURL_DISABLE_COOKIES=yes -DENABLE_IPV6=no -DCMAKE_USE_LIBSSH2=no -DCURL_ZLIB=no -DBUILD_CURL_EXE=ON -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON -G "Visual Studio 16 2019" -A x64 -B "build64"

cmake --build build32 --config Release
cmake --build build32 --config Debug
cmake --build build64 --config Release
cmake --build build64 --config Debug

md lib
md lib\x86
md lib\x64
copy .\build32\lib\Debug\libcurl-d.lib .\lib\x86
copy .\build32\lib\Release\libcurl.lib .\lib\x86
copy .\build64\lib\Debug\libcurl-d.lib .\lib\x64
copy .\build64\lib\Release\libcurl.lib .\lib\x64

cd ..

rem cURL can be tested at the command line using one of the builds
rem .\build\build32\src\Debug\curl.exe
rem .\build\build32\src\Release\curl.exe
rem .\build\build64\src\Debug\curl.exe
rem .\build\build64\src\Release\curl.exe
