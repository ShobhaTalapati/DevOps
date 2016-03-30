include:
   - html-mail-uninstall

stop_glassfish:
   service.dead:
     - name: glassfish

remove_glassfish:
   pkg.removed:
     - name: glassfish
  

