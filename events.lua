
function on.construction()
    resetGame()
end

function on.paint(gc)
    drawCells(gc)
    drawColors(gc)
    drawNumbers(gc)
    if gameOver then
        gc:drawString("GAME OVER!", 125, 15, "middle");
    end
end

function on.backspaceKey()
    if gameOver then
        resetGame()
    end
end

function on.charIn(char)
    if gameOver then return end

    local oldField = field

    if char == '8' then
        handleMove("up")
    end
    if char == '2' then
        handleMove("down")
    end
    if char == '4' then
        handleMove("left")
    end
    if char == '6' then
        handleMove("right")
    end

    if fieldChanged(oldField, field) and areFreeFields(field) then
        field = insertNumber(field)
    end

    platform.window:invalidate()

    if gameLost(field) then
        gameOver = true
        return
    end
end
