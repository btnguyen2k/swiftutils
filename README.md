SwiftUtils
==========

Utility Library in Swift.

By Thanh Ba Nguyen (btnguyen2k (at) gmail.com).

Project home:
[https://github.com/btnguyen2k/swiftutils](https://github.com/btnguyen2k/swiftutils)


## License ##

See LICENSE.txt for details. Copyright (c) 2016 Thanh Ba Nguyen.

Third party libraries are distributed under their own license(s).


## Release Notes ##

Latest release version: `1.3`. See [RELEASE-NOTES.md](RELEASE-NOTES.md) for details.


DateTimeUtils
-------------

Date & time utility class. See [README-DateTimeUtils.md](README-DateTimeUtils.md).


SnowflakeIdGenerator
--------------------

Swift implementation of Twitter's Snowflake algorithm. See [README-SnowflakeIdGenerator.md](README-SnowflakeIdGenerator.md).


RSAUtils
--------

Utility class to encrypt/decrypt data using RSA public/private key. See [README-RSAUtils.md](README-RSAUtils.md).


SyncUtils
---------

* Synchronizes a code block: *

```swift
let result = synchronizd(lockObj) {
//     .... code here ....
}
```
