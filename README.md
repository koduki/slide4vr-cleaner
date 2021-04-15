docker build -t gcr.io/slide2vr/slide4vr-url-cleaner .
docker run -it gcr.io/slide2vr/slide4vr-url-cleaner

docker run -it -v $(dirname $GOOGLE_APPLICATION_CREDENTIALS):/seacret/ -e GOOGLE_APPLICATION_CREDENTIALS=/seacret/$(basename $GOOGLE_APPLICATION_CREDENTIALS) gcr.io/slide2vr/slide4vr-url-cleaner
