function love.load()
	player = {
		grid_x = 256,
		grid_y = 288,
		act_x = 256,
		act_y = 288,
		speed = .1
	}
	
	map = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0 },
		{0, 5, 4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 0 },
		{0, 5, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 5, 0 },
		{0, 5, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 5, 0 },
		{0, 5, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 5, 0 },
		{0, 5, 4, 5, 1, 1, 1, 1, 1, 4, 5, 5, 3, 5, 0 },
		{5, 5, 4, 5, 3, 5, 5, 5, 5, 4, 5, 5, 3, 5, 0 },
		{5, 4, 2, 5, 3, 5, 5, 5, 5, 4, 5, 5, 3, 5, 0 },
		{5, 4, 5, 5, 3, 5, 5, 5, 5, 4, 5, 5, 3, 5, 0 },
		{5, 1, 1, 1, 3, 5, 5, 4, 2, 2, 5, 5, 3, 5, 0 },
		{5, 5, 5, 5, 5, 5, 5, 4, 5, 5, 5, 5, 3, 5, 0 },
		{0, 0, 0, 0, 0, 0, 5, 1, 1, 1, 1, 1, 3, 5, 0 },
		{0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 0 },
	}
end

function love.update(dt)
	player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
	player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
    if map[player.grid_y/32][player.grid_x/32] == 1 then
        player.grid_x = player.grid_x + 32
    elseif map[player.grid_y/32][player.grid_x/32] == 2 then
        player.grid_x = player.grid_x - 32
    elseif map[player.grid_y/32][player.grid_x/32] == 3 then
        player.grid_y = player.grid_y - 32
    elseif map[player.grid_y/32][player.grid_x/32] == 4 then
        player.grid_y = player.grid_y + 32
    end
	print (player.grid_x..", "..player.grid_y.."\n")
end

function love.draw()
	love.graphics.rectangle("fill", player.grid_x, player.grid_y, 32, 32)
	for y=1, #map do
		for x=1, #map[y] do
			if map[y][x] == 5 then
				love.graphics.rectangle("line", x * 32, y * 32, 32, 32)
			end
		end
	end
end

function moveRail(x, y)
    if map[y][x] == 1 then
        player.grid_x = player.grid_x + 32
    elseif map[y][x] == 2 then
        player.grid_x = player.grid_x - 32
    elseif map[y][x] == 3 then
        player.grid_y = player.grid_y + 32
    elseif map[y][x] == 4 then
        player.grid_y = player.grid_y - 32
    end
end