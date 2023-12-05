# HOSTING MY FIRST IMAGE OF A APP USING DOCKER AND PUSHING TO DOCKER REGISTRY THATS DOCKER HUB
FROM ubuntu:latest
LABEL "Author"="Fred"
LABEL "Project"="tween"
# ENV makes non-interactive
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt update && apt install git -y
RUN apt install apache2 -y
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
WORKDIR /var/www/html
VOLUME /var/log/apache2
ADD tween.tar.gz /var/www/html
#COPY tween.tar.gz /var/www/html

# BUILD cmd bcos we were in the same directory 
# </> docker build -t tweenimg .
# RUN the image tweenimg is the image name 
# </> docker run -d --name tweenwebsite -p 9080:80 tweenimg

# In order to be able to push images to hub ff this format 
#  </> docker build -t userName/containerName . Example just below 
# </> docker build -t degreatasaa/tweenimg .