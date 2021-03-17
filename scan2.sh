MASTER=("MasterList")
TMP="/tmp$$"
touch 'sample'$TMP
rm 'sample'$TMP
touch 'sample/'$MASTER

# Old code
for f in sample/*; 
    do
        if [[ $f != 'sample/'$MASTER ]]
            then
            ls -la $f >> 'sample/'$MASTER
            
        else
            touch 'sample'/$MASTER
                    
        fi
    done
echo $?

# # Modified Code
# flag=0
# for f in sample/*;
#     do
#         if [[ $f == 'sample/'$MASTER ]]
#             then
#                 flag=1       
#         fi
#     done

# if [[ $flag == 0 ]]
#     then
#         echo "system error "$MASTER" file doesnot exists please generate it"
#         exit 1
#     fi

# for f in sample/*; 
#     do
#         if [[ $f != 'sample'$TMP ]]
#             then
#             ls -la $f >> 'sample'$TMP
#         fi
#     done


# echo "Changed Files"
# rm 'sample'$TMP*
# exit 1