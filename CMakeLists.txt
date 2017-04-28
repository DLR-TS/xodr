cmake_minimum_required(VERSION 2.6)

project (xodr)

# STATIC library output directory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib)

add_library(libXodr STATIC src/OpenDRIVE_1.4H.cpp)

find_path(XSD_INCLUDE xsd)
find_path(XERCES_INCLUDE xercesc)
find_library(XERCES_LIB xerces-c_3.lib)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include ${XSD_INCLUDE} ${XERCES_INCLUDE})

target_link_libraries(libXodr "${XERCES_LIB}")