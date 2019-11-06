pipeline {
    agent { label 'node' }
    stages {
      stage('1st stage') {
        steps {
            sh '''
              cd /home/cloud_user/chef-repo/
              knife ssh 'name:develop' 'sudo chef-client' -x cloud_user -P "${PASS_NODE}"
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
            timeout(time: 180, unit: 'SECONDS') {
            input 'Continue to Deploy Production?'
            }
        }
      }
    stage('move to production branch') {
        steps {
            sh '''
             echo 'git merge to production'
            '''
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
