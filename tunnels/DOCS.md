# Documentation

## Requirements

- Must have a SSH server that can be reached by Home Assistant

## Recomendations

You can replace the need to open ports directly to your Home Assistant instance
by running a service such as [SISH][sish] on a public cloud (such as Digital
Ocean). This can be particularly useful if you host other services on your
network that require the same ports and want to manage your Home Assistant
instance separately.

## How to use

1. Make sure you've met the requirements listed above.
2. Add the Github repo to your Hass.io: <https://github.com/dy1io/hassio-addons>
3. Install the addon
4. Configure the options in the addon (see descriptions for each option below).
5. Add this addon to your `trusted_proxies` list in `configuration.yaml`.

    ```yaml
      http:
        use_x_forwarded_for: true
        trusted_proxies:
        - 127.0.0.1
        - 172.30.32.0/24
        - 172.30.33.0/24
    ```

    **Note**: _If you've modified your Supervisor or Docker network you may_
    _need to update the addresses for your system. See [Home Assistant's documentation][trusted_proxies_docs]_
    _for more info._

6. Start the addon

Example add-on configuration:

```yaml
  server: sish.example.com
  port: 2222
  tunnels:
    - tunnel: home:80:172.30.32.1:8123
  ServerKeepAliveInterval: 3
```

## Options

**Note**: _Remember to restart the add-on when the configuration is changed._

### Option: `server`

FQDN or IP address of your SSH server.

### Option: `port`

Port to use to connect to your SSH server.

### Option: `user`

User to connect to the SSH server.

### Option: `force_new_sshkey`

If enabled, a new RSA key will be generated.

### Option: `tunnels`

A list of tunnels to establish. Currently only remote tunnels (`-R`) are
supported. The purpose of this addon is to allow remote access to Home Assistant
and its services, but you could create a tunnel to anything that the addon can
reach.

To keep communication internal, you can establish tunnles directly to the Home
Assistant Supervisor by using this IP address `172.30.32.1`

**Example**:

- 443:172.30.32.1:8123
- 80:172.30.32.1:80

### Option: `sni_proxy`

Enables the `sni-proxy` option for connections to [SISH][sish]

**Note**:_Its unclear if this will work with multiple tunnels._

### Option: `tcp_alias`

Enables the `tcp-alias` option for connections to [SISH][sish]

**Note**:_Its unclear if this will work with multiple tunnels._

### Option: `ServerKeepAliveInterval`

Sets the `ServerKeepAliveInterval` for the SSH tunnel.

[sish]:https://github.com/antoniomika/sish
[trusted_proxies_docs]: https://www.home-assistant.io/integrations/http#reverse-proxies
