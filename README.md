
# GCP GKE / CloudBuild CI Demo

  

Hello World Golang app to demo GCP CloudBuild on GKE - CI 

## Connect Repository
Connect GitHub, Bitbucket or GKE Repository
  
## Trigger
Create build trigger.  Can create against any branch or all.  Current sample filters "master" branch out in create a destroy steps.
- Add variables to the trigger:
   
       _PROJECT_NAME - name of the project (will transform to the K8s cluster, docker image, and load balancer)
   
       _ZONE - enter the GCP zone for the cluster to be created in.

       _TEARDOWN - true/false.  Whether or not to teardown the test cluster when complete.


## Run Steps

 1. Application Install
 2. Application Build
 3. Application Unit Test
 4. Package Docker Application
 5. Push Docker Image
 6. Create GKE Cluster
 7. Transform Manifests
 8. Apply (deploy) k8s configuration (application & services)
 9. Test Deployment (query LB IP and cURL result)
 10. Destroy QA Cluster
  
---
### GoLang App

  

Run golang program
```
go run main.go
```
Testing
```
go test
```
Build binary
```
go build
```
Install binary
```
go install
```