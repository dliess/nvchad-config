require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


vim.api.nvim_set_keymap('n', '<C-Left>', '<C-W>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-W>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-W>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-W>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', ':ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })

function CloseUnmodifiedBuffersExceptActive()
    -- Step 1: Get a list of all buffers that are currently displayed in windows
    local active_buffers = {}
    local windows = vim.api.nvim_list_wins()  -- Get all windows
    for _, win in ipairs(windows) do
        local buf = vim.api.nvim_win_get_buf(win)  -- Get the buffer in this window
        active_buffers[buf] = true  -- Mark this buffer as active (visible in a window)
    end

    -- Step 2: Get a list of all buffers in Neovim
    local all_buffers = vim.api.nvim_list_bufs()

    -- Step 3: Loop through all buffers
    for _, buf in ipairs(all_buffers) do
        local is_modified = vim.api.nvim_get_option_value('modified', { buf = buf })

        -- If the buffer is not in the list of active buffers and is not modified, delete it
        if not active_buffers[buf] and not is_modified then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end

vim.api.nvim_set_keymap('n', '<leader>kb', ':lua CloseUnmodifiedBuffersExceptActive()<CR>', { noremap = true, silent = true })



vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Function to toggle the quickfix list
function close_quickfix_if_open()
    -- Check if the quickfix window is open
    local windows = vim.fn.getwininfo()
    local quickfix_open = false
    for _, win in pairs(windows) do
        if win.quickfix == 1 then
            quickfix_open = true
            break
        end
    end

    -- Toggle the quickfix list based on its current state
    if quickfix_open then
        vim.cmd('cclose')  -- Close the quickfix list
        return true
    end
   return false
end

-- Map F5 to toggle the quickfix list
-- vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua ToggleQuickfix()<CR>', { noremap = true, silent = true })

-- Define a function to execute the build process
function build_and_compile()
    vim.cmd('wa') -- Save all open buffers
    local original_dir = vim.fn.getcwd()
    local handle = io.popen("find . -type d -name build | head -n 1")
    local build_dir = handle:read("*a")
    handle:close()
    build_dir = string.gsub(build_dir, "\n", "") -- Remove newline character from output
    build_dir = build_dir .. "/Debug"

    vim.cmd('!mkdir -p build') -- Create the "build" directory
    vim.cmd('lcd ' .. build_dir)

    vim.cmd('!cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ../.. ') -- Run CMake and build
    vim.cmd('lcd ' .. original_dir)
end


function build_and_compile_without_configure()
    if close_quickfix_if_open() then
      return
    end
    vim.cmd('wa') -- Save all open buffers
    local original_dir = vim.fn.getcwd()
    local handle = io.popen("find . -type d -name build | head -n 1")
    local build_dir = handle:read("*a")
    handle:close()
    build_dir = string.gsub(build_dir, "\n", "") -- Remove newline character from output
    build_dir = build_dir .. "/Debug"

    -- Change directory to the found build directory if it exists
    if build_dir ~= "" then
        vim.cmd('lcd ' .. build_dir)
    else
        print("No 'build' directory found, please create one or check your project structure.")
        return
    end

    -- vim.cmd('compiler gcc') -- Set the compiler to "gcc"
    -- vim.cmd('make -j8') -- Start compilation
    local command = 'make -j8 2>&1 | sed \'s/\\x1b\\[[0-9;]*[mKG]//g\''
    local output = vim.fn.system(command)

    -- Load the output into quickfix window
    vim.fn.setqflist({}, ' ', {title = 'Compilation', lines = vim.split(output, '\n')})
    -- Return to the original directory
    vim.cmd('lcd ' .. original_dir)

    vim.cmd('copen')
end

-- Create a key mapping for F5 to call the build_and_compile function
vim.api.nvim_set_keymap('n', '<F4>', ':lua build_and_compile()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F5>', ':lua build_and_compile_without_configure()<CR>', { noremap = true, silent = true })

--require('leap').add_default_mappings()

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

vim.o.shell = 'zsh'

-- create a mapping to search for word under cursor
vim.api.nvim_set_keymap('n', '<leader>fc', [[:lua require('telescope.builtin').grep_string{ search = vim.fn.expand("<cword>")}<CR>]], { noremap = true, silent = true })

-- Go to the next quickfix entry
vim.keymap.set('n', '<leader>j', '<cmd>cnext<CR>zz', { desc = "Forward qflist" })
vim.keymap.set('n', '<leader>k', '<cmd>cprev<CR>zz', { desc = "Backward qflist" })


-- Go to the previous quickfix entry
--vim.api.nvim_set_keymap('n', '<leader>p', ':cprev<CR>', { noremap = true })

-- Open the quickfix entry under the cursor in a new window
--vim.api.nvim_set_keymap('n', '<leader>o', ':cc<CR>', { noremap = true })

vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

vim.keymap.set('i', 'kj', '<Esc>', { noremap = true })
vim.keymap.set('v', 'kj', '<Esc>', { noremap = true })



-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
