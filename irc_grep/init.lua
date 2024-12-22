
local handlers = { }

local function ellipsize(x)
	return (#x>200 and x:sub(1, 200).."…" or x)
end

function handlers.i(pat)
	local t, n = { }, 0
	for k, def in pairs(minetest.registered_items) do
		if k:find(pat) or (def.description and def.description:find(pat)) then
			n = n + 1
			t[n] = k
		end
	end
	return t
end

handlers.item = handlers.i

function handlers.c(pat)
	local t, n = { }, 0
	for k, def in pairs(minetest.chatcommands) do
		if k:find(pat) or (def.description and def.description:find(pat)) then
			n = n + 1
			t[n] = k
		end
	end
	return t
end

handlers.command = handlers.c

function handlers.p(pat)
	local t, n = { }, 0
	for _, p in ipairs(minetest.get_connected_players) do
		local k = p:get_player_name()
		if k:find(pat) then
			n = n + 1
			t[n] = k
		end
	end
	return t
end

handlers.player = handlers.p

irc:register_bot_command("grep", {
	description = "Search for things.",
	params = "{c[ommand]|i[tem]|p[layer]} <pattern>",
	func = function(user, params)
		local what, pat = params:match("^%s*(%S*)%s+(.*)")
		if not what then
			return false, "usage: {c[ommand]|i[tem]|p[layer]} <pattern>"
		end
		local ok, err = pcall(string.find, "", pat)
		if not ok then return false, err end
		local handler = handlers[what]
		if not handlers then
			return false, ellipsize("invalid category: "..what)
		end
		local items = handler(pat)
		return true, ellipsize(table.concat(items, ", "))
	end,
})
