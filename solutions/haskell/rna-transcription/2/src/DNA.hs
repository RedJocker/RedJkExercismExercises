module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA dnaString = foldl folderFunc (Right []) dnaString
    where 
        folderFunc (Left acc) _ = Left acc
        folderFunc (Right acc) char = case char of
            'G' -> acumulate "C" 
            'C' -> acumulate "G"
            'T' -> acumulate "A"
            'A' -> acumulate "U"
            _ -> Left char
            where 
                acumulate = return . ((++) acc)

    

