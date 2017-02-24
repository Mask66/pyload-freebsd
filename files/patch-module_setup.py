--- module/setup.py.orig	2017-02-18 02:45:46 UTC
+++ module/setup.py
@@ -218,7 +218,7 @@ class Setup():
 
         print ""
 
-        pil = self.check_module("Image")
+        pil = self.check_module("PIL")
         self.print_dep("py-imaging", pil)
 
         if os.name == "nt":
