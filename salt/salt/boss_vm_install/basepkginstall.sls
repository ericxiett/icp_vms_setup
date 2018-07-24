basepkg:
  pkg.installed:
  {% if grains['os'] == 'Ubuntu' %}
    - pkgs:
      - vlan
      - ifenslave
      - bridge-utils
      - qemu-kvm     
      - libvirt-bin
      - qemu-utils
      - genisoimage
  {% endif %}    
  {% if grains['os'] == 'CentOS' %}
    - pkgs:
      - libvirt
      - genisoimage
      - bridge-utils
  {% endif %}   