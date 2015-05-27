
/*
grunt-heroku
https://github.com/tghw/grunt-heroku

Copyriught (c) 2014 Tyler G. Hicks-Wright
Licensed under MIT license.
 */
module.exports = function(grunt) {
  grunt.registerMultiTask('hdeploy', 'Deploy the specified branch to the specified environment of Heroku.', function() {
    var branch, next, remote;
    next = this.async();
    remote = this.data.remote || 'heroku';
    branch = this.data.branch || 'master';
    grunt.log.writeln("Pushing branch '" + branch + "' to '" + remote + "'...");
    return grunt.util.spawn({
      cmd: 'git',
      grunt: false,
      args: ['push', remote, branch],
      opts: {
        stdio: 'inherit'
      }
    }, function(error, result, code) {
      if (code === 0) {
        grunt.log.writeln(result.stdout);
        return next();
      } else {
        grunt.log.errorlns(error);
        grunt.log.errorlns(result.stderr);
        return next(false);
      }
    });
  });
  grunt.registerMultiTask('hrun', 'Run a command on Heroku.', function() {
    var args, next;
    next = this.async();
    if (this.data.cmd == null) {
      grunt.log.error('cmd is required');
      return next();
    }
    args = ['run', this.data.cmd].concat(this.data.args || []);
    return grunt.util.spawn({
      cmd: 'heroku',
      grunt: false,
      args: args,
      opts: {
        stdio: 'inherit'
      }
    }, function(error, result, code) {
      if (code === 0) {
        grunt.log.writeln(result.stdout);
      } else {
        grunt.log.errorlns(error);
        grunt.log.errorlns(result.stderr);
      }
      return next();
    });
  });
};
