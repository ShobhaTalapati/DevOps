properties_exists:
   file.exists:
     - name: /root/{{ grains['host'] }}-Installer.properties

install_glassfish:
   pkg.installed:
     - sources:
       - glassfish: salt://rpms/glassfish-{{ pillar['glassfish']['version'] }}.noarch.rpm
       - glassfish-resilient: salt://rpms/glassfish-resilient-{{ pillar['glassfish-resilient']['version'] }}.noarch.rpm
     - require:
       - file: properties_exists

start_glassfish:
   service.running:
     - name: glassfish
     - require:
       - pkg: install_glassfish

