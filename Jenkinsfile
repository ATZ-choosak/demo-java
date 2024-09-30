pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'
        docker 'Docker'  
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/ATZ-choosak/demo-java.git'
            }
        }

        stage('Start Services with Docker Compose') {
            steps {
                script {
                    sh "docker-compose up -d"
                }
            }
        }

        stage('Run Maven Clean and Verify') {
            steps {
                script {
                    sh 'mvn clean verify'
                }
            }
        }

        stage('Run SonarQube Analysis') {
            steps {
                script {
                    sh """
                    mvn sonar:sonar \
                      -Dsonar.projectKey=coe6410110109 \
                      -Dsonar.host.url=http://172.18.0.3:9000 \
                      -Dsonar.login=sqp_7f566fb7200e285b361977e9f1699a9f4c862403
                    """
                }
            }
        }
    }

    post {
        always {
            script {
                sh "docker-compose down"
            }
        }
    }
}
