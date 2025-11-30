require("obsidian").setup({
  legacy_commands = false,
  workspaces = {
    {
      name = "Notes",
      path = "~/Notes",  -- Adjust to your vault path
    },
  },

  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },

  daily_notes = {
    folder = "Daily",
    date_format = "%Y-%m-%d"
  },

  -- Optional: Templates
  templates = {
    subdir = "Templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
  },

  note_id_func = function(title)
    if title ~= nil then
      return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      return tostring(os.time())
    end
  end,

  use_os_file_watchers = true,
  preferred_link_style = "markdown"
})
