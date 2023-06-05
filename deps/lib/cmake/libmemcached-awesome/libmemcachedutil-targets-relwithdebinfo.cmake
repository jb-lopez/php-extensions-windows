#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libmemcached::libmemcachedutil" for configuration "RelWithDebInfo"
set_property(TARGET libmemcached::libmemcachedutil APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(libmemcached::libmemcachedutil PROPERTIES
  IMPORTED_IMPLIB_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libmemcachedutil.lib"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/bin/libmemcachedutil.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS libmemcached::libmemcachedutil )
list(APPEND _IMPORT_CHECK_FILES_FOR_libmemcached::libmemcachedutil "${_IMPORT_PREFIX}/lib/libmemcachedutil.lib" "${_IMPORT_PREFIX}/bin/libmemcachedutil.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
