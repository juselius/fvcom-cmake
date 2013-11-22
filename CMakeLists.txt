cmake_minimum_required(VERSION 2.8)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

project(FVCOM)
enable_language(Fortran)

set (PROJECT_VERSION_MAJOR 3)
set (PROJECT_VERSION_MINOR 6)
set (PROJECT_VERSION_PATCH 1)

option(ENABLE_TESTS "Enable test suite" OFF)
option(ENABLE_BLAS "Use BLAS backend for linear algebra" OFF)
option(ENABLE_LAPACK "Use LAPACK backend for linear algebra" OFF)
option(ENABLE_MPI "Enable MPI parallelization" OFF)
option(ENABLE_OPENMP "Enable OpenMP parallelization" OFF)
option(ENABLE_CODE_COVERAGE "Compile with code coverage turned on" OFF)
option(ENABLE_SYMBIOSES "Enable the SYMBIOSES interface" OFF)

option(INTERNAL_NETCDF "Build internal NetCDF library" OFF)
option(INTERNAL_PROJ "Build internal Proj library" ON)
option(INTERNAL_FPROJ "Build internal FProj library" ON)
option(INTERNAL_JULIAN "Build internal Julian library" ON)
option(INTERNAL_METIS "Build internal METIS library" ON)

#--------------------------------------------------------------------------
#        PRECISION          DEFAULT PRECISION: SINGLE
#                           UNCOMMENT TO SELECT DOUBLE PRECISION
#--------------------------------------------------------------------------

option(ENABLE_DOUBLE_PRECISION "DOUBLE_PRECISION" OFF)

#--------------------------------------------------------------------------
#        SPHERICAL          SELECT SPHERICAL COORDINATES FOR INTEGRATION
#                           DEFAULT: CARTESIAN
#                           UNCOMMENT TO SELECT SPHERICAL COORDINATES
#--------------------------------------------------------------------------

option(ENABLE_SPHERICAL "SPHERICAL" OFF)

#--------------------------------------------------------------------------
#        FLOODYING/DRYING   INCLUDE WET/DRY TREATMENT OF DOMAIN
#                           CAN BE ACTIVATED/DEACTIVATED AT RUN TIME WITH
#                           INPUT FILE CONTROL.  (SEE exa_run.dat) FILE
#                           DEFAULT: NO FLOODYING/DRYING INCLUDED
#                           UNCOMMENT TO INCLUDE FLOODYING/DRYING
#--------------------------------------------------------------------------

option(ENABLE_WET_DRY "WET_DRY" ON)

#--------------------------------------------------------------------------
#        MULTI_PROCESSOR    INCLUDES PARALLELIZATION WITH MPI
#                           REQUIRES LINKING MPI LIBRARIES OR COMPILING
#                           WITH A PRELINKED SCRIPT (mpif90/mpf90/etc)
#                           DEFAULT: NO PARALLEL CAPABILITY
#                           UNCOMMENT TO INCLUDE MPI PARALLEL CAPABILITY
#--------------------------------------------------------------------------

option(ENABLE_MULTIPROCESSOR "MULTIPROCESSOR" ON)

#--------------------------------------------------------------------------
#        WATER_QUALITY      INCLUDE EPA WATER QUALITY MOD
#                           CAN BE ACTIVATED/DEACTIVATED AT RUN TIME WITH
#                           VARIABLE WQM_ON IN INPUT FILE
#                           DEFAULT: NO WATER QUALITY MODEL
#                           UNCOMMENT TO INCLUDE WATER QUALITY MODEL
#--------------------------------------------------------------------------

option(ENABLE_WATER_QUALITY "WATER_QUALITY" OFF)

