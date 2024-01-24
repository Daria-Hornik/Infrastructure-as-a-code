#!/bin/bash

apt update -y && apt install -y postgresql postgresql-contrib sudo
systemctl enable --now postgresql

sudo -u postgres psql <<END
    CREATE USER sa password 'Vagrant42';
    ALTER USER sa WITH SUPERUSER;
END

sudo -u postgres createdb PlanGenerator2

echo "listen_addresses = '*'" >> /etc/postgresql/13/main/postgresql.conf

echo "
host    all             all              0.0.0.0/0                       md5
host    all             all              ::/0                            md5
" >> /etc/postgresql/13/main/pg_hba.conf

systemctl restart postgresql@13-main