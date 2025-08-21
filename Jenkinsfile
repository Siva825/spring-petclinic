 pipeline{
    agent any
    environment{
        HOST_URL= "https://35.192.108.118:9000"
        SONAR_TOKEN= credentials('sonarqube_token')
    }
    tools{
        jdk 'jdk17'
        maven 'maven-3.8.9'
    }
    stages{
        stage('checkout'){
            steps{
                echo "*********** cloning the code **********"
                sh 'rm -rf spring-petclinic || true'
                sh 'git clone https://github.com/Siva825/spring-petclinic.git'     
            }
        }
        stage('build'){
            steps{
                echo "********** building is done ************"
                dir('spring-petclinic'){
                    sh'mvn clean package -DskipTests'
                }
            }
        }
        stage('code analysis'){
            steps{
                echo "********** code analysis is done ***********"
                dir('spring-petclinic'){
                sh '''
                mvn clean verify sonar:sonar \
                    -Dsonar.projectKey=project-1 \
                    -Dsonar.projectName='project-1' \
                    -Dsonar.host.url=${HOST_URL}  \
                    -Dsonar.token=${SONAR_TOKEN}
                    -DskipTests
                '''
                }
            }
        }
    }
}
