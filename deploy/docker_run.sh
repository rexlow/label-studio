IMAGE_NAME=asia.gcr.io/rm-srv-sb/rm-label-studio:latest
docker build -t $IMAGE_NAME .
docker run -it -p 8080:8080 \
    -e DJANGO_DB=default \
    -e POSTGRE_NAME=${RM_LABEL_STUDIO_DB_NAME} \
    -e POSTGRE_USER=${RM_LABEL_STUDIO_DB_USER} \
    -e POSTGRE_PASSWORD=${RM_LABEL_STUDIO_DB_PASS} \
    -e POSTGRE_PORT=${RM_LABEL_STUDIO_DB_PORT} \
    -e POSTGRE_HOST=${RM_LABEL_STUDIO_DB_HOST} \
    -e LABEL_STUDIO_USERNAME=${RM_LABEL_STUDIO_USERNAME} \
    -e LABEL_STUDIO_PASSWORD=${RM_LABEL_STUDIO_PASSWORD} \
    -e LABEL_STUDIO_DISABLE_SIGNUP_WITHOUT_LINK=true \
    -v `pwd`/mydata:/label-studio/data $IMAGE_NAME label-studio --log-level DEBUG