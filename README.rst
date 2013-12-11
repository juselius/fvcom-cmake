CMake for FVCOM
=================

This project provides CMake build support for FVCOM.

The project works with the unmodified FVCOM source distribution,
unpacked into the src/ directory. Please make sure to use the branch
corresponding to the actual version of FVCOM.

Quick install
---------------
To configure, build and install the package in the simplest manner::

    $ git checkout v3.6.1
    $ cd src
    $ tar vfxz /path/to/FVCOM-3.6.1.tgz --strip-components=1
    $ cd ..
    $ ./setup
    $ cd build
    $ make install


For detailed installation instructions see INSTALL.rst.
