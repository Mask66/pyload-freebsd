--- module/plugins/internal/misc.py.orig	2017-02-18 02:45:46 UTC
+++ module/plugins/internal/misc.py
@@ -17,6 +17,7 @@ import string
 import sys
 import time
 import traceback
+import unicodedata
 import urllib
 import urlparse
 import xml.sax.saxutils  #@TODO: Remove in 0.4.10
