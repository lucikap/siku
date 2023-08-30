module("luci.controller.shanligong", package.seeall)

function index()
    entry({"admin", "school", "shanligong"}, alias("admin", "school", "shanligong", "post"), _("山理工认证"), 99).index = true
    entry({"admin", "school", "shanligong", "post"}, cbi("shanligong"), _("认证设置"), 1)
    entry({"admin", "school", "shanligong", "log"}, cbi("shanligong_log"), _("认证日志"), 2)
    entry({"admin", "school", "shanligong", "status"}, call("act_status")).leaf = true

end

function act_status()
	local e = {}
	e.running = luci.sys.call("ps | grep shanligong | grep -v grep >/dev/null") == 0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end

