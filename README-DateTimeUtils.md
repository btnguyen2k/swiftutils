DateTimeUtils
=============

Datetime utility class.


Functions
---------

- `static currentUnixTimestampMillisec() -> UInt64`: get current UNIX timestamp in milliseconds.
- `static currentUnixTimestampSecond() -> UInt64`: get current UNIX timestamp in seconds.
- `static waitTillNextMillisec(currentMillisec: UInt64) -> UInt64`: wait until clock moves to the next millisecond (return the "next" millisecond).
- `static waitTillNextSecond(currentSecond: UInt64) -> UInt64`: wait until clock moves to the next second (return the "next" second).
- `static startOfSecond(date: Date) -> Date`: reset to start of the second of a Date (nanosecond is set to 0).
- `static startOfMinute(date: Date) -> Date`: reset to start of the minute of a Date (second and nanosecond are set to 0s)
- `static startOfHour(date: Date) -> Date`  : reset to start of the hour of a Date (minute, second and nanosecond are set to 0s).
- `static startOfDay(date: Date) -> Date`   : reset to start of the day of a Date (hour, minute, second and nanosecond are set to 0s).
- `static startOfDate(date: Date) -> Date`  : alias of `startOfDay`
- `static startOfMonth(date: Date) -> Date` : reset to start of the month of a Date (day is set to 1; hour, minute, second and nanosecond are set to 0s).
- `static startOfYear(date: Date) -> Date`  : reset to start of the year of a Date (month and day are set to 1s; hour, minute, second and nanosecond are set to 0s).
- `static startOfWeek(date: Date) -> Date`  : reset to start of the week of a Date (day is set to `first week day`; hour, minute, second and nanosecond are set to 0s).
- `static addSeconds(date: Date, numSeconds: Int) -> Date`: add n seconds to a Date.
- `static addMinutes(date: Date, numMinutes: Int) -> Date`: add n minutes to a Date.
- `static addHours(date: Date, numHours: Int) -> Date`    : add n hours to a Date.
- `static addDays(date: Date, numDays: Int) -> Date`      : add n days to a Date.
- `static addMonths(date: Date, numMonths: Int) -> Date`  : add n months to a Date.
- `static addYears(date: Date, numYears: Int) -> Date`    : add n years to a Date.
- `static addWeeks(date: Date, numWeeks: Int) -> Date`    : add n weeks to a Date (1 week = 7 days).


Changes
-------

- Since v1.3   - 2016-11-22: add functions `addXxx(...)`.
- Since v1.1.1 - 2016-09-16: input/output type changed from `NSDate` to `Date`.
- Since v1.1   - 2016-08-27: added functions `startOfXxx(...)`.
- Since v1.0   - 2016-08-15: first release.
