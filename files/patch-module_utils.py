--- module/utils.py.orig	2017-02-18 02:45:46 UTC
+++ module/utils.py
@@ -110,7 +110,7 @@ def freeSpace(folder):
         from os import statvfs
 
         s = statvfs(folder)
-        return s.f_bsize * s.f_bavail
+        return s.f_frsize * s.f_bavail
 
 
 def uniqify(seq, idfun=None):
