### Build images using production Dockerfile
# Specify muliple tags

# Build react-client image
docker build -t singhabhinav/factorial-project-react-client-k8s:dev -f ./react-client/Dockerfile ./react-client

# Build express-server image
docker build -t singhabhinav/factorial-project-express-server-k8s:dev -f ./express-server/Dockerfile ./express-server

# Build worker image
docker build -t singhabhinav/factorial-project-worker-k8s:dev -f ./worker/Dockerfile ./worker

### Push images

# Push sha tag images to docker hub
docker push singhabhinav/factorial-project-react-client-k8s:dev
docker push singhabhinav/factorial-project-express-server-k8s:dev
docker push singhabhinav/factorial-project-worker-k8s:dev

### Deploy

# Apply k8s config on minikube
kubectl apply -f k8s

# Update react-client image
kubectl set image deployments/react-client-deployment react-client=singhabhinav/factorial-project-react-client-k8s:dev

# Update express-server image
kubectl set image deployments/express-server-deployment express-server=singhabhinav/factorial-project-express-server-k8s:dev 

# Update worker image
kubectl set image deployments/worker-deployment worker=singhabhinav/factorial-project-worker-k8s:dev
