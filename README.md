# Pscan-ChIP Repo

Pscan-ChIP is a bioinformatics tool useful fo the research of motifs (binding sites for transcription factors) known (PWM)       
over-represented in genomic regions derived from ChIP-Seq or similar experiments     

For more info see: [Beacon Lab](http://159.149.160.56/beacon/)     
For the original tool see: [Pscan-ChIP](http://159.149.160.88/pscan_chip_dev/)   

The Dockerfile is written to build a docker image of the Pscan-ChIP tool    
The image is based on centOS 7 and run the tool on Apache/2.4.6    
Once you have downloaded the image, you can run the Pscan-ChIP docker with the minimal command:

*docker run -d -p 8080:80 pscan_chip_image*

The image expose the docker on the port 80, so after running the docker you can access to the graphic interface of Pscan-ChIP by using the host IP address
