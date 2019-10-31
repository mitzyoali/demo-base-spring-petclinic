pipeline {
    agent { label 'node' }
    stages {
      stage('1st stage') {
        steps {
            sh '''
              ls
              pwd
              cd /home/cloud_user/chef-repo/
              knife ssh "${NODE_NAME}" 'sudo chef-client' -x cloud_user -P "${PASS_NODE}"
            '''
        }
      }
    stage('second stage') {
        steps {
            sh '''
             echo 'hello world.'
            '''
        }
      }
    }
}
