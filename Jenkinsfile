pipeline {
    agent any
    def mvnHome
    stages {
      stage('prueba 1') {
        steps {
            mvnHome = tool 'M3'
            sh '''
              mvn tomcat7:run
            '''
        }
      }
    }
}