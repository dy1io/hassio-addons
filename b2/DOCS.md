# Documentation

## How to use

1. Add the Github repo to your Home Assistant: <https://github.com/dy1io/hassio-addons>
2. Install the addon
3. Create a BackBlaze B2 bucket and API Key
4. Add the `applicationKeyId`, `applicationKey`, and `bucket` to the configuration 
5. Optionally set `keep_days` to your liking.
6. Start the addon

Example add-on configuration:

```yaml
  log_level: info
  applicationKeyId: "your-application-keyid"
  applicationKey: "!secret application-key-secret"
  bucket: "home-assistant-backup"
  keep_days: 7
```

## Options

**Note**: _Remember to restart the add-on when the configuration is changed._

### Option: `applicationKeyId`

The applicationKeyId provided by BackBlaze

### Option: `applicationKey`

The applicationKey provied by BackBlaze. Supports secrets.

### Option: `bucket`

The B2 bucket to store backups in. The applicationKey must have permissions to
read and write.

### Option: `keep_days`

The number of days to keep a backup in BackBlaze after deleting it locally.
Setting this to `null` will delete backups immediately after they're removed
locally.

### Option: `allowEmptySource`

Allow empty directories to sync.

**Caution**: _Setting this to `true` could delete all of your backups._

### Options: `delay`

How long to wait between syncs (in seconds). Setting this number too low could
cause excessive class C transactions and increase your B2 bill.

## Restore from B2

To restore a backup from BackBlaze, you must log into BackBlaze and recover the
file manually from the bucket. You can then save this file to your `/backup`
folder or use it at the initial setup screen to restore your system. In the
future this experience might be improved upon.