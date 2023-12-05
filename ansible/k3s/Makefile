
copy:
	@echo "Copy ansible folder (because wsl put drwxrwxrwx on every folder and files)"
	@docker exec -it ansible cp -r /usr/ansible /

vault:
	@echo "Create and chmod vault.txt"
	@docker exec -it ansible chmod 600 .password/vault.txt

k3s: copy
	@echo "Launch playbook"
	@docker exec -it ansible ansible-playbook playbooks/site.yml -i inventory/k3s/hosts.ini
	@echo ${PWD}
	@sed -i 's/127.0.0.1/192.168.1.200/g' ${PWD}/config/kube-config.yaml

reset: copy vault
	@echo "Launch playbook"
	@docker exec -it ansible ansible-playbook playbooks/reset.yml -i inventory/k3s/hosts.ini

run: copy vault
	@echo "Launch playbook"
	@docker exec -it ansible ansible-playbook ./playbooks/k8s.yml \
        -i inventory/server/hosts \
        --vault-password-file .password/vault.txt
