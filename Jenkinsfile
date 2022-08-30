node {    
      def app     
      stage('Clone repository') {               
             
            checkout scm    
      }     
      stage('Build image') {         

            app = docker.build("jagadishwar/demo-image")    
       }     
    
       stage('Push image') {
       docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {            
       app.push("${env.BUILD_NUMBER}")
              }    
           }
       stage('Deploy') {         
            sh 'scp deploy.sh ubuntu@172.31.4.20:~/'
            sh 'ssh ubuntu@172.31.4.20 "chmod +x deploy.sh"'
            sh "ssh ubuntu@172.31.4.20 ./deploy.sh \"${env.BUILD_NUMBER}\""

      } 
        }
