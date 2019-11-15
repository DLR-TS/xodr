# xodr
Easily accessible C++ object structure of [OpenDRIVE](http://opendrive.org/) automatically generated from the [OpenDRIVE XSD schema](http://opendrive.org/download.html). Currently only OpenDRIVE 1.4 is supported. 

## Building
### Dependencies
Make sure to meet these dependencies in advance: 
- [CodeSynthesis XSD](http://codesynthesis.com/products/xsd/) in conjunction with 
- [Xerces-C++](https://xerces.apache.org/xerces-c/)

### Building on Unix
With CMake as plattform-independent build tool **xodr** can be configured for various native build environments. An exemplary configuration for Make under Unix:
```
cd xodr
mkdir build
cd build
cmake ..
```
To build the project afterwards run
```
make
```
If everything went fine you will find the resulting library in the `lib/` folder of the project root.

## Source Code Generation
For convenience the underlying OpenDRIVE schema is provided in `schema/` but can be obtained from the [OpenDRIVE download section](http://opendrive.org/download.html) in recent and previous versions. The C++ class structure was generated with [CodeSynthesis XSD](http://codesynthesis.com/products/xsd/) and can be automatically re-generated using the XML data binding tool `xsd`. The code used in **xodr** was generated with `xsd` version 4.0.0 as follows:
```
xsd cxx-tree --hxx-suffix .h --cxx-suffix .cpp --reserved-name access=parkingSpace_access --reserved-name link=lane_link --reserved-name signal=t_signal --reserved-name max=t_max --std c++11 schema/OpenDRIVE_1.4H.xsd
```
## Licence
Due to XSD's [FLOSS Exception](http://www.codesynthesis.com/projects/xsd/FLOSSE) the generated code is includable in various Free/Libre and Open Source Software projects, see [XSD Licence](http://www.codesynthesis.com/products/xsd/license.xhtml).
