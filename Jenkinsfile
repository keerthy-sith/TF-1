pipeline{
agent any
tools {
terraform 'TF'
}
parameters{
string(name:'Name', defaultValue:'os-name',description: 'creating the server by getting user input')
choice(name:'action',choices: ['apply','destroy'],description:'creating and destroy the infra')
choice(name:'varfile',choices: ['linux.tfvars','windows.tfvars'],description:'varsfiles take')
}
environment{
AWS_DEFAULT_REGION="us-east-1"
}
stages{
stage('Checkout'){
steps{
checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/keerthy-sith/TF-1.git']]])
}
}
stage('terraform directory initilization'){
steps{
sh label:'init command running',script: 'terraform init'
}
}
stage('terraform Format'){
steps{
sh label:'init command running',script: 'terraform fmt'
}
}
stage('plan'){
steps{
sh label:'running plan command',script: 'terraform plan -input=false -out tfplan -var name=${Name}'
sh label:'running show command',script: 'terraform show -no-color tfplan > tfplan.txt'
}
}
stage('apply'){
steps{
withCredentials([aws(credentialsId: 'aws credentials')]){
sh label:'running apply command',script: 'terraform ${action} -var name=${Name} -var name=${varfile} --auto-approve'
}
}
}
}
}
