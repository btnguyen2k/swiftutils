SwiftUtils Release Notes
========================

1.1.1 - 2016-09-16
------------------

- Migrated to Swift3/XCode8.
- `DateTimeUtils`: input/output type changed from `NSDate` to `Date`
- Documents updated.


1.1 - 2016-08-27
----------------

- `DateTimeUtils`: utility methods
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
