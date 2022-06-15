CDN DDOS
·  #hzlug@googlegroups.com ·  
· #gdg-hangzhou@googlegroups.com


DDoS · CC · 
@zooboa

CDN

CDN 

·  ·  ·  ·  · 

@zooboa


  
@zooboa

Options
option forwardfor
option httplog option dontlognull option accept-invalid-http-request
option nolinger # reduce FIN_WAIT1
timeout client 15s timeout connect 15s timeout server 15s timeout http-keep-alive 15s timeout http-request 15s
@zooboa

-ACL
acl bad_referer hdr_sub(referer) -i -f /etc/bad_ref acl bad_url url_reg -i -f /etc/bad_url acl bad_methods method -i -f /etc/bad_method block if invalid_referer || invalid_url || invalid_meth acl dyn_host hdr(host) -i -f /etc/notcache_host acl static_req path_end -i -f /etc/cache_file use_backend img_srv if static_req !dyn_host
@zooboa


PROXY_HOST=" 53kf.com@ 127.0.0.1:81:3&127.0.0.1:82:1@ w_53kf_com@ www|chat|kf
"
@zooboa





· DNS ·  · 

@zooboa

OpenCDN ·  CDN
·
@zooboa


 

 CDN

@zooboa

OpenCDN 
@zooboa


· Linux+nginx 
· Ngx_proxy_cache 
· / 
· DNSPod · D · VPS

OpenCDN 
   5CDN  
   OpenCDN
@zooboa

CDN - Ping



OCDN

@zooboa


@zooboa

Thank You !
http://ocdn.me
·  #hzlug@googlegroups.com ·  
· #gdg-hangzhou@googlegroups.com

