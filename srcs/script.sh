#!/bin/bash

echo "ft_service"

echo "starting Minkube"
minikube start
echo "enable ingress addon"
minkube addons enable ingress
echo "starting to apply all services"
minikube apply -f nginx/*.yaml

