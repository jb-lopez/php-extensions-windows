#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libmemcached::libhashkit" for configuration "RelWithDebInfo"
set_property(TARGET libmemcached::libhashkit APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(libmemcached::libhashkit PROPERTIES
  IMPORTED_IMPLIB_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libhashkit.lib"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/bin/libhashkit.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS libmemcached::libhashkit )
list(APPEND _IMPORT_CHECK_FILES_FOR_libmemcached::libhashkit "${_IMPORT_PREFIX}/lib/libhashkit.lib" "${_IMPORT_PREFIX}/bin/libhashkit.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
