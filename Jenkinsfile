pipeline {
  agent any

<<<<<<< HEAD
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
=======
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
>>>>>>> f83be46 (Initial CI/CD project with Terraform, Ansible, and Jenkinsfile)
      }
    }

    stage('Prepare Inventory') {
      steps {
        sh '''
          echo "[web]" > inventory-dev
<<<<<<< HEAD
          echo "$(cat terraform/vm_ip.txt) ansible_user=fahda" >> inventory-dev
=======
          echo "$(cat terraform/vm_ip.txt) ansible_user=fahda ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_rsa" >> inventory-dev
          cat inventory-dev
>>>>>>> f83be46 (Initial CI/CD project with Terraform, Ansible, and Jenkinsfile)
        '''
      }
    }

<<<<<<< HEAD
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
=======
    stage('Deploy with Ansible') {
      steps {
        sh '''
          cd ansible
          ansible-playbook -i ../inventory-dev deploy.yml
>>>>>>> f83be46 (Initial CI/CD project with Terraform, Ansible, and Jenkinsfile)
        '''
      }
    }
  }

  post {
<<<<<<< HEAD
    success {
      echo "✅ Deployment successful"
    }
    failure {
      echo "❌ Deployment failed"
=======
    failure {
      echo '❌ Deployment failed'
    }
    success {
      echo '✅ Deployment successful'
>>>>>>> f83be46 (Initial CI/CD project with Terraform, Ansible, and Jenkinsfile)
    }
  }
}

