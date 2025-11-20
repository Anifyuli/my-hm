# Ensure $HOME/.local/bin is in PATH
if not contains -- $HOME/.local/bin $PATH
    set -gx PATH $HOME/.local/bin $HOME/bin $PATH
end

# Android SDK configuration
set -gx ANDROID_HOME $HOME/.android/sdk
set -gx ANDROID_AVD_HOME $HOME/.android/avd
set -gx ANDROID_SDK_ROOT $ANDROID_HOME
set -gx PATH $PATH \
    $ANDROID_HOME/cmdline-tools/latest/bin \
    $ANDROID_HOME/emulator \
    $ANDROID_HOME/platform-tools

# pnpm configuration
set -gx PNPM_HOME $HOME/.local/share/pnpm
if not contains -- $PNPM_HOME $PATH
    set -gx PATH $PNPM_HOME $PATH
end
