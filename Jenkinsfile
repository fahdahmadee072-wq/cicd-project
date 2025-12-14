pipeline {
  agent any

  stages {

    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build (Validate)') {
      steps {
        sh '''
          echo "Validating static site"
          test -f app/index.html
        '''
      }
    }

    stage('Prepare Inventory') {
      steps {
        sh '''
          echo "[web]" > inventory-dev
          echo "$(cat terraform/vm_ip.txt) ansible_user=fahda" >> inventory-dev
        '''
      }
    }

    stage('Deploy') {
      steps {
        sh '''
          cd ansible
          ANSIBLE_HOST_KEY_CHECKING=False \
          ansible-playbook -i ../inventory-dev  deploy.yml
        '''
      }
    }

    stage('Health Check') {
      steps {
        sh '''
          sleep 5
          curl -f http://$(cat terraform/vm_ip.txt)
        '''
      }
    }
  }

  post {
    success {
      echo "✅ Deployment successful"
    }
    failure {
      echo "❌ Deployment failed"
    }
  }
}

