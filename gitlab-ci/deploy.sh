#!/bin/sh
ip = $1
ssh -i appuser ubuntu@$ip
echo pwd