#--------------------------------------------------------------------------
#        PROJECTION         A Fortran90 wrapper for the Cartographic projection
#                           Software, proj4.
#                           Proj can be obtained from:
#                           http://www.remotesensing.org/proj/
#                           Thanks to: USGS
#                           The Proj fortran bindings can be obtained from:
#                           http://forge.nesc.ac.uk/projects/glimmer/
#                           Thanks to: Magnus Hagdorn (Magnus.Hagdorn@ed.ac.uk)
#                           !! NOTE THAT THE PROJ 4 LIBRARY MUST BE IN YOUR
#                           LD_LIBRARY_PATH FOR DYNAMIC LOADING!!
#--------------------------------------------------------------------------

option(ENABLE_PROJ "PROJ" OFF)

#--------------------------------------------------------------------------
#        DATA_ASSIMILATION  INCLUDE NUDGING BASED DATA ASSIMILATION FOR
#                           CURRENT/TEMP/SALINITY/SST
#                           CAN BE ACTIVATED/DEACTIVATED AT RUN TIME WITH
#                           INPUT FILE CONTROL.  (SEE exa_run.dat) FILE
#                           DEFAULT: NO DATA ASSIMILATION INCLUDED
#                           UNCOMMENT TO INCLUDE DATA ASSIMILATION
#--------------------------------------------------------------------------

option(ENABLE_DATA_ASSIM "DATA_ASSIM" OFF)
option(ENABLE_LIMITED_NO "LIMITED_NO" ON)
option(ENABLE_LIMITED_1 "LIMITED_1" OFF)
option(ENABLE_LIMITED_2 "LIMITED_2" OFF)

#--------------------------------------------------------------------------
#  Semi-Implicit time stepping method
#--------------------------------------------------------------------------

option(ENABLE_SEMI_IMPLICIT "SEMI_IMPLICIT" OFF)
option(ENABLE_GCN "GCN" ON)
option(ENABLE_GCY1 "GCY1" OFF)
option(ENABLE_GCY2 "GCY2" OFF)

#--------------------------------------------------------------------------
#        TURBULENCE MODEL   USE GOTM TURBULENCE MODEL INSTEAD OF THE ORIGINAL
#                           FVCOM MELLOR-YAMADA 2.5 IMPLEMENTATION
#                           UNCOMMENT TO USE GOTM TURBULENCE MODEL
#        NOTE: You Must Build GOTM 4.x, GOTM 3.x used a different
#              do_turbulence interface and will not work.
#--------------------------------------------------------------------------

option(ENABLE_GOTM "GOTM" OFF)

#--------------------------------------------------------------------------
#       EQUILIBRIUM TIDE
#--------------------------------------------------------------------------

option(ENABLE_EQUI_TIDE "EQUI_TIDE" OFF)

#--------------------------------------------------------------------------
#       ATMOSPHERIC TIDE
#--------------------------------------------------------------------------

option(ENABLE_ATMO_TIDE "ATMO_TIDE" OFF)

#--------------------------------------------------------------------------
#       RIVER DISTRIBUTION OPTION:
#       THE STANDARD NAME LIST USES A CHARACTER STRING TO SET A FUNCION
#       DISTROBUTION. YOU CAN OPTIONALLY SPECIFY TO USE THE OLD STYLE,
#       FLOATING POINT DISTROBUTION HERE. USE THIS WHEN CONVERTING OLD-STYLE
#       RIVER INPUT FILES!
#--------------------------------------------------------------------------

option(ENABLE_RIVER_FLOAT "RIVER_FLOAT" OFF)

#--------------------------------------------------------------------------
#        Using A fully multidimensional positive definite advection
#        transport algorithm with small implicit diffusion.
#        Based on Smolarkiewicz, P. K; Journal of Computational
#        Physics, 54, 325-362, 1984
#--------------------------------------------------------------------------

option(ENABLE_MPDATA "MPDATA" OFF)

#--------------------------------------------------------------------------
#         Run Two-D Barotropic Mode Only
#--------------------------------------------------------------------------

option(ENABLE_TWO_D_MODEL "TWO_D_MODEL" OFF)

#--------------------------------------------------------------------------
#         Output 2-D Momentum Balance Checking
#--------------------------------------------------------------------------

