# Accounts

The basic Authz data model is: User, Org, Project, Roles

Roles:
- Admin
- User
- SuperAdmin

Types:
- Org
- Project

E.g.
- User A, is a member of Org 001, null, role: Admin
	- they are an Admin of that Org and so can create, edit, delete, etc Projects in it because they have Admin Role
	- they can see all the Projects and Users in that Org
	- they can grant Admin role of the Org to another User.
	- they can grant Admin role of a Project in that org, to another User.
- User C, is a member of Org 001, Proj 001, role: Admin
	- they are an Admin of that Orgs project.
	- they can edit the project data and users of the project.
	- they can grant Admin role of the Project to another User.
- User B, is a member of Org 001, Proj 001, role: User
	- they are a User of that Orgs project. So essentially enrolled into that project, but cant do much.


## AuthZ

- The SuperAdmin, OrgAdmin and ProjectAdmin can admin the users and their rights.
- route: /admin?org=001,Project=002, and then look at users authz jwt to check they can admin this path.
	- So superamdin can do it for ALL
	- so Org Admin only for their org
	- etc etc

