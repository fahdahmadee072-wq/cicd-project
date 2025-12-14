pipeline {
  agent any

  environment {
    ANSIBLE_HOST_KEY_CHECKING = 'False'
  }

  stages {

    stage('Terraform Init & Apply') {
      steps {
        dir('terraform') {
          sh '''
            terraform init -input=false
            terraform apply -auto-approve
            terraform output -raw vm_public_ip > vm_ip.txt
          '''
        }
      }
    }

    stage('Prepare Inventory') {
      steps {
        sh '''
          echo "[web]" > inventory-dev
          echo "$(cat terraform/vm_ip.txt) ansible_user=fahda ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_rsa" >> inventory-dev
          cat inventory-dev
        '''
      }
    }

    stage('Deploy with Ansible') {
      steps {
        sh '''
          cd ansible
          ansible-playbook -i ../inventory-dev deploy.yml
        '''
      }
    }
  }

  post {
    success {
      echo '✅ Deployment successful'
    }
    failure {
      echo '❌ Deployment failed'
    }
  }
}

