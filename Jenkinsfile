node {
  def maven = docker.image('maven:3.5.4-alpine')
  stage('Preparation') {
    git url: '/home/submission-cicd-pipeline-adityarahman'
        branch: 'master'
  }
  stage('Build') {
    maven.inside('-v /root/.m2:/root/.m2') {
      sh 'mvn -B -DskipTests clean package'
    }
  }
  stage('Test') {
    maven.inside('-v /root/.m2:/root/.m2') {
      sh 'mvn test'
    }
  }
  stage('Manual Approval') {
    input message: 'Lanjutkan ke tahap Deploy?'
  }
  stage('Deploy') {
    sh './jenkins/scripts/deploy.sh'
  }
}