option(ENABLE_BALANCE_2D "BALANCE_2D" OFF)

#--------------------------------------------------------------------------
#           OPEN BOUNDARY FORCING TYPE
#           DEFAULT: OPEN BOUNDARY NODE WATER ELEVATION FORCING
#           UNCOMMENT TO SELECT BOTH OPEN BOUNDARY NODE WATER ELEVATION
#           FORCING AND OPEN BOUNDARY VOLUME TRANSPORT FORCING
#---------------------------------------------------------------------------

option(ENABLE_MEAN_FLOW "MEAN_FLOW" OFF)

#--------------------------------------------------------------------------
#           OUTPUT TIDAL INFORMATION AT NTIDENODE and NTIDECELL
#           FOR MEANFLOW CALCULATION.
#---------------------------------------------------------------------------

option(ENABLE_TIDE_OUTPUT "TIDE_OUTPUT" OFF)

#--------------------------------------------------------------------------
#           dye release
#---------------------------------------------------------------------------

option(ENABLE_DYE_RELEASE "DYE_RELEASE" OFF)

#--------------------------------------------------------------------------
#        SUSPENDED SEDIMENT MODEL:   UNCOMMENT TO INCLUDE MODEL
#--------------------------------------------------------------------------

option(ENABLE_SEDIMENT "SEDIMENT" OFF)
option(ENABLE_OFFLINE_SEDIMENT "OFFLINE_SEDIMENT" OFF)
option(ENABLE_RRKF "RRKF" OFF)
option(ENABLE_ENKF "ENKF" OFF)

#--------------------------------------------------------------------------
#         Run One-D Mode with Biological Model
#--------------------------------------------------------------------------

option(ENABLE_ONE_D_MODEL "ONE_D_MODEL" OFF)

#--------------------------------------------------------------------------
#       GENERAL BIOLOGICAL MODEL:    UNCOMMENT TO INCLUDE MODEL
#--------------------------------------------------------------------------

option(ENABLE_BioGen "BioGen" OFF)

#--------------------------------------------------------------------------
#         Dynamic/Thermodynamic Ice
#--------------------------------------------------------------------------

option(ENABLE_ICE "ICE" OFF)

#--------------------------------------------------------------------------
#         CALCULATE THE NET HEAT FLUX IN MODEL
#--------------------------------------------------------------------------

option(ENABLE_HEATING_CALCULATED "HEATING_CALCULATED" OFF)

#--------------------------------------------------------------------------
#         AIR_PRESSURE FROM SURFACE FORCING
#--------------------------------------------------------------------------

option(ENABLE_AIR_PRESSURE "AIR_PRESSURE" OFF)

#--------------------------------------------------------------------------
# Visit online simulation mode
#--------------------------------------------------------------------------

option(ENABLE_VISIT "VISIT" OFF)

#--------------------------------------------------------------------------
#        NON-HYDROSTATIC MODEL:
#--------------------------------------------------------------------------

option(ENABLE_NH "NH" OFF)

#--------------------------------------------------------------------------
#        PARTICLE TRACKING
#--------------------------------------------------------------------------

option(ENABLE_LAG_PARTICLE "LAG_PARTICLE" OFF)

#--------------------------------------------------------------------------
#        WAVE-CURRENT INTERACTION
#--------------------------------------------------------------------------

option(ENABLE_WAVE_CURRENT_INTERACTION "WAVE_CURRENT_INTERACTION" OFF)
option(ENABLE_PLBC "PLBC" OFF)
option(ENABLE_EXPLICIT "EXPLICIT" OFF)
option(ENABLE_WAVE_ONLY "WAVE_ONLY" OFF)
option(ENABLE_WAVE_ROLLER "WAVE_ROLLER" OFF)
option(ENABLE_WAVE_OFFLINE "WAVE_OFFLINE" OFF)

#--------------------------------------------------------------------------
#        THIN-DAM MODEL
#--------------------------------------------------------------------------

