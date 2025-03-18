#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Step 1: Download and install Solana CLI
echo "Downloading and installing Solana CLI..."
sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"

# Step 2: Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update && sudo apt upgrade -y

# Step 3: Install solv
echo "Installing solv..."
bash -c "$(curl -sSfL 'https://solv-storage.validators.solutions/install')"

# Step 4: Set terminal profile
echo "Setting terminal profile..."
cd ~ && source ~/.profile

# Step 5: Reset packages - Uninstall old solv package and install new one
echo "Resetting solv package..."
pnpm uninstall -g @epics-dao/solv
pnpm install -g @gabrielhicks/solv

# Step 6: Create and populate solv4.config.json
echo "Creating solv4.config.json..."
cat <<EOF > solv4.config.json
{
  "NETWORK": "mainnet-beta",
  "NODE_TYPE": "validator",
  "VALIDATOR_TYPE": "jito",
  "RPC_TYPE": "none",
  "MNT_DISK_TYPE": "triple",
  "TESTNET_SOLANA_VERSION": "2.1.11",
  "MAINNET_SOLANA_VERSION": "2.0.24",
  "NODE_VERSION": "20.17.0",
  "TESTNET_DELINQUENT_STAKE": 5,
  "MAINNET_DELINQUENT_STAKE": 5,
  "COMMISSION": 0,
  "DEFAULT_VALIDATOR_VOTE_ACCOUNT_PUBKEY": "ELLB9W7ZCwRCV3FzWcCWoyKP6NjZJKArLyGtkqefnHcG",
  "STAKE_ACCOUNTS": [],
  "HARVEST_ACCOUNT": "",
  "IS_MEV_MODE": false,
  "RPC_URL": "https://api.mainnet-beta.solana.com",
  "KEYPAIR_PATH": "",
  "DISCORD_WEBHOOK_URL": "",
  "AUTO_UPDATE": false,
  "AUTO_RESTART": false,
  "IS_DUMMY": false,
  "API_KEY": "",
  "LEDGER_PATH": "/mnt/ledger",
  "ACCOUNTS_PATH": "/mnt/accounts",
  "SNAPSHOTS_PATH": "/mnt/snapshots"
}
EOF

# Step 7: Disable and remove swap
echo "Disabling and removing swap..."
sudo swapoff --all
sudo rm -rf /swap.img

# Step 8: Setup solv and stop it
echo "Setting up solv..."
solv setup && solv stop

# Step 9: Setup mods and ports
echo "Setting up mods and ports..."
touch mostly_confirmed_threshold
echo "0.45 4 0 24" > mostly_confirmed_threshold

echo "Setup complete!"