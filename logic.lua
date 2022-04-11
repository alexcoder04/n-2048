
function addTwo(f)
    i = math.random(1, 4)
    j = math.random(1, 4)
    while (f[i][j] ~= 0) do
        i = math.random(1, 4)
        j = math.random(1, 4)
    end
    f[i][j] = 1
    return f
end

function moveLeft(f)
    for i=1, 4 do
        for j=1, 4 do
            if f[i][j] == 0 then
                for k=j, 4 do
                    if f[i][k] ~=0 then
                        f[i][j] = f[i][k]
                        f[i][k] = 0
                        break
                    end
                end
            end
        end
    end
    return f
end

function rotateClockwise(f)
    n_f = {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}
    for i=1, 4 do
        for j=1, 4 do
            n_f[j][i] = f[i][j]
        end
    end
    return n_f
end

function mirrorHoriz(f)
    n_f = {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}
    for i=1, 4 do
        for j=1, 4 do
            n_f[i][5-j] = f[i][j]
        end
    end
    return n_f
end

function on.charIn(char)
    if char == '8' then
        field = rotateClockwise(field)
        field = moveLeft(field)
        field = rotateClockwise(field)
        field = rotateClockwise(field)
        field = rotateClockwise(field)
        field = addTwo(field)
        platform.window:invalidate()
        return
    end
    if char == '2' then
        field = rotateClockwise(field)
        field = mirrorHoriz(field)
        field = moveLeft(field)
        field = mirrorHoriz(field)
        field = rotateClockwise(field)
        field = rotateClockwise(field)
        field = rotateClockwise(field)
        field = addTwo(field)
        platform.window:invalidate()
        return
    end
    if char == '4' then
        field = moveLeft(field)
        field = addTwo(field)
        platform.window:invalidate()
        return
    end
    if char == '6' then
        field = mirrorHoriz(field)
        field = moveLeft(field)
        field = mirrorHoriz(field)
        field = addTwo(field)
        platform.window:invalidate()
        return
    end
end

function on.construction()
    field = {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}
    field = addTwo(field)
end

