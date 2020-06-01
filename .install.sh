 #!/bin/bash
 
 if [ -a /var/lib/dpkg/lock ]
  then sudo rm /var/lib/dpkg/lock
  fi
 if [ -a /var/cache/apt/archives/lock ]
  then sudo rm /var/cache/apt/archives/lock
  fi
 sudo dpkg --configure -a
 sudo apt-get update
 sudo apt-get install r-base -y
 sudo Rscript -e 'install.packages("dplyr", repos="https://cran.rstudio.com")'
 sudo Rscript -e 'install.packages("readr", repos="https://cran.rstudio.com")'