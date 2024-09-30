pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'
    }

    stages {
        stage('Run Maven Clean and Verify') {
            steps {
                dir('/var/jenkins_home/demo') {
                    script {
                        sh 'mvn clean verify'
                    }
                }
            }
        }

        stage('Run SonarQube Analysis') {
            steps {
                dir('/var/jenkins_home/demo') {
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

}
