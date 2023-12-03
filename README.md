# but ?!

site web: hello world replica 2
Traefik (comme reverse proxy) qui pointe sur le site web (avec comme entre http://gitlab.exemple)
tout ca avec minikube
pas de trop de commande console, surtout des fichier de config pour pouvoir tt suprimer et recommencer rapidement.

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
 chmod 700 get_helm.sh
 ./get_helm.sh
helm repo add traefik  https://helm.traefik.io/traefik
helm repo update
helm install traefik traefik/traefik


kubectl get svc -l app.kubernetes.io/name=traefik
kubectl get po -l app.kubernetes.io/name=traefik



Mais quel est l'objectif ? ok posons nous un objectif car j'ai aps de motiv la ptdr,




- utiliser terraform pour créer x agent-k3s
- utiliser ansible pour installer k3s sur les agents
- installer argo cd et qui pull le repo github avec un projet et qui le tiens a jours
- 


sudo kubectl port-forward service/argocd-server -n argocd 8080:443
ssh -L 8080:localhost:8080 agent@192.168.1.201 -N




## k3s => helm puis le reste cela marche.. pas k8s :()







## USAGE

### Création des Vms avec terraform
Cela va construire x Vms `agent-k3s` et y Vms `server-k3s` et un `HAproxy` pour loadbalancer les server-k3s

#### Prérequis

Il faut créer un fichier `credentials.auto.tfvars` avec les variables suivantes:
 - proxmox_api_token_id
 - proxmox_api_token_secret
 - proxmox_api_url
 - ssh_public_keys

#### utilisation

```bash
terraform init
terraform apply -auto-approve
```

#### todo
1. [ ] chiffrer les variables pour pouvoir les push sur git
2. [ ] mettre le cluster sur une lan vmbr1 et le haproxy sur vmbr1 et vmbr0

### Installation de k3s avec ansible

https://kubespray.io/#/
docker run --rm -it -v path_to_inventory/my_airgap_cluster:inventory/my_airgap_cluster myprivateregisry.com/kubespray/kubespray:v2.14.0 ansible-playbook -i inventory/my_airgap_cluster/hosts.yaml -b cluster.yml

