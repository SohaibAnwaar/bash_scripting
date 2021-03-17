MASTER=("Master.txt")
# List=(
#       Item1 
#       Item2 
#       Item3
#      )

for f in sample/*; 
    do
        for file in ${MASTER[*]}
            do
                # echo $f $file
                if [[ $f == 'sample/'$file ]]
                    then
                        echo "System error" $f "exists" 
                        exit 1
                else
                    touch 'sample'/$file
                            
                fi
            done
    done