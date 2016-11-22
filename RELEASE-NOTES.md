SwiftUtils Release Notes
========================

1.3 - 2016-11-22
------------------

- `DateTimeUtils`: add new utility functions
  - `addSeconds(_ date: Date, numSeconds: Int) -> Date`
  - `addMinutes(_ date: Date, numMinutes: Int) -> Date`
  - `addHours  (_ date: Date, numHours  : Int) -> Date`
  - `addDays   (_ date: Date, numDays   : Int) -> Date`
  - `addMonths (_ date: Date, numMonths : Int) -> Date`
  - `addYears  (_ date: Date, numYears  : Int) -> Date`
  - `addWeeks  (_ date: Date, numWeeks  : Int) -> Date`


1.2.1 - 2016-09-18
------------------

- `RSAUtils`: add support for RSA PKCS#1 private key.


1.2.0 - 2016-09-17
------------------

- `RSAUtils`: utility class to encrypt/decrypt data with RSA public/private key.


1.1.1 - 2016-09-16
------------------

- Migrated to Swift3/XCode8.
- `DateTimeUtils`: input/output type changed from `NSDate` to `Date`
- Documents updated.


1.1 - 2016-08-27
----------------

- `DateTimeUtils`: utility functions
  - `startOfSecond(_ date: NSDate) -> NSDate`
  - `startOfMinute(_ date: NSDate) -> NSDate`
  - `startOfHour  (_ date: NSDate) -> NSDate`
  - `startOfDay   (_ date: NSDate) -> NSDate`
  - `startOfMonth (_ date: NSDate) -> NSDate`
  - `startOfYear  (_ date: NSDate) -> NSDate`
  - `startOfWeek  (_ date: NSDate) -> NSDate`


1.0 - 2016-08-15
----------------

First release:
- `SnowflakeIdGenerator`: utility class to generate ID using Twitter's Snowflake algorithm.
- `DateTimeUtils`: some useful datetime utility functions.
