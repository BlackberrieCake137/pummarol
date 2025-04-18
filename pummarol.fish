function pummarol
    set -l min $argv[1]
    set -e argv[1]
    set -l msg (string join ' ' $argv)
    if test -z "$min" -o -z "$msg"
        echo "Usare: pummarol <minuti> <messaggino>"
        return 1
    end
:
    set -l sec (math "$min * 60")
    set -l rest (math round "$min / 5")
    set -l restsec (math "$rest * 60")
    set -l now (date "+%H:%M")
    set -l future (date -d "+$min minutes" "+%H:%M")
    set -l breakend (date -d "+$rest minutes" "+%H:%M")


    echo -e "prendi ctrl+c per uscì..."
    
    echo -e "\033[31ml'ora mo' è $now 🫒 ⏲️ 🫓\033[0m"
    echo -e "\033[37m'a pizza tujo sboccia a $future ☕ 🍅 🌿\033[0m"
    while true
        
	echo -e "\033[32m✭ e pure, 'e altre pummarol' sta cucend'... 👩‍🍳 💸\033[0m"
	notify-send -u critical -t 0 -a "$now pummarol 🥧 " "$msg" "e pure, 'e altre pummarole stanno cucend'... 👩‍🍳 💸"
        sleep $sec

	paplay ~/.config/fish/functions/pummarol/oven_bell.mp3

	notify-send -u critical -t 0 -a "$now pummarol 🥧 " "$msg" "piglia nu caffè p''o tujo lavoro! 'A pausa toja di caffè finirò a $breakend ☕"
	echo -e "\033[31mgrazzi tant'! piglia nu caffè p''o tujo lavoro! ☕ $now\033[0m"
	echo -e "\033[37m'a pausa toja di caffè finirò a $breakend...🍕\033[0m"
	sleep $restsec

	paplay ~/.config/fish/functions/pummarol/oven_bell.mp3
    end
end

