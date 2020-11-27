#!/bin/sh
deploy_ip = $1
echo $deploy_ip
ssh ubuntu@$deploy_ip
pwd
whoami
uname -a
echo test
echo test2
