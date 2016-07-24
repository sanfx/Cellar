#  PYSIDE_INCLUDE_DIR   - Directories to include to use PySide
#  PYSIDE_LIBRARY       - Files to link against to use PySide
#  PYSIDE_PYTHONPATH    - Path to where the PySide Python module files could be found
#  PYSIDE_TYPESYSTEMS   - Type system files that should be used by other bindings extending PySide

SET(PYSIDE_INCLUDE_DIR "/usr/local/Cellar/pyside/1.2.2/include/PySide")
# Platform specific library names
if(MSVC)
    SET(PYSIDE_LIBRARY "/usr/local/Cellar/pyside/1.2.2/lib/libpyside-python2.7.lib")
elseif(CYGWIN)
    SET(PYSIDE_LIBRARY "/usr/local/Cellar/pyside/1.2.2/lib/libpyside-python2.7")
elseif(WIN32)
    SET(PYSIDE_LIBRARY "/usr/local/Cellar/pyside/1.2.2/bin/libpyside-python2.7.dylib")
else()
    SET(PYSIDE_LIBRARY "/usr/local/Cellar/pyside/1.2.2/lib/libpyside-python2.7.dylib")
endif()
SET(PYSIDE_PYTHONPATH "/usr/local/Cellar/pyside/1.2.2/lib/python2.7/site-packages")
SET(PYSIDE_TYPESYSTEMS "/usr/local/Cellar/pyside/1.2.2/share/PySide/typesystems")
