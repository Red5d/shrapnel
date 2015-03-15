#! /bin/bash

#Shrapnel 1.0
#SHell wRAPper for Noob-Easy Linux

#Aliases

alias show='show "$@"'
alias what='what "$@"'
alias copy='copy "$@"'
alias delete='delete "$@"'
alias move='move "$@"'


#Functions

function show()
{
	#check for system info request
	if [[ $(echo $@ | grep -e system | grep -e info -e stats) ]];then
		echo "This system has a total of "$(free -m | grep Mem | awk '{ print $2 }')" Megabytes of RAM.";
	else
		$@;
	fi
}

function what()
{
	if [[ $(echo $@ | grep -e time) ]];then
		echo "The time is "$(date +%r);
	fi
	
	if [[ $(echo $@ | grep -e kind -e type | grep -e file) ]];then
		end=$(echo $@ | wc -w);
		file $(awk '{ print $end }');
	fi  	

	if [[ $(echo $@ | grep -e today -e date) ]];then
		echo "Today is "$(date +%A", "%B" "%d", "%Y);
	else
		$@;	
	fi
}

function copy()
{
	cp -i $1 $3;
}

function delete()
{
	rm -i $1;
}

function move()
{
	mv -i $1 $3;
}

