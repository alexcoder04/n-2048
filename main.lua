
field = {
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
}

gameOver = false

function on.paint(gc)
    drawCells(gc)
    drawNumbers(gc)
    if gameOver then
        gc:drawString("YOU LOST", 50, 50, "middle");
    end
end

