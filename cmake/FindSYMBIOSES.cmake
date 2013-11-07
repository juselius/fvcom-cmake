# - Find the SYMBIOSES include files and librariers
#
# This module defines
#  SYMBIOSES_INCLUDE_DIR, where to find include files, etc.
#  SYMBIOSES_LIBRARIES, the libraries to link against to use SYMBIOSES.
#  SYMBIOSES_DEFINITIONS - You should add_definitons(${SYMBIOSES_DEFINITIONS}) before
#  compiling
#  SYMBIOSES_FOUND, If false, do not try to use SYMBIOSES.
# also defined, but not for general use are
# None of the above will be defined unles SYMBIOSES can be found.
#

#=============================================================================
# Copyright 2012 Jonas Juselius <jonas.juselius@uit.no>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distributed this file outside of CMake, substitute the full
#  License text for the above reference.)

if (SYMBIOSES_INCLUDE_DIR AND SYMBIOSES_LIBRARIES)
    set(SYMBIOSES_FIND_QUIETLY TRUE)
endif ()

find_path(SYMBIOSES_INCLUDE_DIR
    NAMES symbioses.h
    PATHS ${SYMBIOSES_ROOT} $ENV{SYMBIOSES_ROOT}
    PATH_SUFFIXES include
    NO_DEFAULT_PATH
    )
find_path(SYMBIOSES_INCLUDE_DIR symbioses.h)

find_library(SYMBIOSES_LIBRARIES symbioses
    PATHS ${SYMBIOSES_ROOT} $ENV{SYMBIOSES_ROOT}
    PATH_SUFFIXES lib
    NO_DEFAULT_PATH
    )
find_library(SYMBIOSES_LIBRARIES symbioses)

find_path(SYMBIOSES_LIBRARY_DIR
    NAMES libsymbioses.so libsymbioses.a
    PATHS ${SYMBIOSES_ROOT} $ENV{SYMBIOSES_ROOT}
    PATH_SUFFIXES lib lib64
    )

find_path(SYMBIOSES_PYTHON_PACKAGES 
    NAMES SymbiosesFramework.so
    PATHS ${SYMBIOSES_ROOT} $ENV{SYMBIOSES_ROOT}
    PATH_SUFFIXES 
        lib/python${PYTHON_VERSION}/site-packages/Symbioses
        lib/python${PYTHON_VERSION}/site-packages
    NO_DEFAULT_PATH
    )


include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(SYMBIOSES DEFAULT_MSG
    SYMBIOSES_INCLUDE_DIR 
    SYMBIOSES_LIBRARIES
    SYMBIOSES_LIBRARY_DIR
    SYMBIOSES_PYTHON_PACKAGES 
    )

mark_as_advanced(
    SYMBIOSES_INCLUDE_DIR 
    SYMBIOSES_LIBRARIES
    SYMBIOSES_LIBRARY_DIR
    SYMBIOSES_PYTHON_PACKAGES 
    )
