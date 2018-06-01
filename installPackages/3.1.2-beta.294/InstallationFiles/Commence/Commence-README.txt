If Commence.cab is in this directory it will automatically be installed when the ConfigMgr Portal is installed.  To perform a manual installation:

1. Create a folder named 'Commence' in the ConfigMgr Portal root IIS site.
2. Enable IIS Anonymous access on the folder.
3. Copy both x86 and x64 folders to the Commence folder.
4. Modify settings.cnf to configure the deployment web service location in each directory.