const usb = require('usb');
var async = require('async');

var isLinux  = process.platform === 'linux';
var isDarwin = process.platform === 'darwin';
var isWin    = process.platform === 'win32';

const shell = require('shelljs')

console.log('Run once');
if (isLinux) {
  shell.exec('./devupdate_linux.sh')
}
if (isDarwin) {
  shell.exec('./devupdate_darwin.sh')
}
if (isWin) {
  console.log('OS not supported yet');
}

usb.on('attach', function(device) {
  console.log('USB plugged in');
  if (isLinux) {
    shell.exec('./devupdate_linux.sh')
  }
  if (isDarwin) {
    shell.exec('./devupdate_darwin.sh')
  }
  if (isWin) {
    console.log('OS not supported yet');
  }
});

usb.on('detach', function(device) {
  console.log('USB unplugged');
  if (isLinux) {
    shell.exec('./devupdate_linux.sh')
  }
  if (isDarwin) {
    shell.exec('./devupdate_darwin.sh')
  }
  if (isWin) {
    console.log('OS not supported yet');
  }
});
