curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

kb create ns traefik
helm repo add traefik https://traefik.github.io/charts
helm repo update
helm install traefik traefik/traefik --values=traefik-values.yaml -n traefik

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl apply -f application.yaml
argocd admin initial-password -n argocd
kb port-forward -n argocd svc/argocd-server 8080:443

k get all -n traefik
k get events -n traefik

kubectl get svc -l app.kubernetes.io/name=traefik
kubectl get po -l app.kubernetes.io/name=traefik

kubectl -n argocd patch secret argocd-secret \
-p '{"stringData": {
"admin.password": "$2a$10$9THUzMQ4ddHwiPMImFZPVOXQTH6du6VuKnusYVMa7J0eBtQD6Su5e",
"admin.passwordMtime": "'$(date +%FT%T%Z)'"
}}'

