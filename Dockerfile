#
# to compile tensorflow do:
#
# docker build -t ts .
# docker run -it ts
# cd tensorflow
# ./configure
# bazel build -c opt --copt=-mavx --copt=-mavx2 --copt=-mfma --copt=-mfpmath=both --copt=-msse4.2 -k //tensorflow/tools/pip_package:build_pip_package
#
# saida em: /tmp/tensorflow_pkg/

FROM ubuntu:16.04
#FROM ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y binutils python3-minimal python3 software-properties-common git python3-numpy python3-dev python3-pip python3-wheel python-pip && \
    apt-get -y install curl
RUN pip install --upgrade pip

# Ubuntu 16.04:
RUN apt-get -y install openjdk-8-jdk

# Ubuntu 14.04:
#RUN add-apt-repository -y ppa:openjdk-r/ppa && \
#    apt-get -y update && \
#    apt-get -y install openjdk-8-jdk

RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee -a /etc/apt/sources.list.d/bazel.list && \
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add - && \
    apt-get -y update && \
    apt-get -y install bazel && \
    apt-get -y upgrade bazel

RUN git clone https://github.com/tensorflow/tensorflow.git

#RUN cd /usr/bin/ && \
#    ln -s python3 python
