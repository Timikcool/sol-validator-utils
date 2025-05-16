Step 0: Setting up SSH access between Main and Spare nodes
Main Validator Node
Set up SSH to Spare Node
Run the following solv command from the Spare Node:
solv scp init
solv scp cat
# Copy the SSH Public Key output for the SPARE NODE

Run the following solv command from the Main Node:
solv scp create
# Paste the SSH Public Key output from the SPARE NODE

Spare Validator Node
Set up SSH to Main Node
Run the following solv command from the Main Node:
solv scp init
solv scp cat
# Copy the SSH Public Key output for the MAIN NODE

Run the following solv command from the Spare Node:
solv scp create
# Paste the SSH Public Key output from the MAIN NODE

Step 1: Downloading files from Main node to Spare node
Spare Validator Node
Download required files from Main node to Spare node
Run the following solv command from the Spare Node:
solv scp download

Step 2: Upgrade Solana versions
Spare Validator Node
Upgrade to latest Solana version
Run the following command from the Spare Node to upgrade Solana versions:
solv update && solv update --config && solv install

Test by running:
solana --version

Download snapshot and restart Spare Node:
solv get snapshot && solv restart

Watch logs until the Spare Node has caught up:
solv log
# Once snapshot is verified and logs are churning check catchup
solv catchup

Step 3: Activate Spare node before upgrading Main node
Spare Validator Node
Switch Spare Node to become active
Run the following command on the Spare Node:
solv switch

Answer as follows from the Spare Node:
Which switch type do you want to perform?
Incoming
What is the IP address of the new validator?
Enter the Main Node IP Address
Step 4: Upgrade Solana versions
Main Validator Node
Upgrade to latest Solana version
Run the following command from the Main Node to upgrade Solana versions:
solv update && solv update --config && solv install

Test by running:
solana --version

Download snapshot and restart Main Node:
solv get snapshot && solv restart

Watch logs until the Main Node has caught up:
solv log
# Once snapshot is verified and logs are churning check catchup
solv catchup

Step 5: Reactivate Main node
Spare Validator Node
Switch Main Node to become active
Run the following command on the Spare Node:
solv switch

Answer as follows from the Spare Node:
Which switch type do you want to perform?
Outgoing
What is the IP address of the new validator?
Enter the Main Node IP Address
