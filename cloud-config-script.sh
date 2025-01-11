#!/bin/bash

wget https://example.com/certificates/ca.crt -O /etc/eventstore/certs/ca/ca.crt
wget https://example.com/certificates/node.key -O /etc/eventstore/certs/node.key
wget https://example.com/certificates/node.crt -O /etc/eventstore/certs/node.crt

sudo chown eventstore:eventstore /etc/eventstore/certs/ca/ca.crt
sudo chown eventstore:eventstore /etc/eventstore/certs/node.crt
sudo chown eventstore:eventstore /etc/eventstore/certs/node.key

sudo cp /etc/eventstore/certs/ca/ca.crt /usr/local/share/ca-certificates/event_store_ca.crt
sudo update-ca-certificates

sudo systemctl start eventstore
sudo ufw allow 2113/tcp
