pipeline {
   agent any
   environment {
       registry = "lhoangphuong/nginx"
       GOCACHE = "/tmp"
   }
   stages {
       stage('Build') {
           agent {
               docker {
                   image 'lhoangphuong/nginx'
               }
           }
           steps {
               // Build the app.
               sh 'echo building something!!!'              
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
               sh 'echo running some test!!'          
           }
       }
       stage('Publish') {
           environment {
               registryCredential = 'dockerhub'
           }
           steps{
               script {
                   def appimage = docker.build registry + ":$BUILD_NUMBER"
                   docker.withRegistry( '', registryCredential ) {
                       appimage.push()
                       appimage.push('latest')
                   }
               }
           }
       }
       stage ('Deploy') {
           steps {
               script{
                    dir('/docker/letsencrypt-docker-nginx/src/production') {
                        // some block
                    }
                   sh 'pwd'
                   sh 'docker-compose down'
                   sh 'docker-compose up -d'
               }
           }
       }
   }
}
