# Colorize ls
export CLICOLOR=1

# Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1

# Terraform - plugin cache - Save on file downloads and speed up terraform init
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

# General
export TERM=xterm-256color
export PATH="$HOME/bin:$PATH"

# google-cloud-sdk and vscode
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

# GPG
export GPG_TTY=$(tty)

# CLI tools and libraries that use SSL certificates
export AWS_CA_BUNDLE="$HOME/Library/cert.pem"
export CURL_CA_BUNDLE="$HOME/Library/cert.pem"
export GIT_SSL_CAINFO="$HOME/Library/cert.pem"
export GRPC_DEFAULT_SSL_ROOTS_FILE_PATH="$HOME/Library/cert.pem"
export NODE_EXTRA_CA_CERTS="$HOME/Library/cert.pem"
export REQUESTS_CA_BUNDLE="$HOME/Library/cert.pem"
export SSL_CERT_FILE="$HOME/Library/cert.pem"

# Obsidian
export PATH="$PATH:/Users/si309655/Applications/Obsidian.app/Contents/MacOS"