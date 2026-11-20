#!/bin/bash

user_env=$USER
echo $user_env

read -p "Enter if you want to sort the process list by memory or CPU, and how many lines to print " sort_filter num_lines

if [[ $sort_filter ==  "memory" ]]; then
	ps u -u $user_env --sort=-%mem | head -n $num_lines
fi

if [[ $sort_filter == "cpu" ]]; then
	ps u -u $user_env --sort=-%cpu | head -n $num_lines
fi

