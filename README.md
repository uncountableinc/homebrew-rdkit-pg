# rdkit-pg-homebrew

Setup procedure.

* Get the source of rdkit from git. https://github.com/rdkit/rdkit
* We currently use version 4.2. So that maps to the tag `git checkout Release_2022_09_5`


* Make patches for 1.90 boost compat.
  * Remove boost_system requirement (boost >1.89 this became a header only dependency)
  * Find and replace where system is marked as a component.
  * find_package(Boost ${RDK_BOOST_VERSION} COMPONENTS system iostreams REQUIRED)

* Fix boost header issue with new 1.90.
  * Edit Code/RDGeneral/RDValue-taggedunion.h
      * Add `#include <boost/numeric/conversion/cast.hpp>`

* Make a fresh build
  * mkdir -p build
  * `cmake -DRDK_BUILD_PGSQL=ON    -D RDK_PGSQL_STATIC=ON  -DRDK_BUILD_CPP_TESTS=OFF -DRDK_INSTALL_INTREE=ON  -DRDK_BUILD_PGSQL=ON -DRDK_PGSQL_STATIC=ON -DRDK_BUILD_CPP_TESTS=OFF -DRDK_INSTALL_INTREE=ON -DRDK_BUILD_PYTHON_WRAPPERS=OFF  ..`
  * This will fail on the font step, manually download that font from google. Skip downloading it in the CMakeLists file.


* Finally that should produce a build.


* Come back to this folder:
  * `./makezip.sh 4.2 $HOME/rdkit $HOME/rdkit/build`
  * On mac m1 arm this will produce the file: rdkit-pg_4.2_arm64.zip
  * Take the sha256sum of the zip.
  * Update the `Casks/rdkit-pg.rb` add the new shasum, then also bump the github release tag from 4.2.0 to 4.2.0-X to
  * Merge those changes into master via github PR.
  * Upload the zip to the release for 4.2.0-X

