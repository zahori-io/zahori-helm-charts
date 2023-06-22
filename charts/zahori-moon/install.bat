kubectl create namespace moon
helm dependency build
helm install moon . -f values.yaml -n moon

