# You may add here your
# server {
#	...
# }
# statements for each of your virtual hosts

#upstream plone {
#	server 127.0.0.1:9081;
#}

# atm we use ha-proxy for loadbalancing 


server {
	listen 80;
	server_name example.com;
	rewrite ^/(.*) http://www.example.com/$1 permanent;
}

server {

	listen		80;
	server_name  	www.example.com;
	access_log  /var/log/nginx/example.com-access.log;
	
	include /etc/nginx/global.conf;
	

	# all the rewrites

	location /multimedia {
                rewrite ^/multimedia/(.*)$ http://multimedia.example.com/$1 permanent;
        }



	#####################################################
	# if we need rewites they have to go above this entry

	
	location / { 
                 proxy_pass http://127.0.0.1:8902/VirtualHostBase/http/www.example.com:80/plone/VirtualHostRoot/;
        }


}

