stored_password=$1
input_password=$2
    
if [ $stored_password = $input_password ]; then
    echo "Correct password entered. Proceeding further"
else
    echo "Incorrect password. Please try again"
fi
