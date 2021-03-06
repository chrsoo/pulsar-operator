#!/usr/bin/env bash

export WORK_DIR=$(cd `dirname $0`; cd ../..; pwd)

# create pulsar cluster crd
kubectl apply -f ${WORK_DIR}/deploy/crds/pulsar.apache.org_pulsarclusters_crd.yaml
kubectl apply -f ${WORK_DIR}/test/admin/admin.yaml

# create pulsar cluster operator account and role
kubectl apply -f ${WORK_DIR}/deploy/rbac/all_namespace_rbac.yaml

# create one example pulsar cluster
kubectl apply -f ${WORK_DIR}/test/pvc/pulsar_v1alpha1_pulsarcluster_cr.yaml

# start pulsar operator local
cd ${WORK_DIR}
operator-sdk up local