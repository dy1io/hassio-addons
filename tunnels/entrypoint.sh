#!/usr/bin/with-contenv bashio

KEYSTORE="/share/tunnels/ssh-keystore"

#Debugging
bashio::log.info "$KEYSTORE/id_rsa"

if [[ $(bashio::fs.file_exists "$KEYSTORE/id_rsa") ]]; then
  bashio::log.info "id_rsa found"
else
  bashio::log.info "id_rsa not found"
fi

if [[ (!$(bashio::fs.file_exists "$KEYSTORE/id_rsa")) ]]; then
  bashio::log.info "id_rsa not found secondary test"
fi

if [[ $(bashio::config.true 'force_new_sshkey') ]]; then
  bashio::log.info "force_new_sshkey enabled"
else
  bashio::log.info "force_new_sshkey disabled"
fi

#Debugging End

bashio::log.debug "Check if a new key needs to be created"
if [[ (!$(bashio::fs.file_exists "$KEYSTORE/id_rsa")) || (!$(bashio::fs.file_exists "$KEYSTORE/id_rsa.pub")) || $(bashio::config.true 'force_new_sshkey') ]]; then
  bashio::log.notice "Generating a new RSA key..."
  mkdir -p $KEYSTORE
  ssh-keygen -q -t rsa -N '' -f $KEYSTORE/id_rsa <<<y >/dev/null 2>&1
fi

bashio::log.info "Display id_rsa.pub:"
cat $KEYSTORE/id_rsa.pub
bashio::log.info "=================================================="
bashio::log.info "Display SSH key hash:"
ssh-keygen -lf $KEYSTORE/id_rsa | awk '{print $2}'

bashio::log.debug "Building options"
declare -a options

options+=(-T)
options+=(-p $(bashio::config 'port'))
options+=(-i "$KEYSTORE/id_rsa")
options+=(-o "StrictHostKeyChecking=no ServerAliveInterval=3 PubkeyAcceptedKeyTypes=ssh-rsa")

for id in $(bashio::config "tunnels|keys"); do
  tunnel=$(bashio::config "tunnels[${id}].tunnel")
  bashio::log.debug "Adding tunnel to request: $tunnel"
  options+=(-R $tunnel)
done

SERVER=$(bashio::config 'server')
if [[ $(bashio::config.has_value 'user') ]]; then
  USER=$(bashio::config 'user')
  options+=($USER@$SERVER)
else
  options+=($SERVER)
fi

bashio::log.debug "Options built"

bashio::log.info "Attempting to establish SSH tunnels with:"
bashio::log.info "ssh ${options[@]}"

ssh ${options[@]}
