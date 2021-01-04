pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'chmod 777 gradlew'
                sh './gradlew clean build'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
