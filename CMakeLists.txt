cmake_minimum_required(VERSION 2.6)
project (xodr)
include(FindXercesC)

# STATIC library output directory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib)

add_library(xodr STATIC src/OpenDRIVE_1.4H.cpp)
set_property(TARGET xodr PROPERTY POSITION_INDEPENDENT_CODE ON)

find_package(XercesC REQUIRED)
find_path(XSD_INCLUDE_DIR xsd)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include ${XSD_INCLUDE_DIR} ${XercesC_INCLUDE_DIR})

target_link_libraries(${PROJECT_NAME} ${XercesC_LIBRARY})
