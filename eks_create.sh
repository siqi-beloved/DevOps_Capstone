eksctl create cluster \
--name siqi-prod \
--version 1.14 \
--region us-east-2 \
--nodegroup-name siqi-prod-workers \
--node-type t2.micro \
--nodes 1 \
--nodes-min 1 \
--nodes-max 2 \
--node-ami auto