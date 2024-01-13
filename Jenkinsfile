pipeline {
  agent any
  stages {
    stage('Git') {
      steps {
        git(url: 'https://github.com/learn-dev-concepts/-youtube-jenkins.git', branch: 'main')
      }
    }

    stage('Test') {
      steps {
        sh './gradlew test'
      }
    }

  }
}