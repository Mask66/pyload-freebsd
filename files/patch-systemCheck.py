--- systemCheck.py.orig	2017-02-18 02:45:46 UTC
+++ systemCheck.py
@@ -32,7 +32,7 @@ def main():
         print("OpenSSL:", "missing")
 
     try:
-        import Image
+        from PIL import Image
         print("image libary:", Image.VERSION)
     except:
         print("image libary:", "missing")
@@ -67,7 +67,7 @@ def main():
         core_err.append("Your py-curl version is to old, please upgrade!")
 
     try:
-        import Image
+        from PIL import Image
     except:
         core_err.append("Please install py-imaging/pil to use Hoster, which uses captchas.")
 
