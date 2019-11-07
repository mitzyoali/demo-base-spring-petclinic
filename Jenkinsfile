pipeline {
    agent { label 'node' }
    stages {
      stage('1st stage') {
        steps {
            sh '''
              cd /home/cloud_user/chef-repo/
              knife ssh 'name:develop' 'sudo chef-client' -x cloud_user -P "${PASS_NODE}"
              cat "/home/cloud_user/prueba.txt"
            '''
        }
      }
    stage('sending email') {
        steps {
            sh '''
             echo 'sending email'
            '''
        }
      }
    stage('Approval to Production?') {
        steps {
            timeout(time: 24, unit: 'HOURS') {
            input 'Continue to Deploy Production?'
            }
        }
      }
    stage('move to production branch') {
        steps {
            sshagent(['mitzi-git']) {
                sh '''
                git checkout master
                git merge origin develop
                git commit -am "Subiendo cambios a Master"
                git push -f
                echo 'git merge to production'
                '''
          }
        }
      }
    stage('run in production') {
        steps {
            sh '''
             echo 'running production'
            '''
        }
      }
    }
}
