module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA dnaString = helper  dnaString []
    where 
        helper [] acc = Right acc
        helper (x:xs) acc= case x of
            'G' -> helper xs (acc ++ "C") 
            'C' -> helper xs (acc ++ "G")
            'T' -> helper xs (acc ++ "A")
            'A' -> helper xs (acc ++ "U")
            _ -> Left x
