module LogLevels

let message (logLine: string): string =
    logLine.Split(' ', 2,
                  System.StringSplitOptions.TrimEntries)[1]
    
let logLevel(logLine: string): string =
    logLine.Split(' ', 2)[0]
    |> fun log -> log.Trim('[', ']', ':')
    |> fun log -> log.ToLower()

let reformat(logLine: string): string =
    (message logLine, logLevel logLine)
    ||> fun msg log -> $"{msg} ({log})"
