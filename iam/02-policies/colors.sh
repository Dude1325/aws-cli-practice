# colors.sh
GREEN='\e[32m'
RED='\e[31m'
YELLOW='\e[33m'
ENDCOLOR='\e[0m'

# Функция для печати сообщений
log_info() { echo -e "\e[33mINFO:\e[0m $1"; }
log_ok()   { echo -e "\e[32mSUCCESS:\e[0m $1"; }
log_err()  { echo -e "\e[31mERROR:\e[0m $1"; }
