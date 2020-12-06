
sudo wget -O "/opt/terraform-ls_amd64.zip" https://releases.hashicorp.com/terraform-ls/0.10.0/terraform-ls_0.10.0_linux_amd64.zip 
sudo unzip -o /opt/terraform-ls_amd64.zip -d /opt/
sudo ln -fs /opt/terraform-ls /usr/bin/terraform-ls

