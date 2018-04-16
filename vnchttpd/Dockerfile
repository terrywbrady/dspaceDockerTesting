FROM eclipse/x11_vnc

RUN sudo apt-get update && sudo apt-get install apache2 -y

EXPOSE 80

RUN sudo mkdir -p /usr/local/apache2/htdocs
RUN sudo chmod 777 /usr/local/apache2/htdocs

RUN sudo echo "hello" > /usr/local/apache2/htdocs/out.txt

#CMD sudo /etc/init.d/apache2 start
CMD sudo systemctl start apache2.service