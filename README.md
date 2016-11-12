# Jenkins job configurations

## Setup
1. Log in to https://jenkins.fe80.eu
1. Get API token via profile -> API Token
1. Copy `jenkins_jobs.ini.example` to `jenkins_jobs.ini` and set username + API token


## Apply config
```jenkins-jobs --conf jenkins_jobs.ini update firmware.yml```
