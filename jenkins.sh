# this is the script which I will run as pos deplyment actions for jenkins

#

ansible-playbook -i hosts image-playbook.yml
ansible-playbook -i /etc/ansible/hosts ansible-playbook.yml