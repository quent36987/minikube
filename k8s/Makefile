
run:
	@echo "Launch playbook"
	@docker run --rm -it --mount type=bind,source=./mycluster,dst=/inventory/mycluster \
       --mount type=bind,source="${HOME}"/.ssh,dst=/root/.ssh \
       quay.io/kubespray/kubespray:v2.23.1 ansible-playbook --become --become-user=root -i /inventory/mycluster/inventory.ini cluster.yml

connect:
	@echo "get admin.conf"
#ssh $USERNAME@$IP_CONTROLLER_0
#USERNAME=$(whoami)
#sudo chown -R $USERNAME:$USERNAME /etc/kubernetes/admin.conf
	@scp root@192.168.1.200:/etc/kubernetes/admin.conf kubespray-do.conf
	# chnage the ip address 127.0.0.1 to 192.168.1.200
	@sed -i 's/127.0.0.1/192.168.1.200/g' kubespray-do.conf
	@export KUBECONFIG=${PWD}/kubespray-do.conf
	@echo "connect to cluster"


# ansible-playbook --become --become-user=root -i /inventory/mycluster/inventory.ini cluster.yml
# ansible-playbook -i /inventory/inventory.ini cluster.yml