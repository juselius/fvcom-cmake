include(ExternalProject)

set (libsdir ${FVCOM_ROOT}/FVCOM_source/libs )
set (instdir ${CMAKE_CURRENT_BINARY_DIR}/install)

#execute_process(
#    COMMAND ${CMAKE_COMMAND} -E create_symlink ${instdir}/install install
#    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
#    )

if (INTERNAL_NETCDF)
    set (extname netcdf)
    ExternalProject_Add(${extname}
        URL ${libsdir}/${extname}.tgz
        DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}
        SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${extname}/configure
            CC=${CMAKE_C_COMPILER}
            CXX=${CMAKE_CXX_COMPILER}
            F77=${CMAKE_Fortran_COMPILER}
            F90=${CMAKE_Fortran_COMPILER}
            FC=${CMAKE_Fortran_COMPILER}
            --prefix=${instdir}/${extname}
        )
    message(ERROR "Not implemented yet")
    set (NETCDF_INCLUDES
        ${instdir}/${extname}/include CACHE PATH "NetCDF headers")
    set (NETCDF_LIBRARIES
        ${instdir}/${extname}/lib CACHE FILEPATH "NetCDF libraries")
    set (NETCDF_LIBRARIES_F90
        ${instdir}/${extname}/lib CACHE FILEPATH "NetCDF F90 libraries")
endif()

if (INTERNAL_JULIAN)
    set (extname julian)
    ExternalProject_Add(${extname}
        URL ${libsdir}/${extname}.tgz
        DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}
        SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/libs/${extname}-patch.sh
            ${CMAKE_SOURCE_DIR}/src/fvcom
            ${instdir}/${extname}
            ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        CONFIGURE_COMMAND ""
        INSTALL_DIR ${instdir}/${extname}
        )
    set (JULIAN_INCLUDE_DIR
        ${instdir}/${extname}/include CACHE PATH "Julian includes")
    set (JULIAN_LIBRARY
        ${instdir}/${extname}/lib/libjulian.a CACHE FILEPATH "Julian libraries")
endif()

if (INTERNAL_METIS)
    set (extname metis)
    ExternalProject_Add(${extname}
        URL ${libsdir}/${extname}.tgz
        DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}
        SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/libs/${extname}-patch.sh
            ${CMAKE_SOURCE_DIR}/src/fvcom
            ${instdir}/${extname}
            ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        CONFIGURE_COMMAND ""
        INSTALL_DIR ${instdir}/${extname}
        )
    set (METIS_INCLUDE_DIR
        ${instdir}/${extname}/include CACHE PATH "METIS includes")
    set (METIS_LIBRARY
        ${instdir}/${extname}/lib/libmetis.a CACHE FILEPATH "METIS libraries")
endif()

if (INTERNAL_PROJ)
    set (extname proj)
    ExternalProject_Add(${extname}
        URL ${libsdir}/${extname}.tgz
        DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}
        SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${extname}/configure
            CC=${CMAKE_C_COMPILER}
            CXX=${CMAKE_CXX_COMPILER}
            F77=${CMAKE_Fortran_COMPILER}
            F90=${CMAKE_Fortran_COMPILER}
            FC=${CMAKE_Fortran_COMPILER}
            --prefix=${instdir}/${extname}
        )
    set (PROJ_INCLUDE_DIR
        ${instdir}/${extname}/include CACHE PATH "PROJ includes")
    set (PROJ_LIBRARY
        ${instdir}/${extname}/lib/libproj.a CACHE FILEPATH "PROJ libraries")
endif()

if (INTERNAL_FPROJ)
    set (extname fproj)
    ExternalProject_Add(${extname}
        DEPENDS proj
        URL ${libsdir}/${extname}.tgz
        DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}
        SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${extname}/configure
            CC=${CMAKE_C_COMPILER}
            CXX=${CMAKE_CXX_COMPILER}
            F77=${CMAKE_Fortran_COMPILER}
            F90=${CMAKE_Fortran_COMPILER}
            FC=${CMAKE_Fortran_COMPILER}
            --with-proj4=${instdir}/proj
            --prefix=${instdir}/${extname}
        ${CMAKE_SOURCE_DIR}/libs/${extname}-patch.sh
            ${CMAKE_Fortran_COMPILER_ID}
            ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        )
    ExternalProject_Add_Step(${extname} post-conf-patch
        COMMAND ${CMAKE_SOURCE_DIR}/libs/${extname}-patch.sh
            ${CMAKE_Fortran_COMPILER_ID}
            ${CMAKE_CURRENT_BINARY_DIR}/${extname}
        COMMENT "post-configure patch"
        DEPENDEES configure
        )
    set (FPROJ_INCLUDE_DIR
        ${instdir}/${extname}/include CACHE PATH "FPROJ4 includes")
    set (FPROJ_LIBRARY
        ${instdir}/${extname}/lib/libfproj4.a CACHE FILEPATH "FPROJ4 libraries")
endif()

#if (ENABLE_GOTM)
#
#endif()


unset (instdir)
unset (extname)
# vim:et:sw=4:ts=4:
