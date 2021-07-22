PROJECT=rm-srv-sb
APP_NAME=rm-label-studio
IMAGE_NAME=asia.gcr.io/$PROJECT/$APP_NAME:latest

# remove previous builds
yes | docker container prune
docker rmi $IMAGE_NAME

# only run this if frontend has changed
# cd label_studio/frontend && npm install && npm run build:production && cd ../..

# build and push
docker build -t $IMAGE_NAME .
docker push $IMAGE_NAME

# deploy to google cloud run
gcloud config set project $PROJECT
gcloud run deploy $APP_NAME \
    --project $PROJECT \
    --platform managed \
    --region asia-southeast1 \
    --image $IMAGE_NAME \
    --cpu 1 \
    --max-instances 5 \
    --set-env-vars DJANGO_DB=default \
    --set-env-vars LABEL_STUDIO_ONE_CLICK_DEPLOY=1 \
    --set-env-vars POSTGRE_NAME=${RM_LABEL_STUDIO_DB_NAME} \
    --set-env-vars POSTGRE_USER=${RM_LABEL_STUDIO_DB_USER} \
    --set-env-vars POSTGRE_PASSWORD=${RM_LABEL_STUDIO_DB_PASS} \
    --set-env-vars POSTGRE_PORT=${RM_LABEL_STUDIO_DB_PORT} \
    --set-env-vars POSTGRE_HOST=${RM_LABEL_STUDIO_DB_HOST} \
    --set-env-vars LABEL_STUDIO_USERNAME=${RM_LABEL_STUDIO_USERNAME} \
    --set-env-vars LABEL_STUDIO_PASSWORD=${RM_LABEL_STUDIO_PASSWORD} \
    --set-env-vars LABEL_STUDIO_DISABLE_SIGNUP_WITHOUT_LINK=true \
    --allow-unauthenticated \
    --service-account ${RM_LABEL_STUDIO_SERVICE_ACCOUNT}