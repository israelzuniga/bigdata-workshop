# Original file forked from Jupyter Dev team
# Actual maintainer for this repo/class: Israel Z.
# 2017, Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/pyspark-notebook

LABEL maintainer="Israel Zúñiga de la Mora <hola@israelzuniga.com>"

# Apache Toree kernel
RUN pip install --no-cache-dir \
    https://dist.apache.org/repos/dist/dev/incubator/toree/0.2.0/snapshots/dev1/toree-pip/toree-0.2.0.dev1.tar.gz \
    && \
    jupyter toree install --sys-prefix && \
    fix-permissions $CONDA_DIR

# Spylon-kernel
RUN conda install --quiet --yes 'spylon-kernel=0.4*' && \
    conda clean -tipsy && \
    python -m spylon_kernel install --sys-prefix && \
    fix-permissions $CONDA_DIR

# Install Tensorflow
RUN conda install --quiet --yes \
    'tensorflow=1.3*' \
    'keras=2.0*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR

# h2o
# This requires python-software-properties and Java.
RUN apt-get install -y python-software-properties zip && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list &&     echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list &&     apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 C857C906 2B90D010 && \
    apt-get update && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    cd /usr/local/src && mkdir h2o && cd h2o && \
    wget http://h2o-release.s3.amazonaws.com/h2o/latest_stable -O latest && \
    wget --no-check-certificate -i latest -O h2o.zip && rm latest && \
    unzip h2o.zip && rm h2o.zip && cp h2o-*/h2o.jar . && \
    pip install `find . -name "*whl"` && \
