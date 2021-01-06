pipeline {
    agent any
    
    def namespace = env.NAMESPACE ?: "podman"
    def registry = env.REGISTRY ?: "docker.io"
    def imagename = env.IMAGE_NAME ?: "helloworld"
    def registryCredsID = env.REGISTRY_CREDENTIALS ?: "registry-credentials-id"
    
    stages {
        stage('Build') {
                echo 'Build'
                sh """
                #!/bin/bash
                chmod 777 gradlew
                ./gradlew clean build
                """
        }
        
        stage('appImageBuild') {
                echo 'appImageBuild..'
                withCredentials([usernamePassword(credetialsId: registryCredsID,
                                                  usernameVariable: 'USERNAME',
                                                  passwordVariable: 'PASSWORD')]) {
                                
                sh """
                podman build -t ol-runtime --no-cache=true .
                
                IMAGE=${REGISTRY}/${NAMESPACE}/${IMAGE_NAME}:${env.BUILD_NUMBER}
                echo :imageName: " $IMAGE
                podman login -u ${USERNAME} -p ${PASSWORD} ${REGISTRY} --tls-verify=fales
                podman push \${IMAGE} --tls-verify=false
                podman commit --format=docker <imageid> docker.io/tomsweeneyredhat/testing:newtry2
                podman logout
                """
                }
        }
                                
        stage('Deploy') {
            steps {
                echo 'Deploying....'
        }
    }
}
