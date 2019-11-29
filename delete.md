kubectl logs srv-ckan-ckan-core-harvester-8449bbd4c5-kkbqj srv-ckan-ckan-core-harvester-fetch | grep GUID | sed -e 's/.*GUID \([^,]*\),.*/\1/g' > /tmp/deleted_packages2

-- 10         with open('/tmp/deleted_packages') as f:
+   9             for guid in f.readlines():
+   +   8                 print(guid)
+   +   7                 try:
+   +   6                     self.client.action.dataset_purge(id=guid.strip())
+   --  5                 except Exception as e:
+   +   4                     print(e)
+   --  3                     pass
+
