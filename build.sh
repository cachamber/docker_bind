BUILD_DATE=`date --rfc-3339=seconds`
docker build --no-cache --pull -t chrischambers/bind:arm64v8-0.0.1 \
    --build-arg VERSION="0.0.1"  \
    --build-arg BUILD_DATE="$BUILD_DATE" .
