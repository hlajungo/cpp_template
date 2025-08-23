#!/bin/bash

p_cmake
{
  cmake -S my_project -B build/my_project
  cmake --build build/my_project
  cmake --install build/my_project --prefix ./install/my_project
}

s_cmake
{
  cmake -S standalone/ -B build/standalone
  cmake --build build/standalone
  cmake --install build/standalone/ --prefix ./install/standalone
}

t_cmake
{
  cmake -S test/ -B build/test
  cmake --build build/test
  ctest --test-dir ./build/test --output-on-failure
}

d_cmake
{
  cmake -S documentation/ -B build/documentation
  cmake --build build/documentation --target GenerateDocs
  open build/documentation/doxygen/html/index.html
}
