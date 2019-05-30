# CIRCLE_BRANCH is an env variable that refers to the Git branch currently being built
echo "Creating a scratch org"
pwd
ls -l
cd node_modules/sfdx-cli/bin/run
ls -l
sfdx force:org:create -f config/project-scratch-def.json -a ${CIRCLE_BRANCH} -s