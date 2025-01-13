import Graphics.PDF
import qualified Data.Text as T

-- Function to add text to the PDF at a specific position
addText :: T.Text -> Double -> Double -> PDF ()
addText text x y = do
    setFont (PDFFont Helvetica 12)  -- Set the font to Helvetica with size 12
    translate (x, y)                -- Move to the specified position (x, y)
    drawText text                   -- Draw the text at the specified position

-- Function to generate the PDF from a string
generatePDF :: String -> FilePath -> IO ()
generatePDF text outputFile = do
    runPdf outputFile (standardDocInfo "My Document" "Author") $ do
        addPage Nothing              -- Add a page to the document
        addText (T.pack text) 100 750 -- Add text at position (100, 750)

-- Entry point of the program
main :: IO ()
main = do
    let text = "Hello, this is a PDF generated from Haskell!"
    let outputFilename = "output.pdf"
    generatePDF text outputFilename
    putStrLn "PDF generated successfully!"

