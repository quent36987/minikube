curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
kb create ns treafik
helm repo add traefik https://traefik.github.io/charts
helm repo update
helm install traefik traefik/traefik --values=traefik-values.yaml -n traefik
k get all -n traefik
k get events -n traefik

kubectl get svc -l app.kubernetes.io/name=traefik
kubectl get po -l app.kubernetes.io/name=traefik



