#!/usr/bin/env bash

set -euo pipefail

TLD_URL="https://raw.githubusercontent.com/stukryptx/tld-tracker/refs/heads/main/tlds.md"
PARALLEL=50

GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
WHITE="\033[1;37m"
RESET="\033[0m"

clear

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                  TLD Domain Discovery Tool                 ║"
echo "║                  Live Domain Enumeration                   ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${RESET}"

read -rp "Keyword: " KEYWORD

echo
echo -e "${CYAN}[+] Downloading TLD list...${RESET}"

TLDS=$(curl -fsSL "$TLD_URL")

TOTAL=$(echo "$TLDS" | wc -l)

echo -e "${CYAN}[+] Loaded ${TOTAL} TLDs${RESET}"
echo -e "${CYAN}[+] Starting scan with ${PARALLEL} parallel workers${RESET}"
echo

printf "%-40s %-8s %s\n" "DOMAIN" "CODE" "TITLE"
printf '%*s\n' 120 '' | tr ' ' '-'

check_domain() {
    local tld="$1"
    local domain="${KEYWORD}.${tld}"

    response=$(curl \
        -L \
        --connect-timeout 5 \
        --max-time 10 \
        -s \
        -w "HTTPSTATUS:%{http_code}" \
        "https://${domain}" 2>/dev/null || true)

    body=$(echo "$response" | sed 's/HTTPSTATUS\:.*//')
    code=$(echo "$response" | tr -d '\n' | sed 's/.*HTTPSTATUS://')

    if [[ "$code" =~ ^(200|301|302|403)$ ]]; then

        title=$(echo "$body" | grep -iPo '(?<=<title>)(.*?)(?=</title>)' | head -1)

        [[ -z "$title" ]] && title="No Title"

        printf "${GREEN}[+]${RESET} %-36s ${YELLOW}%-6s${RESET} %s\n" \
            "$domain" \
            "$code" \
            "$title"
    fi
}

export KEYWORD
export -f check_domain

echo "$TLDS" \
| grep -v '^#' \
| sed '/^[[:space:]]*$/d' \
| xargs -P "$PARALLEL" -I{} bash -c 'check_domain "$1"' _ {}

echo
echo -e "${GREEN}[+] Scan Completed${RESET}"
