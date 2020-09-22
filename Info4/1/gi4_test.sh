#!/bin/bash

PATH=$PATH:.
RESULT=0

TEXT0="text from stdin should not be echoed. Echo arguments instead"
TEXT1="This text is passed via arguments to the command line"
TEXT2="Have you heard the tragedy of Darth Plagueis the wise?"

echo -n "First myecho test: "
VAL=$(echo \"$TEXT0\" | myecho)

if [ "$VAL" == "" ]; then
   echo -e "\e[32mOK\e[0m"
else
   echo -e "\e[31mFAILED\e[0m"
   RESULT=1
fi

echo -n "Second myecho test: "
VAL=$(myecho $TEXT1)
if [[ "$VAL" = "$TEXT1"* ]]; then
   echo -e "\e[32mOK\e[0m"
else
   echo -e "\e[31mFAILED\e[0m"
   RESULT=1
fi

echo -n "Third myecho test: "
VAL=$(myecho $TEXT2)
if [[ "$VAL" == "$TEXT2"* ]]; then
   echo -e "\e[32mOK\e[0m"
else
   echo -e "\e[31mFAILED\e[0m"
   RESULT=1
fi

echo -n "myenv test: "
export DUMMY="Hello GI4"
VAL=$(myenv)
if [[ "$VAL" == *"DUMMY=Hello GI4"* ]]; then
   echo -e "\e[32mOK\e[0m"
else
   echo -e "\e[31mFAILED\e[0m"
   RESULT=1
fi

echo -n "exec test: "
VAL=$(./exec /usr/bin/uname -r)
if [[ "$VAL" == *$(uname -r)* ]]; then
   echo -e "\e[32mOK\e[0m"
else
   echo -e "\e[31mFAILED\e[0m"
   RESULT=1
fi

echo -n "fork test: "
./exec /bin/sh -c 'echo $$ > child.pid; sleep 1' > /dev/null &
echo $! > parent.pid
wait $!

if ! cmp -s child.pid parent.pid; then
   echo -e "\e[32mOK\e[0m"
else
   echo -e "\e[31mFAILED\e[0m"
   RESULT=1
fi
rm *.pid

exit $RESULT
