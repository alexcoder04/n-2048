
cellWidth = 40
marginLeft = 80
marginTop = 25

function drawCells(gc)
    gc:drawLine(marginLeft, marginTop, marginLeft, marginTop+(cellWidth*4))
    for i=1, 4 do
        gc:drawLine(
            marginLeft+(cellWidth*i),
            marginTop,
            marginLeft+(cellWidth*i),
            marginTop+(cellWidth*4)
        )
    end

    gc:drawLine(marginLeft, marginTop, marginLeft+(cellWidth*4), marginTop)
    for i=1, 4 do
        gc:drawLine(
            marginLeft,
            marginTop+(cellWidth*i),
            marginLeft+(cellWidth*4),
            marginTop+(cellWidth*i)
        )
    end
end

function getStringFromExponent(exponent)
    if exponent == 0 then
        return ""
    end
    return tostring(2^exponent)
end

function drawNumbers(gc)
    for i=1, 4 do
        for j=1, 4 do
            gc:drawString(
                getStringFromExponent(field[i][j]),
                marginLeft+((j-1)*cellWidth)+(cellWidth/2)-(#getStringFromExponent(field[i][j])*4),
                marginTop+((i-1)*cellWidth)+(cellWidth/2),
                "middle"
            )
        end
    end
end

