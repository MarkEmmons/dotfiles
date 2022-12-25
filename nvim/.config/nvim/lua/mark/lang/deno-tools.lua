local M = {}

local function handler(err)
  if err then
    error(tostring(err))
  end
  vim.notify("Deno workspace reloaded")
end

function M._reload_workspace_from_cargo_toml()
  local clients = vim.lsp.get_active_clients()

  for _, client in ipairs(clients) do
    if client.name == "denols" then
      vim.notify("Reloading Deno Workspace")
      client.request("denols/reloadWorkspace", nil, handler, 0)
    end
  end
end

function M.reload_workspace()
  vim.notify("Reloading Deno Workspace")
  vim.lsp.buf_request(0, "denols/reloadWorkspace", nil, handler)
end

return M
