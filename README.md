# Make For Docker
Dan Chalmers 2016

I'm a fan of containers. They make creating fresh state and reproducable, version controlled, environments easy. 

I'm a fan of make. Makefiles are a simple way to express simple dependencies between files. In this repo I use make to ensure Docker images which depend on other images are rebuit when their parent changes; and also as a simple way to wrap up the execution of these containers.

This repo is designed to provide a template for describing docker images and the running of containers configured for a project, rather than as a stand-alone project.

This repo develops and maintains the ideas I first presented in http://www.splashinapond.com/2016/01/make-ing-docker.html and have used in various projects.
