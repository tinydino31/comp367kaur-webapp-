pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        IMAGE_NAME = 'tinydino31/comp367kaur-webapp'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/tinydino31/comp367kaur-webapp-.git'
            }
        }

        stage('Build .NET Project') {
            steps {
                bat 'dotnet publish comp367kaur-webapp/comp367kaur-webapp.csproj -c Release -o out'
            }
        }

        stage('Docker Login') {
            steps {
                bat 'echo %DOCKERHUB_CREDENTIALS_PSW% | docker login -u %DOCKERHUB_CREDENTIALS_USR% --password-stdin'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Docker Push') {
            steps {
                bat 'docker push %IMAGE_NAME%'
            }
        }
    }
}
