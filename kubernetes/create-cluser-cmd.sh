kops create cluster --name=kubevpro.decodingdevops.co.uk --state=s3://vprofile-states-kops --zones=us-east-1a,us-east-1b --node-count=2 --node-size=t3.small --master-size=t3.medium --dns-zone=kubevpro.decodingdevops.co.uk --node-volume-size=8 --master-volume-size=8



# CREATING A CLUSTER COMMAND AFTER INSTALLING KUBECTL AND KOPS  
# NB: The </> does not create the cluster, creates the configuration and store in s3 bucket
# Each time you write the kops command, specify the bucket or wont work 
kops create cluster --name=kubevpro.decodingdevops.co.uk \
> --state=s3://viprofile-kops-state --zones=us-east-1a,us-east-1b \
> --node-count=2 --node-size=t3.small --master-size=t3.medium --dns-zone=kubevpro.decodingdevops.co.uk \
> --node-volume-size=8 --master-volume-size=8


kops update cluster --name=kubevpro.decodingdevops.co.uk --state=s3://viprofile-kops-state --yes --admin

kops validate cluster kubevpro.decodingdevops.co.uk --state=s3://viprofile-kops-state

# creating volume and copy the volume id for re-use later ensure that you use the same availability zone as during the creating of the cluster.
aws ec2 create-volume --availability-zone=us-east-1a --size=3 --volume-type=gp2

 # shows the existing labels which we can use.
kubectl get nodes --show-labels

# creating our own labels 1. Get the node name 
# </> kubectl get nodes 
# </> kubectl describe node NODE_NAME | grep us-east-2 [REGION] , gives a description of the zone of the node and other infos
# Labelling a node ZONE_NAME can be gotten from the definition file.
kubectl label nodes NODE_NAME zone=ZONE_NAME

# GITHUB REPO FOR THE DEFINITION FILES ==> https://github.com/GodfredAsa/kube-app

kops delete cluster --name=kubevpro.decodingdevops.co.uk --state=s3://viprofile-kops-state --yes 
# after deleting 
sudo poweroff

# When you want it back on 
sudo poweron 
