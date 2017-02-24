--- module/web/pyload_app.py.orig	2017-02-18 02:45:46 UTC
+++ module/web/pyload_app.py
@@ -38,6 +38,9 @@ from filters import relpath, unquotepath
 
 from module.utils import formatSize, save_join, fs_encode, fs_decode
 
+reload(sys)  # Reload does the trick!
+sys.setdefaultencoding("UTF-8")
+
 # Helper
 
 def pre_processor():
