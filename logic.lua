
function resetGame()
    field = {
        {0, 0, 0, 0},
        {0, 0, 0, 0},
        {0, 0, 0, 0},
        {0, 0, 0, 0}
    }
    gameOver = false
    field = insertNumber(field)
    platform.window:invalidate()
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
            if(grid[row][cell] == grid[row][cell+1]) then
                return false
            end
        end
    end
    grid = rotateClockwise(grid)
    for row = 1, 4 do
        for cell = 1, 3 do
            if(grid[row][cell] == grid[row][cell+1]) then
                return false
            end
        end
    end
    return true
end

function insertNumber(f)
    local i = math.random(1, 4)
    local j = math.random(1, 4)
    while (f[i][j] ~= 0) do
        i = math.random(1, 4)
        j = math.random(1, 4)
    end
    f[i][j] = math.random(1, 2)
    return f
end

-- left
function move(f)
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

-- left
function merge(grid)
    local new = grid
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

function rotateClockwise(f)
    local new = {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}
    for i=1, 4 do
        for j=1, 4 do
            new[j][i] = f[i][j]
        end
    end
    return new
end

function mirrorHoriz(f)
    local new = {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}
    for i=1, 4 do
        for j=1, 4 do
            new[i][5-j] = f[i][j]
        end
    end
    return new
end

function fieldChanged(old, new)
    for i=1, 4 do
        for j=1, 4 do
            if old[i][j] ~= new[i][j] then
                return true
            end
        end
    end
    return false
end

function handleMove(dir)
    if dir == "up" then
        field = rotateClockwise(field)
        field = move(field)
        field = merge(field)
        field = move(field)
        field = rotateClockwise(field)
        field = rotateClockwise(field)
        field = rotateClockwise(field)
    end

    if dir == "down" then
        field = rotateClockwise(field)
        field = mirrorHoriz(field)
        field = move(field)
        field = merge(field)
        field = move(field)
        field = mirrorHoriz(field)
        field = rotateClockwise(field)
        field = rotateClockwise(field)
        field = rotateClockwise(field)
    end

    if dir == "left" then
        field = move(field)
        field = merge(field)
        field = move(field)
    end

    if dir == "right" then
        field = mirrorHoriz(field)
        field = move(field)
        field = merge(field)
        field = move(field)
        field = mirrorHoriz(field)
    end
end
