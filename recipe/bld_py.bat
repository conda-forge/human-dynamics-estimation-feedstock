cd bindings
rmdir /s /q build
mkdir build
cd build

cmake %CMAKE_ARGS% -G "Ninja" ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DBUILD_SHARED_LIBS:BOOL=ON ^
    -DPython_EXECUTABLE:PATH=%PYTHON% ^
    -DPython3_EXECUTABLE:PATH=%PYTHON% ^
    -DHDE_DETECT_ACTIVE_PYTHON_SITEPACKAGES:BOOL=ON ^
    ..
if errorlevel 1 exit 1

:: Build.
cmake --build . --config Release
if errorlevel 1 exit 1

:: Install.
cmake --build . --config Release --target install
if errorlevel 1 exit 1
