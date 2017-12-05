# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/pyspark-notebook

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

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
