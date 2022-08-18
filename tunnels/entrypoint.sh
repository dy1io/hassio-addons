#!/usr/bin/with-contenv bashio

KEYSTORE="/data/ssh-keystore"

tree ${KEYSTORE}

bashio::log.debug "Check if a new key needs to be created"
if [[ ! -f "${KEYSTORE}/tunnels_rsa") ]] || [[ ! -f "$KEYSTORE/tunnels_rsa.pub") ]] || [[ $(bashio::config.true 'force_new_sshkey') ]]; then
  bashio::log.notice "Generating a new RSA key..."
  mkdir -p $KEYSTORE
  ssh-keygen -b 4096 -t rsa -N "" -f ${KEYSTORE}/tunnels_rsa
fi

bashio::log.info "Display tunnels_rsa.pub:"
cat $KEYSTORE/id_rsa.pub
bashio::log.info "=================================================="
bashio::log.info "Display SSH key hash:"
ssh-keygen -lf $KEYSTORE/id_rsa | awk '{print $2}'

bashio::log.debug "Building options"
declare -a options

options+=(-T)
options+=(-p $(bashio::config 'port'))
options+=(-i "$KEYSTORE/tunnels_rsa")
options+=(-o StrictHostKeyChecking=no)
options+=(-o ServerAliveInterval=3)
options+=(-o PubkeyAcceptedKeyTypes=ssh-rsa)

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

exit 0
