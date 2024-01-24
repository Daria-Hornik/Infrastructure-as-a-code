#!/bin/bash

# Prepare basic tools
apt update -y && apt install -y git curl vim tmux
mkdir -p /opt/app
cd /opt/app

# Clone app
git clone https://github.com/Elentija/plan_generator.git

# Install dotnet
wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
apt-get update && apt-get install -y dotnet-sdk-5.0

# Prepare app binary
cd /opt/app/plan_generator/PlanGeneratorBackend/PlanGenerator
rm -rf obj/ bin/
dotnet tool install --global dotnet-ef --version=5.0.6
dotnet build

# Prepare files
cp /mnt/app.service /etc/systemd/system/ # Create a new systemd unit (like windows service)
cp /mnt/config.yaml /etc/

# Make run_app executable
cp /mnt/run_app.sh /usr/bin/
chmod +x /usr/bin/run_app.sh

# Start that ***** running
systemctl daemon-reload # Now load the systemd unit. It loads our new file

# Migrate db
/root/.dotnet/tools/dotnet-ef database update -- "/MySetting:file=/etc/config.yaml"


systemctl enable --now app # Start and run on every system boot