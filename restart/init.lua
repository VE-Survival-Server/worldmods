
core.register_chatcommand("restart", {
    params = "";
    description = "Restart game.";
    privs = { privs=true; };
    func = function ( name, param )
	os.execute(core.get_modpath("restart").."/restart &")
         core.request_shutdown()
    end;
});
