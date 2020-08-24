pipeline {
   agent any
   environment {
       registry = "lhoangphuong/nginx"
       GOCACHE = "/tmp"
   }
   stages {
       stage('Build-Golang') {
           agent {
               docker {
                   image 'golang'
               }
           }
           steps {
               // Create our project directory.
               sh 'cd ${GOPATH}/src'
               sh 'mkdir -p ${GOPATH}/src/hello-world'
               // Copy all files in our Jenkins workspace to our project directory.               
               sh 'cp -r ${WORKSPACE}/* ${GOPATH}/src/hello-world'
               // Build the app.
               sh 'go build'            
           }    
       }
       stage('Test-Golang') {
           agent {
               docker {
                   image 'golang'
               }
           }
           steps {                
               // Create our project directory.
               sh 'cd ${GOPATH}/src'
               sh 'mkdir -p ${GOPATH}/src/hello-world'
               // Copy all files in our Jenkins workspace to our project directory.               
               sh 'cp -r ${WORKSPACE}/* ${GOPATH}/src/hello-world'
               // Remove cached test results.
               sh 'go clean -cache'
               // Run Unit Tests.
               sh 'go test ./*_test.go -v -short'        
           }
       }
       stage('Publish') {
           environment {
               registryCredential = 'dockerhub'
           }
           steps{
                script {
                   def nginx = docker.build("lhoangphuong/nginx:${env.BUILD_ID}","-f ${env.WORKSPACE}/nginx/Dockerfile .")
                   docker.withRegistry( '', registryCredential ) {
                       nginx.push()
                       nginx.push('latest')
                    }
                   def chat = docker.build("lhoangphuong/chat:${env.BUILD_ID}","-f ${env.WORKSPACE}/chat/Dockerfile .")
                   docker.withRegistry( '', registryCredential ) {
                       chat.push()
                       chat.push('latest')
                    }
                   def whiteboard = docker.build("lhoangphuong/whiteboard:${env.BUILD_ID}","-f ${env.WORKSPACE}/whiteboard/Dockerfile .")
                   docker.withRegistry( '', registryCredential ) {
                       whiteboard.push()
                       whiteboard.push('latest')
                    }
                }
           }
       }
       stage ('Deploy') {
           steps {
               script{
                   // Deploy The App
                   echo 'Deploy the App'
                   sh 'docker-compose -f /docker/letsencrypt-docker-nginx/src/production/docker-compose.yml down'
                   sh 'docker-compose -f /docker/letsencrypt-docker-nginx/src/production/docker-compose.yml up -d'
               }
           }
       }
   }
}
