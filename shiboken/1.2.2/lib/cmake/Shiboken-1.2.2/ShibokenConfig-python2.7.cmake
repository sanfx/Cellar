#  SHIBOKEN_INCLUDE_DIR        - Directories to include to use SHIBOKEN
#  SHIBOKEN_LIBRARY            - Files to link against to use SHIBOKEN
#  SHIBOKEN_BINARY             - Executable name
#  SHIBOKEN_BUILD_TYPE         - Tells if Shiboken was compiled in Release or Debug mode.
#  SHIBOKEN_PYTHON_INTERPRETER - Python interpreter (regular or debug) to be used with the bindings.
#  SHIBOKEN_PYTHON_LIBRARIES   - Python libraries (regular or debug) Shiboken is linked against.

SET(SHIBOKEN_INCLUDE_DIR "/usr/local/Cellar/shiboken/1.2.2/include/shiboken")
if(MSVC)
    SET(SHIBOKEN_LIBRARY "/usr/local/Cellar/shiboken/1.2.2/lib/libshiboken-python2.7.lib")
elseif(CYGWIN)
    SET(SHIBOKEN_LIBRARY "/usr/local/Cellar/shiboken/1.2.2/lib/shiboken-python2.7")
elseif(WIN32)
    SET(SHIBOKEN_LIBRARY "/usr/local/Cellar/shiboken/1.2.2/bin/libshiboken-python2.7.dylib")
else()
    SET(SHIBOKEN_LIBRARY "/usr/local/Cellar/shiboken/1.2.2/lib/libshiboken-python2.7.dylib")
endif()
SET(SHIBOKEN_PYTHON_INCLUDE_DIR "/usr/include/python2.7")
SET(SHIBOKEN_PYTHON_INCLUDE_DIR "/usr/include/python2.7")
SET(SHIBOKEN_PYTHON_INTERPRETER "/usr/bin/python2.7")
SET(SHIBOKEN_PYTHON_LIBRARIES "-undefined dynamic_lookup")
SET(SHIBOKEN_PYTHON_SUFFIX "-python2.7")
message(STATUS "libshiboken built for Release")


set(SHIBOKEN_BINARY "/usr/local/Cellar/shiboken/1.2.2/bin/shiboken")
