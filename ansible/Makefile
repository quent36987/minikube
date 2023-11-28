
copy:
	@echo "Copy ansible folder (because wsl put drwxrwxrwx on every folder and files)"
	@docker exec -it ansible cp -r /usr/ansible /

vault:
	@echo "Create and chmod vault.txt"
	@docker exec -it ansible chmod 600 .passwords/vault.txt

k3s: copy vault
	@echo "Launch playbook"
	@docker exec -it ansible ansible-playbook playbooks/site.yml -i inventory.yml

reset: copy vault
	@echo "Launch playbook"
	@docker exec -it ansible ansible-playbook playbooks/reset.yml -i inventory.yml

run: copy vault
	@echo "Launch playbook"
	@docker exec -it ansible ansible-playbook ./playbooks/k8s.yml \
        -i inventory/server/hosts \
        --vault-password-file .passwords/vault.txt

