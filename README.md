# README

This is a clean-up tool for Slide4VR.

## Build

```bash
docker build -t gcr.io/slide2vr/slide4vr-url-cleaner .
```

## Run on Local

```bash
docker run -it -v $(dirname $GOOGLE_APPLICATION_CREDENTIALS):/seacret/ -e GOOGLE_APPLICATION_CREDENTIALS=/seacret/$(basename $GOOGLE_APPLICATION_CREDENTIALS) gcr.io/slide2vr/slide4vr-url-cleaner
```

## Set Job Scheduler

```bash
export SVC_URL=
export SVC_ACC=
gcloud beta scheduler jobs create http run-slide4vr-cleaner --schedule "*/5 * * * *" \
   --http-method=GET \
   --uri=$SVC_URL \
   --oidc-service-account-email=$SVC_ACC \
   --oidc-token-audience=$SVC_URL
```