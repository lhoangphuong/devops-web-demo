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
               // Create our project directory.
               sh "pwd"
               // Copy all files in our Jenkins workspace to our project directory.               
               sh 'cp -r ${WORKSPACE}/* /src/hello-world'
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
               // Create our project directory.
               sh "pwd"
               // Copy all files in our Jenkins workspace to our project directory.               
               sh 'cp -r ${WORKSPACE}/* /src/hello-world'
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
                   sh "echo deploying some thing!!"
               }
           }
       }
   }
}
