echo "Creating unlocked package..."
sfdx force:package:create --name 'AccountManagement' --path force-app --packagetype Unlocked --nonamespace --targetdevhubusername DevHub

echo "Creating a package version..."
sfdx force:package:version:create --package 'AccountManagement' --wait 10 --tag v1.0 --targetdevhubusername DevHub -x --json

echo $(<sfdx-project.json)