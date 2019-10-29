pipeline {
    agent { label 'node' }
    stages {
      stage('prueba 1') {
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
