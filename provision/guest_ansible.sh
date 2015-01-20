sudo apt-get update

sudo apt-get -y install software-properties-common
sudo add-apt-repository ppa:rquillo/ansible

sudo apt-get update

sudo apt-get -y install ansible

sudo PYTHONUNBUFFERED=1 ansible-playbook /vagrant/provision/ansible/site.yml --connection=local -i "[vagrant]127.0.0.1,"
