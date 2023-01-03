FROM jupyter/r-notebook

USER root

RUN apt-get update \
&& apt-get upgrade -y \
&& pip install 'jupyterlab>=3.0.0,<4.0.0a0' jupyterlab-lsp \
&& apt-get clean all

RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y libgit2-dev build-essential libcurl4-gnutls-dev libxml2-dev  \
&& apt-get install -y libssl-dev libfontconfig1-dev freetype2-doc libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev \
&& apt-get clean all && \
apt-get purge && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
#https://stackoverflow.com/questions/65433724/configuration-failed-to-find-libgit2-library
#https://github.com/r-lib/devtools/issues/2131
 

#RUN Rscript -e "install.packages(c('tidyverse', 'sjlabelled', 'haven', 'magrittr', 'dplyr', 'psych', 'knitr', 'ggthemes'), repos='https://cran.wu.ac.at/');"
RUN R -e "install.packages('devtools', dependencies=TRUE, repos='https://cran.wu.ac.at/');   if (!library(devtools, logical.return=T)) quit(status=10)"
RUN R -e "install.packages('tidyverse', dependencies=TRUE, repos='https://cran.wu.ac.at/');   if (!library(tidyverse, logical.return=T)) quit(status=10)"
RUN R -e "install.packages('sjlabelled', dependencies=TRUE, repos='https://cran.wu.ac.at/');   if (!library(sjlabelled, logical.return=T)) quit(status=10)"
RUN R -e "install.packages('haven', dependencies=TRUE, repos='https://cran.wu.ac.at/');   if (!library(haven, logical.return=T)) quit(status=10)"
RUN R -e "install.packages('magrittr', dependencies=TRUE, repos='https://cran.wu.ac.at/');   if (!library(magrittr, logical.return=T)) quit(status=10)"
RUN R -e "install.packages('dplyr', dependencies=TRUE, repos='https://cran.wu.ac.at/');   if (!library(dplyr, logical.return=T)) quit(status=10)"
RUN R -e "install.packages('psych', dependencies=TRUE, repos='https://cran.wu.ac.at/');   if (!library(psych, logical.return=T)) quit(status=10)"
RUN R -e "install.packages('knitr', dependencies=TRUE, repos='https://cran.wu.ac.at/');   if (!library(knitr, logical.return=T)) quit(status=10)"
RUN R -e "install.packages('ggthemes', dependencies=TRUE, repos='https://cran.wu.ac.at/');   if (!library(ggthemes, logical.return=T)) quit(status=10)"
RUN R -e "devtools::install_github('LukasKraiger/frame')"
#https://stackoverflow.com/questions/45289764/install-r-packages-using-docker-file

#COPY user-settings /home/rstudio/.rstudio/monitored/user-settings/user-settings
#COPY .Rprofile /home/rstudio/
