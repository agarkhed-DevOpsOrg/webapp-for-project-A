# Deploying a Java-Spring Boot webapp on Kubernetes by using ansible playbooks and Architecting CI/CD Pipeline using Jenkins

![Jenkins Builds](https://github.com/agarkhed-DevOpsOrg/webapp-for-project-A/blob/master/images/ArchitectureDiagram.jpeg?raw=true)

## Technology stack used:

| Name | Usage | Description |
| --- | --- | --- |
|Jenkins | Integration|to poll code from github,setup CI and execute ansible playbooks and scripts |  | | |
|Docker| Containerization| to containerize Java-app|
|Ansible| Deployment|runs ansible playbooks to deploy on multiple nodes |
|AWS EC2| Linux 2| for Ansible Master, Slave nodes and Jenkins server|

## Jenkins: Post-build Actions>Send build artifacts over ssh>Exec command
```
sudo chmod +x jenkins.sh
$DOCKERPWD | docker login --username ashwinpagarkhed --password-stdin
./jenkins.sh sh
``` 
![Jenkins Builds](https://github.com/agarkhed-DevOpsOrg/webapp-for-project-A/blob/master/images/JenkinsBuilds.png?raw=true)

## To run playbooks I use jenkins.sh which runs 2 playbooks:
```
ansible-playbook -i hosts image-playbook.yml
ansible-playbook -i /etc/ansible/hosts ansible-playbook.yml
```

## To Build and push Image to Dockerhub, image-playbook.yml used:
```
docker build -t ashwinpagarkhed/deployjava .
```

## To pull Image and Run containers on nodes, ansible-playbook.yml used:
```
docker run -d --name ashwins-container -p 8080:8080 ashwinpagarkhed/deployjava:latest
```
![Dockerhub](https://github.com/agarkhed-DevOpsOrg/webapp-for-project-A/blob/master/images/dockerhub.png?raw=true)

## Do Ansible ping test after setting up of ansible Master Slave Configuration
```
ansible all -m ping
``` 
###### You should be seeing something like this:
![Ping Test](https://github.com/agarkhed-DevOpsOrg/webapp-for-project-A/blob/master/images/pingTest.png?raw=true)
[Ansible Master Slave Configuration](https://github.com/agarkhed-DevOpsOrg/webapp-for-project-A/blob/master/Ansible.md)

[Kubernetes Setup Configuration](https://github.com/agarkhed-DevOpsOrg/webapp-for-project-A/blob/master/K8s.md)