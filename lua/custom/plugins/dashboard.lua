return {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        header = {
          "██████╗░███████╗░██████╗░░██████╗██╗░░░██╗░██████╗",
          "██╔══██╗██╔════╝██╔════╝░██╔════╝██║░░░██║██╔════╝",
          "██████╔╝█████╗░░██║░░██╗░╚█████╗░██║░░░██║╚█████╗░",
          "██╔═══╝░██╔══╝░░██║░░╚██╗░╚═══██╗██║░░░██║░╚═══██╗",
          "██║░░░░░███████╗╚██████╔╝██████╔╝╚██████╔╝██████╔╝",
          "╚═╝░░░░░╚══════╝░╚═════╝░╚═════╝░░╚═════╝░╚═════╝░"
        },
        project = { enable = false },
        shortcut = {
          { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
        },
      }, -- config
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}