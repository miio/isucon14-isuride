#!/bin/bash

rsync -e ssh -avz --delete /home/isucon/webapp/python/* isucon@192.168.12:/home/isucon/webapp/python
rsync -e ssh -avz --delete /home/isucon/webapp/python/* isucon@192.168.13:/home/isucon/webapp/python


rsync -e ssh -avz --delete /home/isucon/webapp/infra-config/* isucon@192.168.12:/home/isucon/webapp/infra-config
rsync -e ssh -avz --delete /home/isucon/webapp/infra-config/* isucon@192.168.13:/home/isucon/webapp/infra-config


ssh isucon@192.168.12 bash -c 'sudo cp -R /home/isucon/webapp/infra-config/nginx/* /etc/nginx'
ssh isucon@192.168.13 bash -c 'sudo cp -R /home/isucon/webapp/infra-config/nginx/* /etc/nginx'

ssh isucon@192.168.12 bash -c 'sudo service nginx restart'
ssh isucon@192.168.13 bash -c 'sudo service nginx restart'

ssh isucon@192.168.12 bash -c 'sudo systemctl disable --now isuride-go.service'
ssh isucon@192.168.13 bash -c 'sudo systemctl disable --now isuride-go.service'

ssh isucon@192.168.12 bash -c 'sudo systemctl enable --now isuride-python.service'
ssh isucon@192.168.13 bash -c 'sudo systemctl enable --now isuride-python.service'
