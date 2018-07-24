cp01:
  nginx01:
    name: nginx01
    vcpu: 8
    memory: 16
    disk: 200
    ipaddress: 10.2.16.21
    netmask: 255.255.240.0
    gateway: 10.2.31.254

  console01:
    name: console01
    vcpu: 4
    memory: 8
    disk: 200
    ipaddress: 10.2.16.23
    netmask: 255.255.240.0
    gateway: 10.2.31.254

  frontend01:
    name: frontend01
    vcpu: 4
    memory: 8
    disk: 200
    ipaddress: 10.2.16.35
    netmask: 255.255.240.0
    gateway: 10.2.31.254

  redis01:
    name: redis01
    vcpu: 2
    memory: 8
    disk: 200
    ipaddress: 10.2.16.38
    netmask: 255.255.240.0
    gateway: 10.2.31.254

cp02:
  nginx02:
    name: nginx02
    vcpu: 8
    memory: 16
    disk: 200
    ipaddress: 10.2.16.22
    netmask: 255.255.240.0
    gateway: 10.2.31.254        
  console02:
    name: console02
    vcpu: 4
    memory: 8
    disk: 200
    ipaddress: 10.2.16.24
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  logaudit01:
    name: logaudit01
    vcpu: 16
    memory: 32
    disk: 1000
    ipaddress: 10.2.16.47
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  inhostmg01:
    name: inhostmg01
    vcpu: 8
    memory: 16
    disk: 1000
    ipaddress: 10.2.16.48
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  netauto01:
    name: netauto01
    vcpu: 4
    memory: 16
    disk: 100
    ipaddress: 10.2.16.49
    netmask: 255.255.240.0
    gateway: 10.2.31.254            
cp03:
  console03:
    name: console03
    vcpu: 4
    memory: 8
    disk: 200
    ipaddress: 10.2.16.25
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  crm01:
    name: crm01
    vcpu: 4
    memory: 8
    disk: 200
    ipaddress: 10.2.16.27
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  cpdbs01:
    name: cpdbs01
    vcpu: 16
    memory: 32
    disk: 2000
    ipaddress: 10.2.16.36
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  redis02:
    name: redis02
    vcpu: 2
    memory: 8
    disk: 200
    ipaddress: 10.2.16.39
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  alarm02:
    name: alarm02
    vcpu: 16
    memory: 32
    disk: 500
    ipaddress: 10.2.16.46
    netmask: 255.255.240.0
    gateway: 10.2.31.254
                
cp04:
  console04:
    name: console04
    vcpu: 4
    memory: 8
    disk: 200
    ipaddress: 10.2.16.26
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  crm02:
    name: crm02
    vcpu: 4
    memory: 8
    disk: 200
    ipaddress: 10.2.16.28
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  icpmg01:
    name: icpmg01
    vcpu: 8
    memory: 16
    disk: 200
    ipaddress: 10.2.16.29
    netmask: 255.255.240.0
    gateway: 10.2.31.254    
  jobsche01:
    name: jobsche01
    vcpu: 8
    memory: 16
    disk: 100
    ipaddress: 10.2.16.32
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  kafka02:
    name: kafka02
    vcpu: 16
    memory: 32
    disk: 300
    ipaddress: 10.2.16.34
    netmask: 255.255.240.0
    gateway: 10.2.31.254    
  keycloak01:
    name: keycloak01
    vcpu: 4
    memory: 8
    disk: 200
    ipaddress: 10.2.16.40
    netmask: 255.255.240.0
    gateway: 10.2.31.254 
  alarm01:
    name: alarm01
    vcpu: 16
    memory: 32
    disk: 500
    ipaddress: 10.2.16.45
    netmask: 255.255.240.0
    gateway: 10.2.31.254 

cp05:
  icpmg02:
    name: icpmg02
    vcpu: 8
    memory: 16
    disk: 200
    ipaddress: 10.2.16.30
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  collect01:
    name: collect01
    vcpu: 16
    memory: 32
    disk: 500
    ipaddress: 10.2.16.31
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  kafka01:
    name: kafka01
    vcpu: 16
    memory: 32
    disk: 300
    ipaddress: 10.2.16.33
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  keycloak02:
    name: keycloak02
    vcpu: 4
    memory: 8
    disk: 200
    ipaddress: 10.2.16.41
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  k8sdeploy01:
    name: k8sdeploy01
    vcpu: 4
    memory: 8
    disk: 200
    ipaddress: 10.2.16.43
    netmask: 255.255.240.0
    gateway: 10.2.31.254           

cp06:
  cpdbs02:
    name: cpdbs02
    vcpu: 16
    memory: 32
    disk: 2000
    ipaddress: 10.2.16.37
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  keycloak03:
    name: keycloak03
    vcpu: 4
    memory: 8
    disk: 200
    ipaddress: 10.2.16.42
    netmask: 255.255.240.0
    gateway: 10.2.31.254
  k8sdeploy02:
    name: k8sdeploy02
    vcpu: 4
    memory: 8
    disk: 200
    ipaddress: 10.2.16.44
    netmask: 255.255.240.0
    gateway: 10.2.31.254        
