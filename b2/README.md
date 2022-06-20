# Home Assistant B2 Backup

Backup your Home Assistant to BackBlaze B2

## About

Store your Home Assistant backups in BackBlaze B2 Storage! BackBlaze B2 is an
affordable cloud storage solution. Off-site backups are an important component
to any backup strategy.

### Features

Currently, this addon only syncs your `/backup` folder to a specified bucket on
B2. In the future I plan to expand this functionality to be a fully featured
backup management for Home Assistant solution built on B2 cloud storage.

### Future plans

Here are a few of the features I plan to add. Any contributions are appreciated.

#### Coming soon(tm)

- Allow for a backup schedule to be specified by the user in cron format
  - Backups will be taken via the Supervisor API
  - Backup names will contain userful information like backup type and timestamp
- Retention Policies (Local & ~~Cloud~~)
- User-specified password
- ~~Improved secrets handling~~
- Improved documentation
- Add more information about BackBlaze B2, including a guide.

#### Longer term

- Allow for partial backups
  - User-specified parameters for backups
- Differentiate between auto & manual backups
- Add file prefixes to support multiple Home Assistant instances.

#### Very long term

- Present configuration in a webui
- Allow for restores from cloud or local from the UI