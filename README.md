# but ?!

site web: hello world replica 2
Traefik (comme reverse proxy) qui pointe sur le site web (avec comme entre http://gitlab.exemple)
tout ca avec minikube
pas de trop de commande console, surtout des fichier de config pour pouvoir tt suprimer et recommencer rapidement.

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
 chmod 700 get_helm.sh
 ./get_helm.sh
helm repo add traefik https://traefik.github.io/charts



Mais quel est l'objectif ? ok posons nous un objectif car j'ai aps de motiv la ptdr,




- utiliser terraform pour créer x agent-k3s
- utiliser ansible pour installer k3s sur les agents
- installer argo cd et qui pull le repo github avec un projet et qui le tiens a jours
- 


sudo kubectl port-forward service/argocd-server -n argocd 8080:443
ssh -L 8080:localhost:8080 agent@192.168.1.201 -N