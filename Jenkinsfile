pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key-20190523')
    }
    triggers { cron(env.BRANCH_NAME == 'master' ? 'H H(2-6) * * 1' : '') }
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
