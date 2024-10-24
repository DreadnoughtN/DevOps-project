#!/bin/bash

sudo apt-get update
sudo apt-get install nodejs unzip -y

wget https://hashicorp-releases.mcs.mail.ru/terraform/1.9.8/terraform_1.9.8_linux_amd64.zip 
unzip terraform_1.9.8_linux_amd64.zip
sudo mv terraform /usr/bin/

cat << EOF > .terraformrc
provider_installation {
    network_mirror {
        url = "https://terraform-mirror.mcs.mail.ru"
        include = ["registry.terraform.io/*/*"]
    }
    direct {
        exclude = ["registry.terraform.io/*/*"]
    }
}
EOF

unzip project-root.zip
cd project-root

npm install
cd terraform
terraform init
cd ..
sudo npm start
