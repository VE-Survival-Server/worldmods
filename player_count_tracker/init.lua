local prefix = "Number of Players: "
print(prefix.."0")

minetest.register_on_joinplayer(function()
        minetest.after(1,function(prefix)
		print(prefix..#minetest.get_connected_players())
        end, prefix)
end)

minetest.register_on_leaveplayer(function()
        minetest.after(1,function(prefix)
		print(prefix..#minetest.get_connected_players())
        end, prefix)
end)

minetest.register_on_shutdown(function()
	print(prefix.."0")
end)
