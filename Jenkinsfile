pipeline {
   agent any
   environment {
       registry = "lhoangphuong/nginx"
       GOCACHE = "/tmp"
   }
   stages {
       stage('Build-images') {
           agent {
               docker {
                   image 'lhoangphuong/nginx'
               }
           }
           steps {
               // Build the app.
               echo 'building something!!!'              
           }    
       }
       stage('Test') {
           agent {
               docker {
                   image 'lhoangphuong/nginx'
               }
           }
           steps {                
               // Run Unit Tests.
               echo 'running some test!!'          
           }
       }
       stage('Publis') {
           environment {
               registryCredential = 'dockerhub'
           }
           steps{
               script {
                   def nginx = docker.build("lhoangphuong/nginx:${env.BUILD_ID}","-f ${env.WORKSPACE}/nginx/Dockerfile .")
                   docker.withRegistry( '', registryCredential ) {
                       nginx.push()
                       nginx.push('latest')

                   def chat = docker.build("lhoangphuong/chat:${env.BUILD_ID}","-f ${env.WORKSPACE}/chat/Dockerfile .")
                   docker.withRegistry( '', registryCredential ) {
                       chat.push()
                       chat.push('latest')

                   def whiteboard = docker.build("lhoangphuong/whiteboard:${env.BUILD_ID}","-f ${env.WORKSPACE}/whiteboard/Dockerfile .")
                   docker.withRegistry( '', registryCredential ) {
                       whiteboard.push()
                       whiteboard.push('latest')
                   }
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