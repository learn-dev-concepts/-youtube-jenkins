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

  }
}