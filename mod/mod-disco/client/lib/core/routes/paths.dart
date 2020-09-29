

class Paths{
  final String baseRoute;
  String userInfo;
  String orgs;
  String orgsId;
  String ready;
  String supportRoles;
  String myNeeds;
  String splash;
  String dashboard;
  String dashboardId;

  Paths(this.baseRoute) : 
   dashboard  = '$baseRoute/dashboard/orgs', // Admin dashboard routes
   dashboardId = '$baseRoute/dashboard/orgs/:id', // Admin dashboard routes
   userInfo = '$baseRoute/userInfo',// Non-Admin routes
   orgs = '$baseRoute/orgs',
   orgsId = '$baseRoute/orgs/:id',
   ready = '$baseRoute/ready',
   supportRoles = '$baseRoute/supportRoles/orgs/:id',
   myNeeds = '$baseRoute/myneeds/orgs/:id',
   splash = '$baseRoute/';
  
}