pipeline {
    agent { label 'node' }
    stages {
      stage('1st stage') {
        steps {
            sh '''
              cd /home/cloud_user/chef-repo/
              knife ssh "${NODE_NAME}" 'sudo chef-client' -x cloud_user -P "${PASS_NODE}"
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
