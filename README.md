# DevStatic

This is an attempt to create static name of USB serial device to which port it is physically attached. Linux /dev/ttyUSBx gives users device indexing in the order of which device plugged in first. When the machine reboots, who knows which index correlates to which USB serial device? On the other hand, macOS naming scheme is based on device serial number xxxxx, for example: /dev/tty.usbserial-xxxxx. When machine reboots, no problem. When USB serial device has moved from one physical port to another, no problem. It is great for applications requiring to find the same device, but it is too limiting for applications that is serial-number agnostic. 

# Who DevStatic is For

Anyone working with, but not limited to, Arduino or Raspberry Pi projects, who wants static naming of USB serial device. For example, on a 4-port USB hub, the left most port is always with index 1 and the right most one has index 4. Any USB serial device attached to port 1 will get `ttyUSB1`, a fixed name based on the physical port numbering.

# What DevStatic is Not For

DevStatic is not a replacement of udev or any USB serial device drivers out there. It merely creates symbolic links with static naming on user space. By default, the static naming used is `ttyUSBx`, adopted from Linux for convenience. It does not modify the built-in character devices on Operating System level. The naming can be modified to your liking in the bash or shell scripts, for example `ttyMyOwnSerialPort-xxx`.

## Supported OS

Currently it supports Linux, macOS, and Raspbian.

## Supported USB Serial

* FTDI FT232R
* FTDI FT230X
* and more, based on request

## Getting Started

### Prerequisites

Node JS and PM2

There are many ways to install Node JS and PM2 on your platform. Please look at the respective links to do so:
* [Node JS](https://nodejs.org/) - JavaScript runtime built on Chrome's V8 JavaScript engine
* [PM2](https://pm2.io/) - Process manager to run NodeJS applications as system services

### Installing

Download or clone this repository to any location. Cloning instruction is as follows:

```
git clone https://github.com/ekawahyu/devstatic
```

Change into devstatic directory and install all dependencies:

```
npm install
```

You are done!

## Deployment

### In Application

You can take `server.js` as your application starting point and expand it from there. Running `npm start` will start your application and DevStatic with it.

### On Demand

Run DevStatic by executing `npm start` in terminal, and press `CTRL-C` to stop it when you are done with it. When DevStatic is running, the list of available USB serial devices can be found in `./dev` location.

### Running as System Service

Install PM2 process manager for Node JS:
```
npm install -g pm2
```

In case of permission error encountered, you can try:
```
npm install -g --unsafe-perm pm2
```

Start, save, and automatically run when system boots:
```
pm2 start server.js
pm2 save
pm2 startup
```

The `pm2 startup` above will list instruction depending on the machine and Operating System installed. Follow the given instruction and then reboot the machine.

## Contributing

Please do pull-request when you have made modification worth sharing, like making it to work on Windows.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/ekawahyu/devstatic/tags).

## Authors

* **Ekawahyu Susilo** - *Initial work* - [Eka](https://github.com/ekawahyu)

See also the list of [contributors](https://github.com/ekawahyu/devstatic/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

We appreciate your opinion, either users or coders. When you made substantial contribution on this project, your name will show up here.

