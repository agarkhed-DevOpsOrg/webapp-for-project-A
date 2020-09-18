# this is the script which I will run as pos deplyment actions for jenkins
ansible-playbook -i /etc/docker/hosts image-playbook.yml --limit localhost
ansible-playbook -i /etc/docker/hosts ansible-playbook.yml --limit target


#$ cat hosts
#localhost
#
#[target]
#3.83.253.142
#3.88.50.68
