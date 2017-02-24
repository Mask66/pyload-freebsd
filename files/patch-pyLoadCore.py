--- pyLoadCore.py.orig	2017-02-18 02:45:46 UTC
+++ pyLoadCore.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/local/bin/python2
 # -*- coding: utf-8 -*-
 """
     This program is free software; you can redistribute it and/or modify
@@ -188,6 +188,7 @@ class Core(object):
         f = open(self.pidfile, "wb")
         f.write(str(pid))
         f.close()
+        os.chmod(self.pidfile, 0660)
 
     def deletePidFile(self):
         if self.checkPidFile():
