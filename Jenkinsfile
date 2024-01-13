pipeline {
  agent any
  stages {
    stage('Git') {
      steps {
        git(url: 'https://github.com/learn-dev-concepts/-youtube-jenkins.git', branch: 'main')
      }
    }

    stage('Code Test') {
      steps {
        sh './gradlew test'
      }
    }

    stage('Code Build') {
      steps {
        sh './gradlew build'
      }
    }

       stage("Docker Push") {
      steps {
         withCredentials([usernamePassword(credentialsId: 'docker_hub_token', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_ACCESS_TOKEN')]) {
            sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_ACCESS_TOKEN'
            sh 'docker buildx build —platform linux/amd64 —push -t devsince2021/spring-server .'
         }
      }
    }

  }
}