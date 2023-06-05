#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libmemcached::libmemcached" for configuration "RelWithDebInfo"
set_property(TARGET libmemcached::libmemcached APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(libmemcached::libmemcached PROPERTIES
  IMPORTED_IMPLIB_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libmemcached.lib"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/bin/libmemcached.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS libmemcached::libmemcached )
list(APPEND _IMPORT_CHECK_FILES_FOR_libmemcached::libmemcached "${_IMPORT_PREFIX}/lib/libmemcached.lib" "${_IMPORT_PREFIX}/bin/libmemcached.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
