
function insertNumber(f)
    i = math.random(1, 4)
    j = math.random(1, 4)
    while (f[i][j] ~= 0) do
        i = math.random(1, 4)
        j = math.random(1, 4)
    end
    f[i][j] = math.random(1, 2)
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

function mergeLeft(grid)
    new = grid
    for row = 1, 4 do
        for cell = 1, 3 do
            if(grid[row][cell] == new[row][cell+1] and grid[row][cell] ~= 0) then
                new[row][cell] = new[row][cell] + 1
                new[row][cell+1] = 0
            end
        end
    end
    return grid
end

function areFreeFields(grid)
    for row = 1, 4 do
        for col = 1, 4 do
            if grid[row][col] == 0 then
                return true
            end
        end
    end
    return false
end

function gameLost(grid)
    if areFreeFields(grid) then return false end
    for row = 1, 4 do
        for cell = 1, 3 do
            if(grid[row][cell] == new[row][cell+1] and grid[row][cell] ~= 0) then
                return false
            end
        end
    end
    grid = rotateClockwise(grid)
    for row = 1, 4 do
        for cell = 1, 3 do
            if(grid[row][cell] == new[row][cell+1] and grid[row][cell] ~= 0) then
                return false
            end
        end
    end
    return true
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
    if gameOver then return end
    if char == '8' then
        field = rotateClockwise(field)
        field = moveLeft(field)
        field = mergeLeft(field)
        field = moveLeft(field)
        field = rotateClockwise(field)
        field = rotateClockwise(field)
        field = rotateClockwise(field)
        if gameLost(field) then
            gameOver = true
            platform.window:invalidate()
            return
        end
        if areFreeFields(field) then
            field = insertNumber(field)
        end
        platform.window:invalidate()
    end
    if char == '2' then
        field = rotateClockwise(field)
        field = mirrorHoriz(field)
        field = moveLeft(field)
        field = mergeLeft(field)
        field = moveLeft(field)
        field = mirrorHoriz(field)
        field = rotateClockwise(field)
        field = rotateClockwise(field)
        field = rotateClockwise(field)
        if gameLost(field) then
            gameOver = true
            platform.window:invalidate()
            return
        end
        if areFreeFields(field) then
            field = insertNumber(field)
        end
        platform.window:invalidate()
    end
    if char == '4' then
        field = moveLeft(field)
        field = mergeLeft(field)
        field = moveLeft(field)
        if gameLost(field) then
            gameOver = true
            platform.window:invalidate()
            return
        end
        if areFreeFields(field) then
            field = insertNumber(field)
        end
        platform.window:invalidate()
    end
    if char == '6' then
        field = mirrorHoriz(field)
        field = moveLeft(field)
        field = mergeLeft(field)
        field = moveLeft(field)
        field = mirrorHoriz(field)
        if gameLost(field) then
            gameOver = true
            platform.window:invalidate()
            return
        end
        if areFreeFields(field) then
            field = insertNumber(field)
        end
        platform.window:invalidate()
    end
end

function on.construction()
    field = {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}
    field = insertNumber(field)
end

