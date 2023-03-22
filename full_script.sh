#!/bin/bash

echo "###--FILE TEST--###"
# The program prompts the user to enter the file name and then if uses the file command to check if the file exist
# if also checks if the file is readable,and also checks if the file has access permission, has execute permission and if its a directory or an ordinary file
echo "--------------------This program checks on the following:---------------------------------------------"
echo "1. whether the file exists"
echo "2. whether the file has access permission"
echo "3. whether the file has execute permission"
echo "4. whether the file has read permission"
echo "5. whether the file is a directory or an ordinary file"
echo ""
echo ""
echo "Enter the file name with extension eg: sharonfile.sh"

read file



if [ -e "$file" ]
then
   echo "File exists"
else
   echo "File does not exist"
   exit 1
fi

if [ -r "$file" ]
then
   echo "File has read access"
else
   echo "File does not have read access"
fi

if [ -w "$file" ]
then
   echo "File has write permission"
else
   echo "File does not have write permission"
fi

if [ -x "$file" ]
then
   echo "File has execute permission"
else
   echo "File does not have execute permission"
fi

if [ -d "$file" ]
then
   echo "File is a directory"
elif [ -f "$file" ]
then
   echo "File is an ordinary file"
else
   echo "This is a special file"
fi

echo "###--REDIRECTION--###"
# Redirect stdout to a file
echo "----------------------------REDIRECTION---------------------------------"
echo "This is some text that will be redirected to a file." > output.txt

echo ""
# Redirect stderr to a file
ls /nonexistent 2> error.txt
# Redirect both stdout and stderr to a file

ls /nonexistent &> output_error.txt

# Append stdout to a file
echo "This text will be appended to the end of the output.txt file." >> output.txt

# Redirect stdin from a file
echo "Enter a value: "
read var 

echo "$var" >> val-output.txt
echo "Hello linux"> hello.txt
# Redirect stdout to a file and also display it on the screen
echo "This text will be displayed on the screen and also saved to a file." | tee output_screen.txt
echo ""
# Redirect stdout to a file and stderr to another file

ls /nonexistent > output.txt 2> error.txt

echo ""
# Redirect stdout to a file and also display it on the screen, but don't display stderr

ls /nonexistent 2> /dev/null | tee output_screen.txt

echo ""

echo ""
# Use process substitution to redirect output to a command instead of a file
grep "text" <(echo "This is some text that we will search for.")
echo ""
# Redirect stdout to a named pipe
mkfifo mypipe
ls -l > mypipe & cat mypipe
echo ""
# Close the named pipe
rm mypipe

echo "###--LOOPS--###"
#Bash Until Loop example with a single condition  
  
i=1  
until [ $i -gt 10 ]  
do  
echo $i  
((i++))  
done
 
#Bash Until Loop example with multiple conditions  
  
max=5  
a=1  
b=0  
  
until [[ $a -gt $max || $b -gt $max ]];  
do  
echo "a = $a & b = $b."  
((a++))  
((b++))  
done




#Script to get specified numbers  
  
read -p "Enter starting number: " snum  
read -p "Enter ending number: " enum  
  
while [[ $snum -le $enum ]];  
do  
echo $snum  
((snum++))  
done  
  
echo "This is the sequence that you wanted";

#Script to get specified numbers  
  
read -p "Enter starting number: " snum  
read -p "Enter ending number: " enum  
  
while [[ $snum -lt $enum || $snum == $enum ]];  
do  
echo $snum  
((snum++))  
done  
  
echo "This is the sequence that you wanted.";
      
    
echo "###--DECISION MAKING--###"
#We are going to use some logical operators (AND, OR) with the if statement

#The program will take the values of username and password entered by the user and then compare them with `admin` and `secret'

echo "------------Using if statement------------"

#Prompt the user to enter username and password 

echo " ----input  Username as admin  and password as secret to print Valid user , otherwise it will output invalid user"
echo ""
echo "Enter Your Username";

read username

echo "Enter your password";

read password

# if condition to check if the entered username and password are the same with the values programmed  (`admin` and `secret`)

if [[ ( $username == "admin" && $password == "secret" ) ]];

