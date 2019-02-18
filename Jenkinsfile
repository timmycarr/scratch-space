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
        sh 'docker run -e TF_VAR_vsphere_password -e TF_VAR_root_password -w /app -v /root/.aws:/root/.aws -v `pwd`:/app hashicorp/terraform:light init'
      }
    }
    stage('new workspace') {
      steps {
        sh 'docker run -e TF_VAR_vsphere_password -e TF_VAR_root_password -w /app -v /root/.aws:/root/.aws -v `pwd`:/app hashicorp/terraform:light workspace new lab'
      }
    }
    stage('plan') {
      steps {
        sh 'docker run -e TF_VAR_vsphere_password -e TF_VAR_root_password -w /app -v /root/.aws:/root/.aws -v `pwd`:/app hashicorp/terraform:light plan'
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
        sh 'docker run -e TF_VAR_vsphere_password -e TF_VAR_root_password -w /app -v /root/.aws:/root/.aws -v  `pwd`:/app hashicorp/terraform:light apply -auto-approve'
        cleanWs()
      }
    }
  }
}