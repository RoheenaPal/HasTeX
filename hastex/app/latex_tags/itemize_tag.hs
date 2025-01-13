import Text.Regex.Posix
import Data.Maybe (listToMaybe)

data LaTeXToken = LaTeXToken { tokenType :: String, content :: [String] }

instance Show LaTeXToken where
    show (LaTeXToken "Itemize" items) =
        "\\begin{itemize}\n" ++ unlines (map ("\\item " ++) items) ++ "\\end{itemize}"
    show _ = ""

parseLaTeX :: String -> Maybe LaTeXToken
parseLaTeX inputText =
    let itemizePattern = "\\\\begin\\{itemize\\}(.*?)\\\\end\\{itemize\\}" :: String
        itemPattern = "\\\\item\\s+(.*)" :: String
        itemizeMatches = inputText =~ itemizePattern :: [[String]]
        itemizeContent = listToMaybe $ map (!! 1) itemizeMatches
    in case itemizeContent of
        Just content ->
            let items = map (!! 1) (content =~ itemPattern :: [[String]])
            in Just $ LaTeXToken "Itemize" items
        Nothing -> Nothing

main :: IO ()
main = do
    inputText <- readFile "itemize_tag.tex"
    case parseLaTeX inputText of
        Just result -> print (content result)  -- Print the items only
        Nothing -> putStrLn "No itemize token found."

