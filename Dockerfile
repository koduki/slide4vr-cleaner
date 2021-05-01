FROM ruby:3

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-334.0.0-linux-x86_64.tar.gz && \
    tar xfvz google-cloud-sdk-334.0.0-linux-x86_64.tar.gz && \
     ./google-cloud-sdk/install.sh --quiet && \
     ln -s /google-cloud-sdk/bin/gsutil /usr/bin/ && \
     ln -s /google-cloud-sdk/bin/gcloud /usr/bin/ && \
     gcloud components update

RUN mkdir /app
ADD app.rb /app
ADD run.sh /app

RUN curl https://storage.googleapis.com/nklab-artifacts/hwrap -o /usr/bin/hwrap && chmod a+x /usr/bin/hwrap 

WORKDIR /app
ENV PORT=5000
CMD ["hwrap", "-Dquarkus.http.port=${PORT}", "-Dhwrap.cmd=/app/run.sh"]