# xodr
Easily accessible C++ object structure of OpenDRIVE.

## Source Code Generation
The C++ class structure can been automatically generated, e.g., using the XML data binding tool `xsd` from [CodeSynthesis XSD](http://codesynthesis.com/products/xsd/). The code used here in `xodr` was generated as follows:
```
xsd cxx-tree --hxx-suffix .h --cxx-suffix .cpp --reserved-name access=parkingSpace_access --reserved-name link=lane_link OpenDRIVE_1.4H.xsd
```
