base:
    '*':
        - shared
    'roles:glassfish4':
        - match: grain
        - glassfish4
    'roles:portal':
        - match: grain
        - portal-web
	- portal-war
