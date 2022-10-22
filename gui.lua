
cellWidth = 40
marginLeft = 80
marginTop = 25

colors = {
    {245, 234, 221},
    {245, 230, 205},
    {245, 183, 124},
    {245, 157, 86},
    {15, 130, 98},
    {245, 94, 60},
    {245, 213, 118},
    {245, 211, 101},
    {245, 204, 84},
    {245, 206, 71},
    {245, 200, 49},
    {245, 67, 64},
    {74, 64, 54}
}

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

function drawColors(gc)
    for i=1, 4 do
        for j=1, 4 do
            if field[i][j] ~= 0 then
                gc:setColorRGB(unpack(colors[field[i][j]]))
                gc:fillRect(
                    marginLeft+(j*cellWidth)-cellWidth+1,
                    marginTop+(i*cellWidth)-cellWidth+1,
                    cellWidth-1,
                    cellWidth-1
                )
            end
        end
    end
end

function drawNumbers(gc)
    for i=1, 4 do
        for j=1, 4 do
            if field[i][j] == 1 or field[i][j] == 2 then
                gc:setColorRGB(144, 107, 124)
            else
                gc:setColorRGB(255, 246, 255)
            end
            gc:drawString(
                getStringFromExponent(field[i][j]),
                marginLeft+((j-1)*cellWidth)+(cellWidth/2)-(#getStringFromExponent(field[i][j])*4),
                marginTop+((i-1)*cellWidth)+(cellWidth/2),
                "middle"
            )
        end
    end
end
