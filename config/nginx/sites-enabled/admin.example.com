# You may add here your
# server {
#	...
# }
# statements for each of your virtual hosts

#upstream plone {
#	server 127.0.0.1:9081;
#}

server {

	listen		80;
	server_name  	admin.example.com www.admin.example.com;
	rewrite ^(.*) 	https://$host$1 permanent;

	access_log  /var/log/nginx/admin.example.com.access.log;
	
	include /etc/nginx/global.conf;
	
	}


server {
	listen 443;
	ssl on;
	ssl_certificate /etc/ssl/certs/admin_example_com.crt;
	ssl_certificate_key /etc/ssl/private/admin_example_com.key;
	ssl_session_timeout 5m;
	ssl_protocols SSLv2 SSLv3 TLSv1;
	ssl_ciphers ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv2:+EXP;
	ssl_prefer_server_ciphers   on;

	server_name admin.example.com www.admin.example.com;
   
	access_log  /var/log/nginx/example.com.access.log;

	include /etc/nginx/global.conf;
	client_max_body_size 32M;

	location = /robots.txt {
	alias /etc/nginx/robots.txt;
	}

	location / {
                auth_basic            "Restricted";
                auth_basic_user_file  /etc/nginx/htpasswd;
                proxy_pass http://127.0.0.1:8904/VirtualHostBase/https/admin.example.com.nl:443/plone/VirtualHostRoot/;
                #proxy_set_header Cookie null;
                #proxy_set_header Authorization null;
                #proxy_cache off;
                }
# close config
}

