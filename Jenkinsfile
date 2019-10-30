pipeline {
    agent { label 'node' }
    stages {
      stage('1st stage') {
        steps {
            sh '''
              ls
              pwd
              cd /home/cloud_user/chef-repo/
              ls
              knife ssh "${NODE}" 'sudo chef-client' -x cloud_user -P "${PASSWD}"
            '''
        }
      }
    }
}
