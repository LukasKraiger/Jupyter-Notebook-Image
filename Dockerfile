FROM jupyter/r-notebook

USER root

RUN apt-get update \
&& apt-get upgrade -y \
&& pip install 'jupyterlab>=3.0.0,<4.0.0a0' jupyterlab-lsp \
&& apt-get clean all

RUN Rscript -e "install.packages(c('tidyverse', 'sjlabelled', 'haven', 'magrittr', 'dplyr', 'psych'), repos='https://cran.wu.ac.at/');"

#COPY user-settings /home/rstudio/.rstudio/monitored/user-settings/user-settings
#COPY .Rprofile /home/rstudio/