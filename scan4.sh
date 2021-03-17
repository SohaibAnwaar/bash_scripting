
# 2A 3A
MASTER=("MasterList")
TMP="/tmp$$"
touch 'sample'$TMP
rm 'sample'$TMP


# 3D
flag=0
for f in sample/*;
    do
        if [[ $f == 'sample/'$MASTER ]]
            then
                flag=1       
        fi
    done

if [[ $flag == 0 ]]
    then
        echo "system error "$MASTER" file doesnot exists please generate it"
        exit 1
    fi

# 3B
for f in sample/*; 
    do
        if [[ $f != 'sample'$TMP ]]
            then
            ls -la $f >> 'sample'$TMP
        fi
    done

# 2C
for f in sample/*; 
    do
        if [[ $f != 'sample/'$MASTER ]]
            then
            ls -la $f >> 'sample/'$MASTER
            
        else
            touch 'sample'/$MASTER
                    
        fi
    done


echo "Changed Files"
echo 'sample/'$MASTER 'sample'$TMP
difference=$(diff 'sample/'$MASTER 'sample'$TMP )
echo $difference 

# Removing Files
get_file=$(sed -r 's/[0-9]{1,10}$//'<<<$TMP)
find sample | grep $get_file| xargs -I {} rm -f {};
exit 0