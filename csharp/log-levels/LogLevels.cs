using System;

static class LogLine
{
    public static string Message(string logLine)
    {
        return logLine.Substring(logLine.LastIndexOf(": ") + 2)
	    .Trim();
    }

    public static string LogLevel(string logLine)
    {
	int startIndex = logLine.IndexOf("[");
	int endIndex = logLine.IndexOf("]");
	return logLine.Substring(startIndex + 1, endIndex - startIndex - 1)
	    .ToLower() ;
    }

    public static string Reformat(string logLine)
    {
        return $"{LogLine.Message(logLine)} ({LogLine.LogLevel(logLine)})";
    }
}
