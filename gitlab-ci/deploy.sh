#!/bin/sh
ip = $1
echo $1
ssh -i appuser ubuntu@$ip
pwd
whoami
uname -a
echo test
echo test2
