if [ -a .hidden.txt ]
  then sudo rm .hidden.txt
  fi
#R CMD BATCH prog.R > .hidden.txt
Rscript prog.R > .hidden.txt
FS_SCORE=0 
if [ $(grep -e "filter" prog.R | wc -l) -gt 0 ]&&[ $(grep -e "arrange" prog.R | wc -l) -gt 0 ]&&[ $(grep -e "%>%" prog.R | wc -l) -gt 0 ]&&[ $(grep -e "2005-01-01" prog.R | wc -l) -gt 0 ]&&[ $(grep -e "2005-01-27 " .hidden.txt | wc -l) -gt 0 ]
  then FS_SCORE=$((FS_SCORE+50))
fi
if [ $(grep -e "format" prog.R | wc -l) -gt 0 ]&&[ $(grep -e "group_by" prog.R | wc -l) -gt 0 ]&&[ $(grep -e "mutate" prog.R | wc -l) -gt 0 ]&&[ $(grep -e "summarize" prog.R | wc -l) -gt 0 ]||[ $(grep -e "summarise" prog.R | wc -l) -gt 0 ]&&[ $(grep -e "n()" prog.R | wc -l) -gt 0 ]&&[ $(grep -e "2006" .hidden.txt | wc -l) -gt 0 ]
  then FS_SCORE=$((FS_SCORE+50))
fi
echo "FS_SCORE:$FS_SCORE%"
