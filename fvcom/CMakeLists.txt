include(AddPrefix)

set(CMAKE_Fortran_FORMAT FREE)

if (DEFINED ${FVCOM_ROOT})
    set(srcdir ${FVCOM_ROOT})
else()
    set(srcdir ${CMAKE_SOURCE_DIR}/src)
endif()

add_subdirectory(libs)
add_subdirectory(FVCOM_source)
