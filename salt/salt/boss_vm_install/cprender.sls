cprender:
  archive.extracted:
    - name: /opt/icp_vms_setup
    - source: salt://files/icp_vms_setup.tar
    - archive_format: tar
  file.managed:
    - name: /opt/icp_vms_setup/nodes/cp_vms_install.sh
    - source:
      - salt://files/cp_jinja
    - user: root
    - group: root
    - mode: 777
    - template: jinja
  cmd.run:
    - name: /opt/icp_vms_setup/nodes/cp_vms_install.sh
    - cwd: /
    - stateful:
      - test_name: /opt/icp_vms_setup/nodes/cp_vms_install.sh test   