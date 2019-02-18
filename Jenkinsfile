pipeline {

  agent {
    node {
      label 'master'
    }  
  }
   environment {
    TF_VAR_root_password    = credentials('jenkins-template-root-password')
    TF_VAR_vsphere_password = credentials('jenkins-vsphere-password')
  }
  stages {
    stage('checkout') {
      steps {
        checkout scm
        sh 'docker pull hashicorp/terraform:light'
      }
    }
    stage('init') {
      steps {
        sh 'docker run -w /app -v /root/.aws:/root/.aws -e TF_VAR_vsphere_password -e TF_VAR_root_password -v `pwd`:/app hashicorp/terraform:light init'
      }
    }
    stage('plan') {
      steps {
        sh 'docker run -w /app -v /root/.aws:/root/.aws -v -e TF_VAR_vsphere_password -e TF_VAR_root_password `pwd`:/app hashicorp/terraform:light plan'
      }
    }
    stage('approval') {
      options {
        timeout(time: 1, unit: 'HOURS') 
      }
      steps {
        input 'approve the plan to proceed and apply'
      }
    }
    stage('apply') {
      steps {
        sh 'docker run -w /app -v /root/.aws:/root/.aws -v -e TF_VAR_vsphere_password -e TF_VAR_root_password `pwd`:/app hashicorp/terraform:light apply -auto-approve'
        cleanWs()
      }
    }
  }
}