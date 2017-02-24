--- module/plugins/internal/Base.py.orig	2017-02-18 02:45:46 UTC
+++ module/plugins/internal/Base.py
@@ -189,7 +189,7 @@ class Base(Plugin):
 
 
     def _update_name(self):
-        name = self.info.get('name')
+        name = self.info.get('name').decode('utf-8')
 
         if name and name != self.info.get('url'):
             self.pyfile.name = name
