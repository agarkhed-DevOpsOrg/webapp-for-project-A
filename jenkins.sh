# this is the script which I will run as pos deplyment actions for jenkins

#
cd /opt/docker
ansible-playbook -i hosts image-playbook.yml
ansible-playbook -i /etc/docker/hosts ansible-playbook.yml