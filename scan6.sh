#!/bin/bash
MASTER=("Master.txt")
GENMASTER=0
DELMASTER=0
flag1=0
flags=''

while getopts "dgm:" OPTION
    do
        flags+=$OPTION
        echo $OPTARG
        if [[ $OPTION == 'm' ]]
            then

                MASTER=$OPTARG
                echo "Master Filename set $MASTER"
        fi
    done


echo $flags
if [[ "$flags" == 'dg' || "$flags" == 'gd' ]]
    then
        echo "Only one of -d -g is allowed"
        exit 1
fi


# G flag
if [[ "$flags" == "g" || "$flags" == "gm" || "$flags" == "mg" ]]
    then
        echo "File Generation"
        GENMASTER=1

        if [[ -f 'sample/'$MASTER ]]
            then
                echo "file already exists"
        else
            echo "file created"
            touch 'sample/'$MASTER
        fi

elif [[ "$flags" == 'd' || "$flags" == "dm" || "$flags" == "md" ]]
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

elif [[ "$flags" == 'm' ]]
    then 
        echo "Kindly specefiy -d or -g with flag -m"


else
    echo "Unknown option"
    exit 1

fi
    
    

# while getopts "bf:" OPTION
# do
# 	case $OPTION in
# 		b)
# 			echo "You set flag -b"
# 			exit
# 			;;
# 		f)
# 			echo "The value of -f is $OPTARG"
# 			MYOPTF=$OPTARG
# 			echo $MYOPTF
# 			exit
# 			;;
# 		\?)
# 			echo "Used for the help menu"
# 			exit
# 			;;
# 	esac
# done