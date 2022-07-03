
field = {
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
}

gameOver = false

function on.paint(gc)
    drawCells(gc)
    drawColors(gc)
    drawNumbers(gc)
    if gameOver then
        gc:drawString("YOU LOST!", 130, 15, "middle");
    end
end

