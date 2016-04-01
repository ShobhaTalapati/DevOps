include:
   - glassfish-install

install_portal:
   pkg.installed:
     - sources:
       - portal-web: salt://rpms/portal-web-{{ pillar['portal-web']['version']}}.noarch.rpm
       - portal-war: salt://rpms/portal-war-{{ pillar['portal-war']['version']}}.noarch.rpm





