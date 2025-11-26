Creating an instance same as in Excercise2 but using amiID from variables instead of from datasource.
To understand provisioners concept, created web.sh script and used provisioners file and remote-exec with ssh connection, means executing the commands in web.sh on the created instance (copy the Public IP of the instance and paste on browser to see the hosted website)
Included code for local-exec to execute a simple command (to store some value in a file in local) in local
Backed s3 is used to store the state remotely
