#!/bin/bash

NAMESPACE=test

function createNamespace(){
    kubectl delete ns ${NAMESPACE}
    kubectl create ns ${NAMESPACE}
}

function individualRun(){
    kubectl apply -f configmap.yaml -n ${NAMESPACE}
    kubectl apply -f deployment.yaml -n ${NAMESPACE}
    kubectl apply -f service.yaml -n ${NAMESPACE}
    kubectl apply -f ingress.yaml -n ${NAMESPACE}
}

function helmInstall(){
    helm upgrade --install mychart-release my-chart/ -f my-chart/values.yaml -n ${NAMESPACE}
}

createNamespace
helmInstall