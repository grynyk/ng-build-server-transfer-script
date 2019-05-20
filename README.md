# ng-build-server-transfer-script
ng-bst - bash script which performs compiling an Angular app into an output directory named dist/ and uploading it into remote machine.

# USAGE TUTORIAL
- Place "ng-bst.sh" script into angular project directory;
- Edit "ng-bst.sh" script on line #37 with your data:
```
. . .
#user_name - remote machine username;
#host_name - remote machine hostname (eg. ip address);
#target_path - path to target folder on your remote machine;
scp -r dist/* user_name@host_name:target_path || echo "connection failed";;
. . .
```
- Edit "build"(or create new script) under scripts section in package.json of your Angular project to "bash ng-bst.sh" on Linux or "start ng-bst.sh" on Winodws if you're using git bash terminal;
- Start the script using "npm run-script build" (npm run-script <your_script>)
- Voilà !
