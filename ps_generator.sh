echo "\033[1;32mRandom numerical sequence generator v 1.0.1 by jjerde & shcool-42\033[0m"
echo "\033[1;33mPlease enter minimum int[0 by default]\033[0m:"
read min
if [[ -z "$min" ]];
	then min=0
fi
echo "\033[1;33mPlease enter maximum int[50 by default]\033[0m:"
read max
if [[ -z "$max" ]];
	then max=50
fi
echo "\033[1;33mPlease enter a separator[space by default]\033[0m:"
read del
if [[ -z "$del" ]];
	then del=' '
fi
echo "\033[1;32mYour random numerical sequence\033[0m:"
ARG=`ruby -e "puts ("$min" .. "$max").to_a.shuffle.join('$del')"`
echo $ARG
