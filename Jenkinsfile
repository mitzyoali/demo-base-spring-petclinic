pipeline {
    agent { label 'node' }
    stages {
      stage('1st stage') {
        steps {
            sh '''
              ls
              pwd
              cd /home/cloud_user/chef-repo/
              knife ssh 'name:web-node1' 'sudo chef-client' -x cloud_user -P 12345678
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
