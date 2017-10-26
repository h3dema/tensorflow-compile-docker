# tensorflow-compile-docker
This repository helps creating a docker container that enables tensorflow compilation using SSE4.1, SSE4.2, and AVX.

To compile tensorflow do:

```
$ docker build -t ts github.com/h3dema/tensorflow-compile-docker
$ docker run -it ts
```

In the docker container:
```
user@d9dd40daf170:/tensorflow$ cd tensorflow
user@d9dd40daf170:/tensorflow$ ./configure
```

## Build ##

To build a pip package for TensorFlow with CPU-only support:
```
user@d9dd40daf170:/tensorflow$ bazel build -c opt --copt=-mavx --copt=-mavx2 --copt=-mfma --copt=-mfpmath=both --copt=-msse4.2 -k //tensorflow/tools/pip_package:build_pip_package
```
Outputs wheel in **/tmp/tensorflow_pkg/**.
See more information about the compilation on https://www.tensorflow.org/install/install_sources.
The bazel build command builds a script named build_pip_package.
Run this script to build a .whl file within the /tmp/tensorflow_pkg directory:
```
user@d9dd40daf170:/tensorflow$ bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
```

## Install ##


To install the pip package in your system, you should see the generated wheel file. In our case, the file is *tensorflow-1.4.0rc0-cp35-cp35m-linux_x86_64.whl* as shown below. Note that the filename of the .whl file depends on your platform.

```
user@d9dd40daf170:/tensorflow$ ls /tmp/tensorflow_pkg/
tensorflow-1.4.0rc0-cp35-cp35m-linux_x86_64.whl
```

Invoke pip install command to install tensorflow package.
The following command installs the our pip package.
```
user@d9dd40daf170:/tensorflow$ sudo pip install /tmp/tensorflow_pkg/tensorflow-1.4.0rc0-cp35-cp35m-linux_x86_64.whl
```
