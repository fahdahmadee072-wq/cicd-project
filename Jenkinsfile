pipeline {
  agent any

  stages {

    stage('Get VM IP from Terraform') {
      steps {
        dir('terraform') {
          sh '''
          terraform output -raw vm_ip > ../vm_ip.txt
          '''
        }
      }
    }

    stage('Prepare Ansible Inventory') {
      steps {
        sh '''
        echo "[web]" > inventory-dev
        echo "$(cat vm_ip.txt) ansible_user=fahda ansible_ssh_private_key_file=~/.ssh/id_rsa" >> inventory-dev
        '''
      }
    }

    stage('Deploy using Ansible') {
      steps {
        dir('ansible') {
          sh '''
          ansible-playbook -i ../inventory-dev first-playbook.yml
          '''
        }
      }
    }
  }
}

~
~
~
                                             
