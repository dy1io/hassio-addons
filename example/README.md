# Example Hass.io Add-on

Example Hass.io add-on

## About

This is an example add-on for Hass.io based on Hassio Community Add-ons' [Example add-on][community-example]. This also serves as a template for future addons.

It shows off several features and structures like:

- Full blown GitHub repository.
- General Dockerfile structure and setup.
- The use of the config.json and build.json files.
- General shell scripting structure (run.sh).
- Continuous integration and deployment using GitHub Actions.

## How to use

1. Add the Github repo to your Hass.io: <https://github.com/ThePicklenat0r/hassio-addons>
2. Install the addon
3. Configure the options in the addon (see descriptions for each option below).
4. Start the addon

### Use as a template

This repository can be used as a template for building new add-ons.

1. Copy the template to a new repository
2. Update the add-on folder in the repository.
3. Update the `slug` in `config.json`
4. Update the `addon` env variable in `.github/workflows/deploy-addon.yml`
5. Make changes in the `Dockerfile` and `rootfs` as necessary for the new addon.
6. Update README.md with new documentation.
7. Create the following secrets in the new repository:

  | Secret      | Description                                 |
  | :---------- | :------------------------------------------ |
  | dockerToken | Authentication token for dockerUser         |
  | repoToken   | GitHub public access token for gitUserEmail |

**NOTE:** _The `slug`, `addon` env variable, and add-on folder must all match or the build will fail._

## Configuration

Even though this add-on is just an example add-on, it does come with some
configuration options to play around with.

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```json
{
  "log_level": "info",
  "seconds_between_quotes": 5
}
```

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`:  Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `seconds_between_quotes`

Sets the number of seconds between the output of each quote. The value
must be between `1` and `120` seconds. This value is set to `5` seconds by
default.



[community-example]: https://github.com/hassio-addons/addon-example
