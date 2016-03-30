include:
   - glassfish-install

install_portal:
   pkg.installed:
     - sources:
       - portal-web: salt://rpms/portal-web{{ pillar['portal-web']['version']['QA_ENV'] }}.noarch.rpm
       - portal-war: salt://rpms/portal-war{{ pillar['portal-war']['version']}}.noarch.rpm

portal_health_check:
   cmd.run:
     - name: curl --get -I http://{{ grains['fqdn'] }}:8080/portal/healthCheck
     - name: curl --get -I http://{{ grains['fqdn'] }}:8080/portal-web/healthCheck
     - require:
       - pkg: install_portal

install_cifs-utils:
   pkg.installed:
     - name: cifs-utils

mount_shared_root:
   mount.mounted:
     - name: {{ pillar['shared_root']['target'] }}
     - device: {{ pillar['shared_root']['source'] }}
     - fstype: cifs
     - opts: rw,noperm,user={{ pillar['shared_root']['user'] }},domain={{ pillar['shared_root']['domain'] }},password={{ pillar['shared_root']['password'] }}
     - mkmnt: True
     - dump: 0
     - pass_num: 0
     - require:
       - pkg: install_cifs-utils

install_subversion:
   pkg.installed:
     - name: subversion


