# Personal Ansible repository

## Structure
- [ansible.cfg](./ansible.cfg) - all-repository Ansible configuration
- [playbooks](./playbooks/) - directory with all playbooks
  - [troubleshooting](./playbooks/troubleshooting/) - directory with playbooks for troubleshooting
    - [Ping ICMP](./playbooks/troubleshooting/ping_icmp.yaml)

Inventory is not stored in this repository.

## Playbooks

### Troubleshooting

#### [Ping ICMP](./playbooks/troubleshooting/ping_icmp.yaml)

Ping all hosts from inventory via ICMP and print result table.

Recommended way to launch:
```shell
ansible-playbook -i inventory.yaml playbooks/troubleshooting/ping_icmp.yaml
```

