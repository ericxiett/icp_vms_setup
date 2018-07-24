trantemplate:
  file.managed:
    - name: /home/ubuntu/centos73x86_64_cloud-init.qcow2
    - source:
      - salt://files/centos73x86_64_cloud-init.qcow2
    - user: root
    - group: root
    - template: jinja