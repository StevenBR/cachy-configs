source /usr/share/cachyos-zsh-config/cachyos-config.zsh
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

##### my customizations
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# export PATH=$HOME/.config/rofi/scripts:$PATH

export XDG_CONFIG="$HOME/.config"
export XDG_DATA="$HOME/.local/share"


# postgresql setup
# When uninstalling, some dead symlinks are left behind so you may want to run:
# brew cleanup --prune-prefix
export PATH="/home/linuxbrew/.linuxbrew/opt/postgresql@17/bin:$PATH"
export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/postgresql@17/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/postgresql@17/include"

##ruby gem location
# export GEM_HOME=/home/linuxbrew/.linuxbrew/lib/ruby/gems/3.4.0/bin
# export GEM_PATH=/home/linuxbrew/.linuxbrew/lib/ruby/gems/3.4.0/bin
# export PATH="$PATH:$GEM_HOME"

alias vim='nvim'
alias vi='nvim'
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

## default gdk to wayland 
export GDK_BACKEND=wayland
# use podman instead of docker
# alias docker=podman

## wezterm cursor fix
# export ZVM_CURSOR_STYLE_ENABLED=false
function zvm_config() {
    ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
    ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
}
source /home/linuxbrew/.linuxbrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# export SSH_AUTH_SOCK=~/.1password/agent.sock

# export USE_LAYER_SHELL=1

### to get proton to use proton-cachy
export PROTON_ENABLE_WAYLAND=1 

# export GST_PLUGIN_PATH=~/.local/lib64/gstreamer-1.0/:$GST_PLUGIN_PATH
# export LV2_PATH=$HOME/.lv2:/usr/lib64/lv2:/usr/lib/lv2
# export GST_PLUGIN_PATH=$HOME/.local/lib/gstreamer-1.0:$GST_PLUGIN_PATH

# SSH_AUTH_SOCK= curl https://codecrafters.io/install.sh | sh

eval "$(starship init zsh)"
# |--------------------------|
# |end of my customizations  |
# |--------------------------|


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
eval "$(/home/mrrodbot/.local/bin/mise activate zsh)"


. "$HOME/.local/share/../bin/env"
