#!/bin/bash

gcloud beta compute instances create reddit-full \
    --project=infra-262812 \
    --image=reddit-full-1577957275 \
    --image-project=infra-262812 \
    --zone europe-west3-a \
    --machine-type=g1-small \
    --subnet=default \
    --tags puma-server \
    --restart-on-failure \
    --boot-disk-size=10GB \
    --boot-disk-type=pd-ssd

