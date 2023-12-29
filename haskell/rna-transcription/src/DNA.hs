module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA = mapM mapper
    where 
        mapper char = case char of
            'G' -> return 'C' 
            'C' -> return 'G'
            'T' -> return 'A'
            'A' -> return 'U'
            _ -> Left char
            

    

