#!/bin/bash
MASTER=("Master.txt")
GENMASTER=0
DELMASTER=0
flag1=0
flag2=0
flags=''

while getopts "dg" OPTION
    do
        flags+=$OPTION

    done
echo $flags
if [[ "$flags" == 'dg' || "$flags" == 'gd' ]]
    then
        echo "Only one of -d -g is allowed"
        exit 1
fi


# G flag
if [[ "$flags" == "g" ]]
    then
        GENMASTER=1

        if [[ -f 'sample/'$MASTER ]]
            then
                echo "Master file exists, Please delete it"
        else
            echo "file created"
            touch 'sample/'$MASTER
        fi

elif [[ "$flags" == 'd' ]]
    then
        echo "File Deletion"
        DELMASTER=1
        for f in sample/*; 
            do
                if [[ $f == 'sample/'$MASTER ]]
                    then
                        echo "Deleting Files"
                        rm 'sample/'$MASTER
                        flag1=0
                        break
                    
                else
                    flag1=1
                            
                fi
            done

        if [[ $flag1 == 1 ]]
            then
            echo "System Error Master file doesnot exists"
        fi
elif [[ "$flags" == '' ]]
    then 
        bash scan4.sh
else
    echo "Unknown option"
    exit 1

fi
    
    

