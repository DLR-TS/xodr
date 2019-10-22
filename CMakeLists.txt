cmake_minimum_required(VERSION 3.5.2)
project (xodr)

# STATIC library output directory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)

add_library(xodr STATIC src/OpenDRIVE_1.4H.cpp)
add_library(xodr::xodr ALIAS xodr)

set_target_properties(xodr PROPERTIES POSITION_INDEPENDENT_CODE ON)

find_package(XercesC REQUIRED)
find_path(XSD_INCLUDE_DIR xsd)

target_include_directories(xodr
    PRIVATE
        ${XSD_INCLUDE_DIR}
    PUBLIC   
${CMAKE_CURRENT_SOURCE_DIR}/include)


target_link_libraries(xodr
    INTERFACE
        XercesC::XercesC)
