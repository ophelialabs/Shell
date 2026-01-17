#!/bin/bash

# echo "[*] Setting up Terminal Login System..."

# Make scripts executable
# chmod +x /shell/lynx/login.sh

# echo "[+] Setup complete!"
# echo "[*] To run the system, execute:"
# echo "    /shell/lynx/login.sh"


# Terminal Login & Deployment Script
# Color codes for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Credentials
ADMIN_USER="admin"
ADMIN_PASS="admin1234"

# Function to display banner
display_banner() {
	clear
	echo -e "${BLUE}"
	echo "╔════════════════════════════════════════╗"
	echo "║   TERMINAL LOGIN & DEPLOYMENT SYSTEM   ║"
	echo "║              Version 1.0                ║"
	echo "╚════════════════════════════════════════╝"
	echo -e "${NC}"
	echo ""
}

# Function for login
login() {
	display_banner
	echo -e "${YELLOW}[*] Authenticating user...${NC}"
	echo ""
	
	read -p "Username: " username
	read -sp "Password: " password
	echo ""
	
	if [[ "$username" == "$ADMIN_USER" && "$password" == "$ADMIN_PASS" ]]; then
		echo -e "${GREEN}[+] Authentication successful!${NC}"
		sleep 1
		show_dashboard "$username"
	else
		echo -e "${RED}[!] Invalid credentials. Access denied.${NC}"
		sleep 2
		exit 1
	fi
}

# Function to display dashboard and objectives
show_dashboard() {
	local user=$1
	clear
	echo -e "${GREEN}"
	echo "╔════════════════════════════════════════╗"
	echo "║        DEPLOYMENT COMMAND CENTER       ║"
	echo "╚════════════════════════════════════════╝"
	echo -e "${NC}"
	echo ""
	echo -e "${BLUE}User: ${GREEN}$user${NC}"
	echo -e "${BLUE}Login Time: ${GREEN}$(date)${NC}"
	echo ""
	echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo -e "${YELLOW}CURRENT OBJECTIVE:${NC}"
	echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo ""
	echo -e "${BLUE}[DEPLOYMENT ZONE ALPHA]${NC}"
	echo "Status: ACTIVE"
	echo "Priority: HIGH"
	echo ""
	echo "Objective Details:"
	echo "  - Deploy security monitoring system"
	echo "  - Configure firewall rules (UFW)"
	echo "  - Establish SSH key authentication"
	echo "  - Initialize logging infrastructure"
	echo "  - Validate network connectivity"
	echo ""
	echo -e "${YELLOW}Target: Production Server (192.168.1.100)${NC}"
	echo -e "${YELLOW}Estimated Duration: 2-3 hours${NC}"
	echo -e "${YELLOW}Assigned Tech: $user${NC}"
	echo ""
	echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo ""
	
	# Prompt to view documentation
	read -p "View related documentation? (y/n): " view_docs
	
	if [[ "$view_docs" =~ ^[Yy]$ ]]; then
		show_documentation
	else
		countdown_exit
	fi
}

# Function to display documentation
show_documentation() {
	clear
	echo -e "${BLUE}"
	echo "╔════════════════════════════════════════╗"
	echo "║      DEPLOYMENT DOCUMENTATION         ║"
	echo "╚════════════════════════════════════════╝"
	echo -e "${NC}"
	echo ""
	echo -e "${GREEN}[SECURITY DEPLOYMENT GUIDELINES]${NC}"
	echo ""
	echo "1. FIREWALL CONFIGURATION"
	echo "   - Enable UFW: ufw enable"
	echo "   - Allow SSH: ufw allow 22/tcp"
	echo "   - Allow HTTP: ufw allow 80/tcp"
	echo "   - Allow HTTPS: ufw allow 443/tcp"
	echo ""
	echo "2. SSH KEY AUTHENTICATION"
	echo "   - Generate key: ssh-keygen -t rsa -b 4096"
	echo "   - Copy to server: ssh-copy-id -i ~/.ssh/id_rsa.pub user@host"
	echo "   - Disable password auth: PasswordAuthentication no"
	echo ""
	echo "3. SYSTEM MONITORING"
	echo "   - Install monitoring: apt-get install htop"
	echo "   - Check logs: journalctl -xe"
	echo "   - Monitor processes: ps aux"
	echo ""
	echo "4. NETWORK VALIDATION"
	echo "   - Test connectivity: ping 8.8.8.8"
	echo "   - Check routes: ip route show"
	echo "   - Verify DNS: nslookup example.com"
	echo ""
	echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo ""
	echo -e "${GREEN}[DEPLOYMENT CHECKLIST]${NC}"
	echo "  [ ] Backup existing configuration"
	echo "  [ ] Apply firewall rules"
	echo "  [ ] Configure SSH authentication"
	echo "  [ ] Test remote access"
	echo "  [ ] Enable system logging"
	echo "  [ ] Validate network connectivity"
	echo "  [ ] Document changes"
	echo ""
	echo -e "${YELLOW}For more information, contact the DevOps team.${NC}"
	echo ""
	
	countdown_exit
}

# Function to countdown and exit
countdown_exit() {
	echo -e "${YELLOW}"
	echo "Session will close in 10 seconds..."
	echo -e "${NC}"
	
	for i in {10..1}; do
		echo -ne "\rClosing in: $i seconds... "
		sleep 1
	done
	
	clear
	echo -e "${GREEN}[+] Session terminated. Goodbye!${NC}"
	exit 0
}

# Main execution
login