option(ENABLE_THIN_DAM "THIN_DAM" OFF)

#--------------------------------------------------------------------------
#        PWP MIXED LAYER MODEL:
#--------------------------------------------------------------------------

option(ENABLE_PWP "PWP" OFF)

#--------------------------------------------------------------------------
#        VERTICAL ADVECTION LIMITER:
#        FOR S-COORDINATES, DON'T USE THIS FLAG
#--------------------------------------------------------------------------

option(ENABLE_LIMITER_VER_ADV "LIMITER_VER_ADV" OFF)

#--------------------------------------------------------------------------
#        PETSC Version
#        If your PETSc is 2.3.2 or older, uncomment this flag
#--------------------------------------------------------------------------

option(ENABLE_OLD_PETSC "OLD_PETSC" ON)

#--------------------------------------------------------------------------
#        DEVELOPMENT FLAGS
#            FOR BETA WORK ONLY
#--------------------------------------------------------------------------

option(ENABLE_DEVELOP1 "DEVELOP1" OFF)
option(ENABLE_DEVELOP2 "DEVELOP2" OFF)
option(ENABLE_DEVELOP3 "DEVELOP3" OFF)
option(ENABLE_DEVELOP4 "DEVELOP4" OFF)
option(ENABLE_DEVELOP5 "DEVELOP5" OFF)

include(UseGlobalBuildTree)
include(ConfigCompilerFlags)

# Definitions and setting for each option

if(ENABLE_DOUBLE_PRECISION)
    add_definitions(-DDOUBLE_PRECISION)
endif()

if(ENABLE_SPHERICAL)
    add_definitions(-DSPHERICAL)
endif()

if(ENABLE_WET_DRY)
    add_definitions(-DWET_DRY)
endif()

if(ENABLE_MULTIPROCESSOR)
    set(ENABLE_MPI ON)
endif()

if(ENABLE_WATER_QUALITY)
    add_definitions(-DWATER_QUALITY)
endif()

if(ENABLE_PROJ)
    add_definitions(-DPROJ)
endif()

if(ENABLE_DATA_ASSIM)
    add_definitions(-DDATA_ASSIM)
    set(ENABLE_BLAS ON)
    set(ENABLE_LAPACK ON)
    find_package(PETSc REQUIRED)
endif()

if(ENABLE_LIMITED_NO)
    add_definitions(-DLIMITED_NO)
    set(ENABLE_LIMITED_1 OFF)
    set(ENABLE_LIMITED_2 OFF)
endif()

if(ENABLE_LIMITED_1)
    add_definitions(-DLIMITED_1)
    set(ENABLE_LIMITED_NO OFF)
    set(ENABLE_LIMITED_2 OFF)
endif()

if(ENABLE_LIMITED_2)
    add_definitions(-DLIMITED_2)
    set(ENABLE_LIMITED_NO OFF)
    set(ENABLE_LIMITED_1 OFF)
endif()

if(ENABLE_SEMI_IMPLICIT)
    add_definitions(-DSEMI_IMPLICIT)
endif()

if(ENABLE_GCN)
    add_definitions(-DGCN)
    set(ENABLE_GCY1 OFF)
    set(ENABLE_GCY2 OFF)
endif()

if(ENABLE_GCY1)
    add_definitions(-DGCY1)
    set(ENABLE_GCN OFF)
    set(ENABLE_GCY2 OFF)
endif()

if(ENABLE_GCY2)
    add_definitions(-DGCY2)
    set(ENABLE_GCN OFF)
    set(ENABLE_GCY1 OFF)
endif()

if(ENABLE_GOTM)
    add_definitions(-DGOTM)
    message(FATAL_ERROR "No cmake support for GOTM yet")
endif()

if(ENABLE_EQUI_TIDE)
    add_definitions(-DEQUI_TIDE)
endif()

if(ENABLE_ATMO_TIDE)
    add_definitions(-DATMO_TIDE)
endif()

