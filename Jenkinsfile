pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'chmod 777 gradlew'
                sh './gradlew clean build'
            }
        }
        stage('appImageBuild') {
            steps {
                echo 'appImageBuild..'
                sh 'podman build -t ol-runtime --no-cache=true .'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
