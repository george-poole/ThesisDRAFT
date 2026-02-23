OPT=${1:-"preview"}
THESIS_DIR="./thesis"
THESIS_PDF="Thesis-Title"

if [[ "$OPT" == "preview" ]]; then
    quarto preview $THESIS_DIR
elif [[ "$OPT" == "render" ]]; then
    quarto render $THESIS_DIR
elif [[ "$OPT" == "html" ]]; then
    quarto render --to html $THESIS_DIR
elif [[ "$OPT" == "pdf" ]]; then
    quarto render --to pdf $THESIS_DIR
else
    echo "Invalid option ${OPT}"
fi

if [[ "$OPT" != "preview" ]]; then
    pdf=$(find "$THESIS_DIR/_book" -type f -iname "*.pdf")
    echo "Copying $pdf"
    cp $pdf thesis.pdf
    echo "Writing alias to index.html"
    ln -sf "$THESIS_DIR/_book/index.html" alias.html
fi