# The statement will be executed if the condition is true
   then

   echo "Valid USer";

# The statement will be executed if the condition is false

else
   echo "Invalid User"

fi

# Using  if statement with the OR logic

echo "--------if statement with the OR logic---------------"

echo ""

echo " Enter any number"
read n

echo "-------if you enter either  15 or 45 you will win the game, otherwise you will lose---------"
if [[ ( $n -eq 15 || $n -eq 45) ]]

then 
    echo "you won the game"

else
    echo "You lost the game"
fi



# Using else if statement
echo "------else if condition--------"
echo ""
echo " --------You will be given prizes if you enter either 101, 510 or 999 , Otherwise you will have to try next time"
echo ""
echo "Enter your lucky number"
read n

if [ $n -eq 101 ]
  then
   echo "You got 1st prize";

elif [ $n -eq 510 ]
   then
    echo "You got the 2nd prize"

elif [ $n -eq 999 ]
   then
    echo "you got the 3rd prize"

else 
    echo "Sorry, try next time"

fi


# Using case statement
echo "--------Using the case statement---------"
echo ""

echo "Enter your lucky number"
read n

case $n in
101 )
   echo "You got the 1st prize"
   ;;

510 )
   echo " You got the 2nd prize"
   ;;

999 )
   echo "You got the 3rd prize"
   ;;

* )
   echo "Sorry, try for the next time"
   ;;

esac

echo "###--ARRAYS--###"
# Create an array containing a list of colors
my_colors=("red" "green" "blue" "yellow")

# Loop through each color in the array
for color in ${my_colors[@]}; do
    echo "The color is $color"
done

# Create an associative array containing a list of animals
declare -A my_animals
my_animals=(["dog"]="canine" ["cat"]="feline" ["fish"]="aquatic")

# Loop through each animal in the array
for animal in "${!my_animals[@]}"; do
    echo "The $animal is a ${my_animals[$animal]}"
done

# Create an array containing the first 10 numbers
my_nums=()
for i in $(seq 1 10); do
    my_nums+=("$i")
done

# Loop through each number in the array
for num in "${my_nums[@]}"; do
    echo "The number is $num"
done

# Create an array containing a list of files
my_files=($(ls))

# Loop through each file in the array
for file in "${my_files[@]}"; do
    echo "The file is $file"
done

# Create an array containing a list of users
my_users=("root" "user1" "user2")

# Loop through each user in the array
for user in "${my_users[@]}"; do
    echo "The user is $user"
done

# Create an array containing a list of ips
my_ips=("192.168.0.1" "192.168.0.2" "192.168.0.3")

# Loop through each ip in the array
for ip in "${my_ips[@]}"; do
    echo "The ip is $ip"
done

# Create an array containing a list of system processes
my_processes=("apache2" "sshd" "mysql")

# Loop through each process in the array
for process in "${my_processes[@]}"; do
    echo "The process is $process"
done

# Create an array containing a list of ports
my_ports=("80" "22" "3306")

# Loop through each port in the array
for port in "${my_ports[@]}"; do
    echo "The port is $port"
done
echo "###--PERMISSION SETTING--###"
# script to change permission of file 

# File variable to store file.txt location 
FILE="file.txt"

# to check the file we want to change 
# exists or not
if [[ ! -e  "${FILE}" ]]
then
   echo "creating  ${FILE} file"
   touch file.txt
fi

# to remove  write permission of other and group of file
chmod 744 "${FILE}"

#to check if the permission are removed
ls -l  "${FILE}"

echo "###--BASIC UTILITY--###"
# create a new directory and change into it
mkdir basic_utils
cd basic_utils

# create a new file and add some text
echo "Hello, World!" > example.txt

# display the contents of the file
cat example.txt

# copy the file to a new location
cp example.txt ./example_copy.txt

# display the contents of the copied file
cat ../example_copy.txt

# create a compressed archive of the copied file
tar -czvf example_copy.tar.gz ../example_copy.txt

# display the contents of the archive
tar -tzvf example_copy.tar.gz

# extract the contents of the archive
tar -xzvf example_copy.tar.gz

