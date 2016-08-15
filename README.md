## Description

bash-ddclient is a simple script that fetches your current IP address via a web API, checks if it has changed, and if it has changed then send the new IP address to the dyndns2 compatible server.

## Configuration

Create a `provider-config.sh` file for your provider (No-IP, dyndns...) or use an existing provider configuration file (like `ovh-config.sh`) and change the `username`, `password` and `hostname` parameters.

Ensure that the `provider` parameter in `bash-ddclient.sh` is set to the provider you created / configured (example: `ovh`)

## Usage

You can call the script directly with: `./bash-ddclient.sh`

Or you can setup a Cron job to automate the whole process. For example, to run the script every hour, adding the following line to your crontab should do the trick:

`0 * * * * /path/to/bash-ddclient.sh >/dev/null 2>&1`

The best bit is that root is not required !

## Contributing

Feel free to report any bugs, problems or ideas as a new issue. If you have improvements (new provider specific config files for example) that could benefit other users, then send in a pull request.
