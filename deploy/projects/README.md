# Projects


A way to hold all the details needed for different projects and record it all into git.

why ?

- We will have many different projects with different modules being used.
- so that from git you can see exactly what projects and deployments exist

Fly is a deployment too that allow us to:
- model the deployment fully in git.
- change the scaling in git and then just run the fly tool. Its not self reflecrive like gitops, but good enough, because CI will pick up the change and compare it to what is really deployed by fly and then make the changes for us.
