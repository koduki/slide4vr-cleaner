#!/bin/bash

echo "## Download"
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS
gsutil cp gs://stg-slide4vr.nklab.dev/ssg-pages.json ssg-pages.json

echo "## Cleanup"
ruby ./app.rb ssg-pages.json verified_ssg-pages.json

echo "## Upload"
gsutil cp verified_ssg-pages.json gs://stg-slide4vr.nklab.dev/ssg-pages.json
