# Repo Description
This repo mainly include 4 parts.
    1. A .net core web api project 'TestDockerApi', the api had been containerized by dockerfile.
    2. A xunit test project 'TestDockerApi.Tests' reference to project 'TestDockerApi'.
    3. A github action workflow 'CI_Master_PR.yml' for build and unit test.
    4. A github action workflow 'Docker-image_CI_CD.yml' for build and deploy the docker image.

# Explaination of workflow CI_Master_PR.yml.
    The workflow will be triggered on every pull request to master branch, then run the build and run unit tests operations.

# Explaination of workflow Docker-image_CI_CD.yml.
    The workflow will be triggered on every merge pull request to master branch, then build the docker image and push the image to my personal
    dockerhub repo.


