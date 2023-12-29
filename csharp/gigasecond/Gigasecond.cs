using System;

public static class Gigasecond
{
    public static DateTime Add(DateTime moment)
    {
        var giga = new TimeSpan(TimeSpan.TicksPerSecond * 1_000_000_000);
        return moment + giga;
    }
}