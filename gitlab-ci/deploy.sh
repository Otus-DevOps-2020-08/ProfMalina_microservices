#!/bin/sh
ip = $1
echo $ip
ssh -i appuser ubuntu@$ip
pwd
whoami
uname -a
echo test
echo test2
