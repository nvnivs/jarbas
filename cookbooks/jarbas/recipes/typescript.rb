code_extension = 'ms-vscode.vscode-typescript-next'

jarbas_package 'typescript'
jarbas_package 'yarn'

jarbas_execute "install_vscode_extension[#{code_extension}]" do
    command "code --install-extension #{code_extension}"
    only_if 'which code'
    not_if "code --list-extensions |grep #{code_extension}"
end