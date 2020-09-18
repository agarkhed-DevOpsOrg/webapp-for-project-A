# Pull base image 
FROM tomcat:latest 

COPY *.war /usr/local/tomcat/webapps

