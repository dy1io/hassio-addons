
# Hass.io ngrok Client

A ngrok client for Hass.io

## About

This add-on creates a ngrok tunnel over http and https. Some ISPs do not allow
port forwarding due to port blocking or CG-NAT. If you're able to setup a port
forward, do not use this addon.

**Note**: _ngrok could man-in-the-middle your http tunnels if they wanted.
          Using a TLS tunnel will prevent this because you can control the certificate.
          To use some features of this add-on, you need a paid ngrok account._

## How to use

1. Add the Github repo to your Hass.io: <https://github.com/ThePicklenat0r/hassio-addons>
2. Install the addon
3. Configure the options in the addon (see descriptions for each option below).
4. Start the addon

**Note**: _If you did not specify a `subdomain` or `hostname` you will need to open the web interface to get your ngrok.io url._

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```json
{
  "auth_token": "my-auth-token",
  "region": "us",
  "tunnels":
    [
      {
        "proto": "tls",
        "addr": "8123",
        "hostname": "home.example.com"
      }
    ]
}
```

### Option: `auth_token`

Set your ngrok authentication token. This option is required if using a custom
`subdomain` or `hostname` or if you want to use the `use_tls` option.

### Option: `region`

Specifies where the ngrok client will connect to host its tunnels. The following
options are available:

| **Option** | **Location**  |
| :--------: | :------------ |
| us         | United States |
| eu         | Europe        |
| ap         | Asia/Pacific  |
| au         | Australia     |
| sa         | South America |
| in         | India         |

### Option: `tunnels`

Define ngrok tunnels as a JSON list. You must specify a `name` and `definition`
for each tunnel. Please read [ngrok's documentation][ngrok-tunnel-def] for a
description of each available option used in the `definition`. All ngrok tunnel
definition options are available in this addon.

[ngrok-tunnel-def]: https://ngrok.com/docs#tunnel-definitions
