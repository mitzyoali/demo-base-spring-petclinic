pipeline {
    agent any
    environment {
    // trust known_hosts
    GIT_SSH_COMMAND = "ssh -o StrictHostKeyChecking=no"
  }
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
            withCredentials([usernamePassword(credentialsId: 'mitzi-git', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
            sshagent(credentials: ['mitzi-git']) {
                sh '''
                git config --global user.name $GIT_USERNAME
                git config --global user.email "mitzyoali11@hotmail.com"
                git checkout master
                git fetch --all
                git pull origin develop
                git fetch --all
                git pull
                git remote set-url origin https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/demo-base-spring-petclinic
                git push -f origin master
                git fetch --all
                echo 'git merge to production .'
                '''
            }
          }
        }
      }
    stage('run in production') {
        steps {
            sh '''
             cd /home/cloud_user/chef-repo/
             knife ssh 'name:production' 'sudo chef-client' -x cloud_user -P "${PASS_NODE}"
            '''
        }
      }
    }
}
