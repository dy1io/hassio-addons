# Documentation

## How to use

1. Add the Github repo to your Hass.io: <https://github.com/ThePicklenat0r/hassio-addons>
2. Install the addon
3. Configure the options in the addon (see descriptions for each option below).
4. Start the addon

**Note**: _If you did not specify a `subdomain` or `hostname` you will need to open the web interface to get your ngrok.io url._

Example add-on configuration:

```yaml
  log_level: info
  auth_token: my-auth-token
  region: us
  tunnels:
    - name: hass
      proto: tls
      addr: 8123
      hostname: home.example.com
    - name: lets-encrypt
      proto: http
      addr: 80
      bind_tls: false
      hostname: home.example.com
```

## Options

**Note**: _Remember to restart the add-on when the configuration is changed._

### Option: `auth_token`

Set your ngrok authentication token. This option is required if using a custom
`subdomain` or `hostname` or for tunnels other than `http`.

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

A json list of tunnels. Use the options defined below to create you tunnels. You
must specify at least the `name`, `proto`, and `addr` for each tunnel. For more
details, see [ngrok's documentation][ngrok_docs_tunnels].

| Option        | Protocol  | Description                                                                                         |
| ------------- | --------- | --------------------------------------------------------------------------------------------------- |
| `name`*       | all       | unique name for the tunnel must only use `a-z` `0-9` `-` or `_`                                     |
| `proto`*      | all       | tunnel protocol name, one of http, tcp, tls                                                         |
| `addr`*       | all       | forward traffic to this local port number or network address                                        |
| `inspect`     | all       | enable http request inspection                                                                      |
| `auth`        | http      | HTTP basic authentication credentials to enforce on tunneled requests                               |
| `host_header` | http      | Rewrite the HTTP Host header to this value, or preserve to leave it unchanged                       |
| `bind_tls`    | http      | bind an HTTPS or HTTP endpoint or both true, false, or both                                         |
| `subdomain`   | http, tls | subdomain name to request. If unspecified, uses the tunnel name                                     |
| `hostname`    | http, tls | hostname to request (requires reserved name and DNS CNAME)                                          |
| `crt`         | tls       | PEM TLS certificate at this path to terminate TLS traffic before forwarding locally                 |
| `key`         | tls       | PEM TLS private key at this path to terminate TLS traffic before forwarding locally                 |
| `client_cas`  | tls       | PEM TLS certificate authority at this path will verify incoming TLS client connection certificates. |
| `remote_addr` | tcp       | bind the remote TCP port on the given address                                                       |
| `metadata`    | all       | arbitrary user-defined metadata that will appear in the ngrok service API when listing tunnels      |

*required

[ngrok_docs_tunnels]: https://ngrok.com/docs#tunnel-definitions