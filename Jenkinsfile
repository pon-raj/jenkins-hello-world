def namespace = env.NAMESPACE ?: "podman"
def registry = env.REGISTRY ?: "docker.io"
def imageName = env.IMAGE_NAME ?: "helloworld"
def registryCredsID = env.REGISTRY_CREDENTIALS ?: "registry-credentials-id"

pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                echo 'Build'
                sh """
                #!/bin/bash
                chmod 777 gradlew
                ./gradlew clean build
                """
            }
        }
        
        stage('appImageBuild') {
            steps {
                echo 'appImageBuild..'
                withCredentials([usernamePassword(credentialsId: registryCredsID,
                                                  usernameVariable: 'USERNAME',
                                                  passwordVariable: 'PASSWORD')]) {
                                
                sh """
                podman build -t ol-runtime --no-cache=true .
                
                //IMAGE=${registry}/${namespace}/${imageName}:${env.BUILD_NUMBER}
                podman login -u ${USERNAME} -p ${PASSWORD} ${registry} --tls-verify=false
                podman tag localhost/ol-runtime u1z3/openliberty-helloworld:latest --tls-verify=false
                podman push u1z3/openliberty-helloworld:latest --tls-verify=false
                //podman commit --format=docker <containerID> docker.io/u1z3/openliberty-helloworld:latest
                podman logout --tls-verify=false
                """
                }
            }
        }
                                
        stage('Deploy') {
            steps {
                echo 'Deploying....'
        }
        }
    }
}
