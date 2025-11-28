require("obsidian").setup({
  legacy_commands = false,
  workspaces = {
    {
      name = "Notes",
      path = "~/Notes",  -- Adjust to your vault path
    },
  },

  -- Required for completion and search functionality
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },

  -- Optional: Daily notes configuration
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

  -- Optional: Note ID format
  note_id_func = function(title)
    if title ~= nil then
      return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      return tostring(os.time())
    end
  end,

  use_os_file_watchers = true,
})