if(ENABLE_RIVER_FLOAT)
    add_definitions(-DRIVER_FLOAT)
endif()

if(ENABLE_MPDATA)
    add_definitions(-DMPDATA)
endif()

if(ENABLE_TWO_D_MODEL)
    add_definitions(-DTWO_D_MODEL)
endif()

if(ENABLE_BALANCE_2D)
    add_definitions(-DBALANCE_2D)
endif()

if(ENABLE_MEAN_FLOW)
    add_definitions(-DMEAN_FLOW)
endif()

if(ENABLE_TIDE_OUTPUT)
    add_definitions(-DTIDE_OUTPUT)
endif()

if(ENABLE_DYE_RELEASE)
    add_definitions(-DDYE_RELEASE)
endif()

if(ENABLE_SEDIMENT)
    add_definitions(-DSEDIMENT)
endif()

if(ENABLE_OFFLINE_SEDIMENT)
    add_definitions(-DOFFLINE_SEDIMENT)
endif()

if(ENABLE_RRKF)
    add_definitions(-DRRKF)
    set(ENABLE_ENKF OFF)
    set(ENABLE_BLAS ON)
    set(ENABLE_LAPACK ON)
    find_package(PETSc REQUIRED)
endif()

if(ENABLE_ENKF)
    add_definitions(-DENKF)
    set(ENABLE_RRKF OFF)
    set(ENABLE_BLAS ON)
    set(ENABLE_LAPACK ON)
    find_package(PETSc REQUIRED)
endif()

if(ENABLE_ONE_D_MODEL)
    add_definitions(-DONE_D_MODEL)
endif()

if(ENABLE_BioGen)
    add_definitions(-DBioGen)
endif()

if(ENABLE_ICE)
    add_definitions(-DICE)
endif()

if(ENABLE_HEATING_CALCULATED)
    add_definitions(-DHEATING_CALCULATED)
endif()

if(ENABLE_AIR_PRESSURE)
    add_definitions(-DAIR_PRESSURE)
endif()

if(ENABLE_VISIT)
    add_definitions(-DVISIT)
endif()

if(ENABLE_NH)
    add_definitions(-DNH)
    find_package(PETSc REQUIRED)
endif()

if(ENABLE_LAG_PARTICLE)
    add_definitions(-DLAG_PARTICLE)
endif()

if(ENABLE_WAVE_CURRENT_INTERACTION)
    add_definitions(-DWAVE_CURRENT_INTERACTION)
endif()

if(ENABLE_PLBC)
    add_definitions(-DPLBC)
endif()

if(ENABLE_EXPLICIT)
    add_definitions(-DEXPLICIT)
endif()

if(ENABLE_WAVE_ONLY)
    add_definitions(-DWAVE_ONLY)
endif()

if(ENABLE_WAVE_ROLLER)
    add_definitions(-DWAVE_ROLLER)
    find_package(PETSc REQUIRED)
endif()

if(ENABLE_WAVE_OFFLINE)
    add_definitions(-DWAVE_OFFLINE)
    find_package(PETSc REQUIRED)
endif()

if(ENABLE_THIN_DAM)
    add_definitions(-DTHIN_DAM)
endif()

if(ENABLE_PWP)
    add_definitions(-DPWP)
endif()

if(ENABLE_LIMITER_VER_ADV)
    add_definitions(-DLIMITER_VER_ADV)
endif()

if(ENABLE_OLD_PETSC)
    add_definitions(-DOLD_PETSC)
endif()

if(ENABLE_DEVELOP1)
    add_definitions(-DDEVELOP1)
endif()

if(ENABLE_DEVELOP2)
    add_definitions(-DDEVELOP2)
endif()

if(ENABLE_DEVELOP3)
    add_definitions(-DDEVELOP3)
endif()

if(ENABLE_DEVELOP4)
    add_definitions(-DDEVELOP4)
endif()

if(ENABLE_DEVELOP5)
    add_definitions(-DDEVELOP5)
