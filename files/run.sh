#!/bin/bash
#
# run.sh
#
# Author: Matteo Cerutti <matteo.cerutti@hotmail.co.uk>
#

PUPPETBOARD_LISTEN_IP=${PUPPETBOARD_LISTEN_IP:0.0.0.0}
PUPPETBOARD_LISTEN_PORT=${PUPPETBOARD_LISTEN_PORT:8000}

# drive puppetboard settings
export PUPPETBOARD_PUPPETDB_HOST=${PUPPETBOARD_PUPPETDB_HOST:-puppetdb}
export PUPPETBOARD_PUPPETDB_PORT=${PUPPETBOARD_PUPPETDB_PORT:8080}
export PUPPETBOARD_PUPPETDB_SSL_VERIFY=${PUPPETBOARD_PUPPETDB_SSL_VERIFY:-false}
export PUPPETBOARD_PUPPETDB_KEY=${PUPPETBOARD_PUPPETDB_KEY:-}
export PUPPETBOARD_PUPPETDB_CERT=${PUPPETBOARD_PUPPETDB_CERT:-}
export PUPPETBOARD_PUPPETDB_TIMEOUT=${PUPPETBOARD_PUPPETDB_TIMEOUT:-60}
export PUPPETBOARD_DEFAULT_ENVIRONMENT=${PUPPETBOARD_DEFAULT_ENVIRONMNET:-production}
export PUPPETBOARD_UNRESPONSIVE_HOURS=${PUPPETBOARD_UNRESPONSIVE_HOURS:-3}
export PUPPETBOARD_ENABLE_QUERY=${PUPPETBOARD_ENABLE_QUERY:-true}
export PUPPETBOARD_LOCALISE_TIMESTAMP=${PUPPETBOARD_LOCALISE_TIMESTAMP:-true}
export PUPPETBOARD_LOGLEVEL=${PUPPETBOARD_LOGLEVEL:-info}
export PUPPETBOARD_REPORTS_COUNT=${PUPPETBOARD_REPORTS_COUNT:-10}
export PUPPETBOARD_OFFLINE_MODE=${PUPPETBOARD_OFFLINE_MODE:-false}
export PUPPETBOARD_ENABLE_CATALOG=${PUPPETBOARD_ENABLE_CATALOG:-false}
export PUPPETBOARD_OVERVIEW_FILTER=${PUPPETBOARD_OVERVIEW_FILTER:-}
export PUPPETBOARD_GRAPH_FACTS=${PUPPETBOARD_GRAPH_FACTS:-"architecture clientversion domain lsbcodename lsbdistcodename lsbdistid lsbdistrelease lsbmajdistrelease netmask osfamily puppetversion processorcount"}
export PUPPETBOARD_INVENTORY_FACTS=${PUPPETBOARD_INVENTORY_FACTS:-"[('Hostname','fqdn'),('IP Address','ipaddress'),('OS','lsbdistdescription'),('Architecture','hardwaremodel'),('Kernel Version','kernelrelease'),('Puppet Version','puppetversion')]}"}
export PUPPETBOARD_REFRESH_RATE=${PUPPETBOARD_REFRESH_RATE:-30}

/usr/bin/gunicorn -b $PUPPETBOARD_LISTEN_IP:$PUPPETBOARD_LISTEN_PORT wsgi:application
