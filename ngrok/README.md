# Hass.io ngrok Client

A ngrok client for Hass.io

## Deprecation Notice

I originally created this addon to solve a problem with my home internet. I've
since moved and my new provider does not suffer from the same issues. Since I
no longer have a personal need and other commitments have taken a priority I no
longer have the time or motivation to continue supporting this addon. This addon
is very simple and just runs the official ngrok client, so as long as the tunnel
options aren't changed by ngrok it should continue to function. You can get the
latest version of the ngrok client simply by rebuilding the addon.

## About

This add-on creates a ngrok tunnel over http and https. It also provides a
RESTful API that can be used to integrate your tunnel status into Home Assistant.
Some ISPs do not allow port forwarding due to port blocking or CG-NAT. If you're
able to setup a port forward, do not use this addon.

**Note**: _ngrok could man-in-the-middle your http tunnels if they wanted.
          Using a TLS tunnel will prevent this because you can control the certificate.
          To use some features of this add-on, you need a paid ngrok account._

[github_link]: https://github.com/dy1io/hassio-ngrok/issues
