const usb = require('usb');
const async = require('async');

const isLinux  = process.platform === 'linux';
const isDarwin = process.platform === 'darwin';
const isWin    = process.platform === 'win32';

const shell = require('shelljs')

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


