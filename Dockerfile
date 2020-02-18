FROM tomcat:8.0

ADD ./target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]

#Just a comment for webhook class
#2nd comment for webhook
