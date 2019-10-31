pipeline {
    agent { label 'node' }
    stages {
       stage ('Approval'){
           steps {
               mail (to: 'mitzyoali11@gmail.com',
                     subject: "Job '${env.JOB_NAME}' (${env.BUILD_NUMBER}) is waiting for input",
                     body: "Please go to ${env.BUILD_URL}.");
               input 'Ready to go?'; 
           }
        }
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
             echo 'hello world'
            '''
        }
      }
    }
}
