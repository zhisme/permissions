# REQUIREMENTS

You need to design a programming module PERMISSIONS that would allow Caller to
Grant a permission to a user
Check if a user has a particular permission

Caller is an external system that uses our module (particularly it calls our API).

Permission is a user right to take an action or access a resource. Permissions for resource access can be READ or WRITE. For example, Caller can grant a permission to ”reboot the server” (an example of action) OR write to a file “C:/readme.txt” (an example of resource) to a user Andrew.

Caller can grant permissions directly to a user OR via roles. If Caller wants to grant permissions via roles then Caller needs to register a role, grant permissions to the role and then assign the role to a user.

Caller can assign many roles to a user.

As a note, our module (you are designing) doesn’t provide any dictionaries to Caller. All objects (including Users) are created / managed by Caller. Our module provides ONLY functionality.

# INSTALLATION
`bundle install`

# TESTING
`bundle exec rspec`

# RUNNING
`rails s`

# CURL

```curl -d 'entity[type]=[User|Role]&entity[id]=$ID&permissions[action]=$ACTION&permissions[value]=[true|false]' 'http://localhost:3000/api/v1/permissions'```
