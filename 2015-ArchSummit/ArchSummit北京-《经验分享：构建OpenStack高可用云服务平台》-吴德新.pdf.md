
OpenStack


·  ·  · OpenStack · 


· AWcloudOpenStack 
· AWcloud20102012OpenStack · IBM/Red Hat/// ·  · 201310A1500 · 201506INTELB


· Private Cloud Solution)OpenStack KVMHyper-VVMware
·  Private Cloud Hosting)  
· AWcloudIT 
· IDCIDCIDC OpenStackIDCVDC 
· OpenStackOpenStack OpenStack 



· Availablity = Fn(MTBF, MTTR)
· 
·  ­ Active-Active ·  ·  ­ Active-Passive · 

 99% 99.5% 99.9% 99.95% 99.99% 99.999%

 87.6 43.8 8.8 4.4 53 5.3

Haproxy + Keepalived
· Haproxy 
· Keepalived IP · VRRP · 
· Keepalived"" · ping · failover 
· IP
· Fence 

Pacemaker
· Corosync · Quorum · STONITHFence ·  ·  · 

OpenStack
http://docs.openstack.org/openstack-ps/content/figures/2/figures/osog_0001.png


· MySQL · Galera     ·  + MHA
· RabbitMQ · RabbitMQ · Haproxy oslo.messaging




· 
· RabbitMQ
· RabbitMQconsumer 
· memcachedKeystonetokenfence/unfence token MySQLtokenRedis
· 
· 5

  (Ceph)
·  · CRUSH
 · CRUSH
 · Ceph Monitor
Paxos
http://pinrojas.com/2014/05/20/ceph-you-will-love-the-way-it-flies/


· DHCP Agent Neutron
· Keepalived 
· LL2pop 
· failover
·  
· DVR
·  


·  · SDN ·  · Neutronallowedaddress-pairs · IPL2pop · 
·  ·  ­  ·  · IP ·  IP 
· 

  v1
·  ·  ·  · 
· v1 ·  ·  · IPMI Fence, Evacuate
· Nova evacuate · force-down · Liberty API Microversion 2.11 
· v1 ·  · IPMI · 

  Consul
· Hashicorp
·  ·  · DNS · 
·  K/V 
· 
·  · Gossip · 
·  · Leader
· REST API

  Consul
·  · Consul  · Consul 
·  · Leader · Consul
· Fence · IPMI · Consul
· Fenced · Fence · Unfence
·  · fence · 

  Pacemaker-remote
·  · bonding?
·  Fence

  

  

  
·  Haproxy + Keepalived
· ZeroMQ RabbitMQ
· MySQL
· RedisKeystone Token

Ceph OSD Map
· 3 ·  3 * 0.5rack * 10host * 4osd = 60 osd · OSD

 Midonet
·  · ZooKeeper · Cassandra
·  · BGP
http://image.slidesharecdn.com/midonet101-150221232947-conversiongate01/95/midonet-101-face-to-face-with-the-distributed-sdn-12638.jpg?cb=1424561601


· Pacemaker  Keepalived  · Haproxy · MySQLRabbitMQ ·  · 

