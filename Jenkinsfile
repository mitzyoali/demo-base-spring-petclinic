pipeline {
    agent { label 'node' }
    stages {
      stage('prueba 1') {
        steps {
            sh '''
              pwd
              cd /home/cloud_user/chef-repo/
              ls
              knife ssh 'name:web-node1' 'sudo chef-client' -x cloud_user -P 12345678
            '''
        }
      }
    }
}
