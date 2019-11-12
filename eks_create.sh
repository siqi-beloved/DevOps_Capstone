eksctl create cluster \
--name siqi-test \
--version 1.14 \
--region us-east-2 \
--nodegroup-name siqi-nodes \
--node-type t2.micro \
--nodes 2 \
--nodes-min 1 \
--nodes-max 2 \
--node-ami auto
