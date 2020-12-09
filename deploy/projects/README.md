# Projects

A way to hold all the details needed for different projects and record it all into git.

why ?

- We will have many different projects with different modules being used.
- so that from git you can see exactly what projects and deployments exist

Fly is a simple deployment too that allow sus to:
- model the deployment fully in git.
- change the scaling in git and then just run the fly tool. Its not self reflecrive like gitops, but good enough, because CI will pick up the change and compare it to what is really deployed by fly and then make the changes for us. 

Each Project has:


go.mod
	- git clones down to maintemplate
	- which also gets use the exact flutter code
		- which has its pubspec imports versioned.
		pubspec:
		cloud_firestore:
			git:
			url: https://github.com/theshiftstudio/flutter_plugins.git
			ref: 9cabcc57e63fbc9be4fafee08e6435a1a8c71d61
			path: packages/cloud_firestore

---

	

- make file
	- calls into maintemplate x makefile.....
	- builds...

