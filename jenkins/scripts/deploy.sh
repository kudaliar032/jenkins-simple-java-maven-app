#!/usr/bin/env bash

echo 'The following complex command extracts the value of the <name/> element'
echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
set -x
NAME=`grep -oPm1 "(?<=<name>)[^<]+" pom.xml`
set +x

echo 'The following complex command behaves similarly to the previous one but'
echo 'extracts the value of the <version/> element within <project/> instead.'
set -x
VERSION=`grep -oPm1 "(?<=<version>)[^<]+" pom.xml`
set +x

echo 'The following command upload java jar build asset to server'
set -x
scp -i $JENKINS_HOME/privateKey/aws target/${NAME}-${VERSION}.jar ec2-user@54.169.29.224:/home/ec2-user/app/my-app.jar
set +x

echo 'The following command run java jar on server'
set -x
ssh -i $JENKINS_HOME/privateKey/aws ec2-user@54.169.29.224 "java -jar /home/ec2-user/app/my-app.jar"
