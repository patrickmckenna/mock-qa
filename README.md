:warning: **WIP/POC** :warning:


### Use
Set a PR status using this simple web UI. This app:

1. Automatically sets a "pending" status for all new and re-opened PRs.
2. Lets you set the status of a PR to one of the [4 accepted states](https://developer.github.com/v3/repos/statuses/#parameters): `success`, `pending`, `failure`, `error`.


### Setup
Add a webhook that fires at `https://mock-qa.herokuapp.com/hooks` on all Pull Request Events.
