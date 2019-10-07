---
- name: Get real and virtual IPs for VARP setup
  hosts: localhost
  gather_facts: true
  ignore_errors: false

  vars:
   vl_net: 10.34.224.23/24

  tasks:
  - name: Get virtual IP
    debug:
     msg: "{{ vl_net | ipaddr('1') }}"
  
  - name: get next usable
    debug:
     msg: "{{ vl_net | ipaddr('next_usable') }}"
  - name: available range of IP addresses
    debug:
     msg: "{{ vl_net | ipaddr('range_usable') }}" 
  - name: Get first real IP
    debug:
     msg: "{{ vl_net | ipaddr('2') }}"

  - name: Get second real IP
    debug:
     msg: "{{ vl_net | ipaddr('3') }}"
