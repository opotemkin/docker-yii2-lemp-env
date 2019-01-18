#!/bin/bash

mysql -u root -proot < /tmp/001_startup.sql
sleep 1
gunzip < /tmp/002_dump_structure.sql.gz | mysql -uroot -proot MYSQL_DATABASE