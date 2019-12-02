
# Hass.io ngrok Client

A ngrok client for Hass.io

## About

This add-on creates a ngrok tunnel over http and https. Some ISPs do not allow port forwarding due to port blocking or CG-NAT. If you're able to setup a port forward, do not use this addon.
It is intented to be paired with a proxy, such as [Nginx Proxy Manager](https://github.com/hassio-addons/addon-nginx-proxy-manager).

**Note**: _ngrok could man-in-the-middle your http tunnels if they wanted. Using a TLS tunnel will prevent this because you can control the certificate. To use some features of this add-on, you need a paid ngrok account._

## How to use

1. Install the addon
2. You have 3 options for configuration:
  1. Leave the default configuration and start the addon. 
  2. Configure the options in the addon (see descriptions for each option below).
  3. Create a custom configuration file for ngrok and save it to /share/ngrok-config with the name ngrok.yml. See [ngrok's documentation](https://ngrok.com/docs#config-options) for details on how to create a configuration file.
3. Start the addon

**Note**: _If you did not specify a `subdomain` or `hostname` you will need to open the web interface to get your ngrok.io url._

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```json
{
  "auth_token": "",
  "region": "us",
  "port": 8123,
  "use_tls": false,
  "inspect": false
}
```

### Option: `auth_token`

Set your ngrok authentication token. This option is required if using a custom subdomain or hostname or if you want to use the PORT_443 option.

### Option: `region`

Specifies where the ngrok client will connect to host its tunnels. The following options are available:

**Option** | **Location**
:---:|:---
us | United States
eu | Europe
ap | Asia/Pacific
au | Australia
sa | South America
in | India

### Option: `use_tls`

**Note**: _This option requires you set auth_token and have a paid account_

_true or false_

Choose whether a tls tunnel should be created for port 443 instead of http. Using a tls tunnel avoids certificate errors on custom domains and prevents ngrok from being able to man-in-the-middle your encrypted connection. If using hostname, this is highly recommended.

### Option: `inspect`

_true or false_

Choose whether to allow ngrok to inspect your traffic. Typically this is disabled. This option only applies to http tunnels. For more information on what this does, see [ngrok's documentation](https://ngrok.com/docs#getting-started-inspect).

### Option: `subdomain`

**Note**: _This option requires you set auth_token and have a paid account_

Specifies a custom ngrok.io subdomain to use. Check out [ngrok's documentation](https://ngrok.com/docs#http-subdomain) for more information on this option.

### Option: `hostname`

**Note**: _This option requires you set auth_token and have a paid account_

Specifies a custom domain name to use. The use of wildcard domains is allowed (ex. *.example.com). Check out [ngrok's documentation](https://ngrok.com/docs#http-custom-domains) for more information on this option. This option will always take priority over `subdomain` option.
