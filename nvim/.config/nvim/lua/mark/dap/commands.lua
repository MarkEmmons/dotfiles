local M = {}

M.get_test_binary = function()

	local cmd = "cargo test --no-run --message-format=JSON"
	local handle = assert(io.popen(cmd))

	local line = handle:read("l")
	while line do

		if string.find(line, '"src_path":".+/src/lib.rs",') and
			not string.find(line, '"executable":null')
		then
			local i, j = string.find(line, '"executable":".+",')
			local executable = string.sub(line, i+14, j-2)

			if handle then
				handle:close()
			end

			return executable
		end
		line = handle:read("l")
	end

	if handle then
		handle:close()
	end

	return nil
end

M.get_nearest_test = function()

	local tree = require("neotest").run.get_tree_from_args({}, true)

	for _, pos in tree:iter() do

		return {'--', '--test', pos.name}
	end

	return {}
end

return M
