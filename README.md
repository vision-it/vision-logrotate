# vision-logrotate

[![Build Status](https://travis-ci.org/vision-it/vision-logrotate.svg?branch=production)](https://travis-ci.org/vision-it/vision-logrotate)

## Usage

Include in the *Puppetfile*:

```
mod 'vision_logrotate',
    :git => 'https://github.com/vision-it/vision-logrotate.git,
    :ref => 'production'
```

Include in a role/profile:

```puppet
contain ::vision_logrotate
```
