base:
   'roles:glassfish4':
        - match: grain
        - glassfish-install
   'roles:portal':
        - match: grain
        - portal-web
	- portal-war
