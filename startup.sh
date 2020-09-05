# memory-monitoring by jjerde. v 3.2.0 | Sep 05 2020 | School 21 Moscow, Russia
memorylimit=4
memoryalert=3
username=`whoami`
echo "\033[1;33mNow running new copy of shell. Login in..."
mem=`du -sh ~/ grep G 2>/dev/null | cut -c -4`
echo "\033[1;31mWelcome back commander "$username"! \033[5m❤ \033[0m"
echo "\033[1;37mUsed memory: \033[1;33m"$mem"b\033[1;37m of \033[1;33m$memorylimit.0Gb\033[0m"
memunit=`echo $mem | cut -c ${#mem}`
mem=`echo $mem | cut -c 1`
if [ "$mem" -ge "$memoryalert" ] && [ $memunit = "G" ]
then echo "\033[1;33m[ \033[5m⚠️\033[0m  \033[1;31mWarning!\033[1;33m] \033[1;37mYou can run out of memory soon. Please check your largest folders:\033[0m"
	du -sh ~/* | grep "G\t" | sort -r; du -sh ~/* | grep "M\t" | sort -r
	echo "\033[1;37mI can also delete some 42-cache files. Shall I? [y/n]\033[0m"
	read -s -n 1 answer
	if [ $answer = "Y" ] || [ $answer = "y" ]
	then echo "\033[1;37mRunning...\033[0m"
		rm -rf ~/Library/Caches
		mem=`du -sh ~/ grep G 2>/dev/null | cut -c -4`
		memonly=`echo $mem | cut -c 1`
		if [ "$memonly" -lt "$memoryalert" ]
			then echo "\033[1;32mSuccess! \033[1;37mUsed memory: \033[1;33m"$mem"b\033[1;37m of \033[1;33m$memorylimit.0Gb\033[0m"
		else
			echo "\033[1;31mFailure! \033[0mI cleared the cache, but that didn't help. :(\n\033[1;37mUsed memory: \033[1;33m"$mem"b\033[1;37m of \033[1;33m$memorylimit.0Gb\033[0m"
		fi
	else
		echo "\033[1;36mHave a nice day!\033[0m"
	fi
fi