endif()

include(ConfigProjectVersion)
include(ConfigSafeGuards)

if (NOT FVCOM_ROOT)
    set (FVCOM_ROOT ${CMAKE_SOURCE_DIR}/src)
    if (NOT EXISTS ${FVCOM_ROOT})
        execute_process(
            COMMAND git submodule init
            COMMAND git submodule update
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            )
    endif()
endif()


if (NOT EXISTS ${FVCOM_ROOT}/FVCOM_source/libs/fproj.tgz)
    file(DOWNLOAD http://source.uit.no/files/fvcom-suppl-3.6.1.tgz
        ${FVCOM_ROOT}/fvcom-suppl-3.6.1.tgz
        )
    execute_process(
        COMMAND tar xfz fvcom-suppl-3.6.1.tgz
        WORKING_DIRECTORY ${FVCOM_ROOT}
        )
endif()

#find_package(HDF5 COMPONENTS Fortran)

if (NOT INTERNAL_NETCDF)
    set (NETCDF_F90 YES)
    find_package(NetCDF REQUIRED)
endif()


if (ENABLE_MPI)
    set(ENABLE_MULTIPROCESSOR ON)
    find_package(MPI)
    if (MPI_FOUND)
        set(HAVE_MPI TRUE)
        add_definitions(-DMULTIPROCESSOR)
        include_directories(${MPI_INCLUDE_PATH})
    endif()
endif ()

if (ENABLE_OPENMP)
    find_package(OpenMP)
    if (OPENMP_FOUND)
        set(HAVE_OPENMP TRUE)
        set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${OpenMP_C_FLAGS}")
    endif()
endif ()

set(MATH_LANG Fortran)
if (ENABLE_BLAS)
    if (BLAS_TYPE)
        find_package(BLAS COMPONENTS ${BLAS_TYPE})
    else()
        find_package(BLAS)
    endif()
endif ()
if (ENABLE_LAPACK)
    if (LAPACK_TYPE)
        find_package(LAPACK COMPONENTS "${LAPACK_TYPE}")
    else()
        find_package(LAPACK)
    endif()
endif ()

##include(ConfigGitRevision)
include(FortranCInterface)
FortranCInterface_HEADER(FC.h MACRO_NAMESPACE "FC_")

configure_file (
    ${PROJECT_SOURCE_DIR}/config.h.in
    ${PROJECT_BINARY_DIR}/config.h
    )

add_subdirectory(libs)
add_subdirectory(make)

if (ENABLE_SYMBIOSES)
    find_package(SYMBIOSES REQUIRED)
    find_package(Python REQUIRED)
    include(UseCython)
    set(PYTHON_SITE_INSTALL_DIR
        lib/python${PYTHON_VERSION}/site-packages/Symbioses)
    add_subdirectory(src/symbioses)
endif()

if (ENABLE_TESTS)
    set (PROJECT_REPOSITORY "https://git.example.com/example")
    include(ConfigTesting)
    add_subdirectory(testing)
endif()

#install(DIRECTORY models DESTINATION share/fvcom)
#install(DIRECTORY run DESTINATION share/fvcom)

##########################################################
## Packaging configuration

include(GNUInstallDirs)
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "FVCOM")
set(CPACK_PACKAGE_VENDOR "SMAST/UMASSD")
set(CPACK_PACKAGE_CONTACT "Changsheng Chen <c1chen@umassd.edu>")
set(CPACK_PACKAGE_URL "http://fvcom.smast.umassd.edu")
set(CPACK_PACKAGE_DESCRIPTION_FILE ${CMAKE_CURRENT_SOURCE_DIR}/INSTALL.rst)
set(CPACK_RESOURCE_FILE_README ${CMAKE_CURRENT_SOURCE_DIR}/README.rst)
set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_CURRENT_SOURCE_DIR}/COPYING)
set(CPACK_GENERATOR TGZ DEB RPM)
include(ConfigPackaging)

# vim:ft=cmake