# display the contents of the extracted file
cat example_copy.txt

# change the permissions of the extracted file
chmod 777 example_copy.txt

# connect to a remote server using SSH protocol
#ssh user@server.com

# delete the original file and directory
#cd ..
#rm -r Basic utilities
ls -l
echo "###--PIPES--###"
 
echo "-------------------------------------PIPES--------------------------------------"
# Define the input data
input_data="10 2 5 3 6"

# Use 'tr' to replace spaces with line breaks
numbers=$(echo $input_data | tr " " "\n")

# Use 'sort' to sort the numbers in ascending order
sorted=$(echo "$numbers" | sort -n)

# Use 'tail' to get the last three numbers in the list
last_three=$(echo "$sorted" | tail -n 3)

# Use 'echo' to display the last three numbers
echo "The last three numbers are: $last_three"

# Use 'awk' to perform arithmetic operations
result=$(echo "$last_three" | awk '{sum+=$1} END {print sum}')

# Use 'echo' to display the result
echo "The sum of the last three numbers is: $result"




echo ""


# Define input variables
echo "Enter the first number"
read a

echo ""
echo "Enter the second number"
read b



# Add a and b
add=$(echo "$a + $b" | bc)

# Subtract b from a
sub=$(echo "$a - $b" | bc)

# Multiply a and b
mul=$(echo "$a * $b" | bc)

# Divide a by b
div=$(echo "scale=2; $a / $b" | bc -l)

# Modulus of a and b
mod=$(echo "$a % $b" | bc)


echo " The sum is: $add"
echo " The difference is: $sub"
echo " The product is: $mul"
echo " The ratio is: $div"

echo ""
echo ""


# Filter out even numbers from 1 to 10
echo "Filter out even numbers from 1 to 10"
seq 1 10 | awk '$1 % 2 == 0'

echo ""
# Pipe output of even numbers to calculate sum
echo "Pipe output of even numbers to calculate sum"
seq 1 10 | awk '$1 % 2 == 0' | paste -sd+ - | bc

echo ""
# Filter out odd numbers from 1 to 10
echo "Filter out odd numbers from 1 to 10"
seq 1 10 | awk '$1 % 2 != 0'

echo ""
# Pipe output of odd numbers to calculate sum
echo "Pipe output of odd numbers to calculate sum"
seq 1 10 | awk '$1 % 2 != 0' | paste -sd+ - | bc


echo "###--DIRECTORY MANAGEMENT--###"
# This script is a directory manager that allows you to create, navigate, and delete directories easily.
# It provides a user-friendly menu where you can select the action you want to perform.
# The script assumes that you have basic knowledge of shell commands and paths.

while true; do
  # Display the menu options with numbered choices
  echo "Directory Manager Menu:"
  echo "1. Create a new directory"
  echo "2. Navigate to an existing directory"
  echo "3. Delete a directory"
  echo "4. Quit"

  # Get the user's choice
  read -p "Enter your choice [1-4]: " choice

  case $choice in
    1)
      # Creating a new directory
      read -p "Enter the path and name of the directory: " path
      mkdir -p $path
      echo "Directory created successfully!"
      echo # Add a blank line for readability
      ;;
    2)
      # Navigating to an existing directory
      read -p "Enter the path of the directory: " path
      if [ -d $path ]; then # Check if the directory exists
        cd $path
        echo "Navigated to $path"
        echo # Add a blank line for readability
      else
        echo "Directory not found."
        echo # Add a blank line for readability
      fi
      ;;
    3)
      # Deleting a directory
      read -p "Enter the path and name of the directory: " path
      if [ -d $path ]; then # Check if the directory exists
        rm -r $path
        echo "Directory deleted successfully!"
        echo # Add a blank line for readability
      else
        echo "Directory not found."
        echo # Add a blank line for readability
      fi
      ;;
    4)
      # Quitting the script
      echo "Goodbye!"
      exit 0
      ;;
    *)
      # Invalid choice
      echo "Invalid choice. Please enter a number from 1 to 4."
      echo # Add a blank line for readability
      ;;
  esac
done

# Exit the script
exit 0



