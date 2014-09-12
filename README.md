# grunt-heroku

Heroku commands for Grunt

## Getting Started

This plugin has been tested with Grunt `~0.4.0`. It may work with `~0.3.0`, but it has not been tested.

## The `herokurun` Task

Run a command on Heroku.

#### Run Options

* `cmd`: The command to run on Heroku
* `args`: The arguments to pass to `cmd` (optional)

```js
grunt.initConfig({
  herokurun: {
    your_target: {
      cmd: 'command',
      args: ['arg1', 'arg2']
    }
  }
});
```

## The `herokudeploy` Task

Use `git` to deploy your app to Heroku.

#### Deploy Options

* `remote`: The remote to push to. (optional, default: `heroku`)
* `branch`: Which branch to push. (optional, defualt: `master`)

```js
grunt.initConfig({
  herokurun: {
    staging: {
      remote: 'staging',
      branch: 'master
    },
    production: {}
  }
});
```
