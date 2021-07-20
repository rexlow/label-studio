IMAGE_NAME=asia.gcr.io/rm-srv-sb/rm-label-studio:latest
yes | docker container prune
docker rmi $IMAGE_NAME
docker build -t $IMAGE_NAME .
docker push $IMAGE_NAME
gcloud run deploy --image $IMAGE_NAME