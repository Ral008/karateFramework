pipeline{
    agent any
    
    tools {
        maven 'M3'
    }
    
    parameters { choice(name: 'Environment', choices: ['staging', 'preprod', 'prod'], description: 'Profile needs to be used while executing test') }
      
    stages{
        stage ('Clean WorkSpace Directory'){
            steps {
                //define the single or multiple step
                echo 'CleanUp Stage'
                cleanWs notFailBuild: true
            }
        }
        stage ('Git CheckOut'){
            steps {
               //define the single or multiple step
                echo 'Git Checkout'
                checkout([$class: 'GitSCM', branches: [[name: '**']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Ral008/karateFramework.git']]])
            }
            
        }
        stage ('Restore Packages'){
            steps {
                //define the single or multiple step
                echo 'Restore Package'
            }
        }
        stage ('Build'){
            steps {
               //define the single or multiple step
                echo 'Build'
                sh 'mvn clean compile'
                
            }
        }
        stage ('Deploy'){
            steps {
                echo 'Deploying the application..'
            }
        }
        stage ('Run the Test') {
            steps {
                 //define the single or multiple step
                echo 'Test Execution Started'
                sh 'mvn -P %Environment% test'
            }
        }
    }
    
    post {
        always {
            junit 'target/surefire-reports/*.xml'
            cucumber failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/surefire-reports', pendingStepsNumber: -1, reportTitle: 'Karate Test Execution', skipEmptyJSONFiles: true, skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
        }
    }
   
}