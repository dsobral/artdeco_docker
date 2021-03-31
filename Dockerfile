#Set OS
FROM conda/miniconda3

RUN apt-get update && apt-get upgrade -y && apt-get install build-essential zlib1g-dev -y

#Bioconda setup:
#Add the bioconda channel:
RUN conda config --add channels defaults --add channels bioconda --add channels conda-forge

#all the necessary packages for artdeco:
RUN conda install bedops=2.4.* bioconductor-deseq2=1.20.* bx-python=0.8.* homer=4.9.* networkx=2.* numpy=1.16.* pandas=0.24.* pybigwig rpy2=2.9.* rseqc=3.0.* samtools=1.9

RUN git clone https://github.com/sjroth/ARTDeco.git && \
	cd ARTDeco && \
	python setup.py install
