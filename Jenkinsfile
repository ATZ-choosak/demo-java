pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ATZ-choosak/demo-java.git']]])
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
                      -Dsonar.host.url=http://172.18.0.2:9000 \
                      -Dsonar.login=sqp_bdb933b0a7b129bb2909e39974ec7f108788fb16
                    """
                }
            }
        }
    }

}
