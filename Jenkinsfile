pipeline {
    agent any // This will run the pipeline on any available agent

    stages {
        stage('Clone Repo') {
            steps {
                script {
                    def WORKSPACE = "/var/lib/jenkins/workspace/bank-api"
                    def dockerImageTag = "bank-api${env.BUILD_NUMBER}"

                    try {
                        git url: 'https://github.com/gituserpr707/bank-api.git',
                            credentialsId: 'gituserpr707',
                            branch: 'main'
                    } catch (Exception e) {
                        throw e
                    }
                }
            }
        }

         stage('Maven Build') {
            steps {
                // Run Maven build
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('Build docker') {
            steps {
                script {
                    dockerImage = docker.build("bank-api:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Deploy docker') {
            steps {
                script {
                    echo "Docker Image Tag Name: ${dockerImageTag}"
                    sh "docker stop bank-api || true && docker rm bank-api || true"
                    sh "docker run --name bank-api -d -p 8081:8081 bank-api:${env.BUILD_NUMBER}"
                }
            }
        }
    }
}
