vim.cmd [[ syntax on ]]

local user_dir = '/Users/nikpolik'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = user_dir .. '/dev/jdtls-cache/workspace-root/' .. project_name
local jdtls_folder = user_dir .. '/dev/jdt-language-server-1.10.0-202203040350'

local config = {
  cmd = {
    'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    '-jar', jdtls_folder .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    '-configuration', jdtls_folder .. '/config_mac',
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- See `data directory configuration` section in the README
    '-data', workspace_dir
  },
}    


-- java \
--     -Declipse.application=org.eclipse.jdt.ls.core.id1 \
--     -Dosgi.bundles.defaultStartLevel=4 \
--     -Declipse.product=org.eclipse.jdt.ls.core.product \
--     -Dlog.protocol=true \
--     -Dlog.level=ALL \
--     -Xms1g \
--     --add-modules=ALL-SYSTEM \
--     --add-opens java.base/java.util=ALL-UNNAMED \
--     --add-opens java.base/java.lang=ALL-UNNAMED \
--     -jar /Users/nikpolik/dev/jdt-language-server-1.10.0-202203040350/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar \
--     -configuration /Users/nikpolik/dev/jdt-language-server-1.10.0-202203040350/config_mac \
--     -data /Users/nikpolik/dev/jdtls-cache/workspace-root/test/ 


require('jdtls').start_or_attach(config)
