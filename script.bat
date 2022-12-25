echo "Criando as imagens..."

docker build -t ronanmartin/projeto-backend:1.0 backend/.
docker build -t ronanmartin/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push ronanmartin/projeto-backend:1.0
docker push ronanmartin/projeto-database:1.0

echo "Criando servicos no Cluster Kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml
