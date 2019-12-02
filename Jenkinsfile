pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key-20190523')
    }
    triggers { cron(env.BRANCH_NAME == '0.2.x' ? 'H H(0-6) * * *' : '') }
    stages {
        stage('Test Matrix') {
            parallel {
                stage('(mode=dynamic)') {
                    agent { label "my127ws" }
                    steps { sh './test dynamic' }
                }
                stage('(mode=static)') {
                    agent { label "my127ws" }
                    steps { sh './test static' }
                }
            }
        }
    }
}
