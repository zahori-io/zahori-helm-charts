kubectl create namespace zahori
helm dependency build
helm install consul . -f values.yaml -n zahori

