# tensorflow-compile-docker
This repository helps creating a docker container that enables tensorflow compilation
To compile tensorflow do:

```
# docker build -t ts .
# docker run -it ts
# cd tensorflow
# ./configure
# bazel build -c opt --copt=-mavx --copt=-mavx2 --copt=-mfma --copt=-mfpmath=both --copt=-msse4.2 -k //tensorflow/tools/pip_package:build_pip_package
```
Outputs wheel in **/tmp/tensorflow_pkg/**.
