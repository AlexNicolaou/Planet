- name: Install Redis on localhost
  hosts: all
  become: yes

vars:

    redis_port: 6379
    redis_bind_interface: 127.0.0.1
    redis_unixsocket: ''
    redis_timeout: 300
    redis_loglevel: "notice"
    redis_logfile: /var/log/redis/redis-server.log
    redis_databases: 16
    redis_rdbcompression: "yes"
    redis_dbfilename: dump.rdb
    redis_dbdir: /var/lib/redis
    
  tasks:
    - name: Installing Redis
      apt: name=redis-server state=latest    
      notify:
        - restart redis.service 
    
    - name: Restart Redis Server
      service: name=redis state=restarted enabled=yes
