#!/usr/bin/env bash

# Use bat for text previews with Gruvbox theme
bat() {
    command bat --color=always --style=plain --theme="gruvbox-dark" "$@"
}

handle_text() {
    case "$1" in
        *.md|*.mkd|*.rst|*.txt|*.log|*.conf|*.cfg|*.ini|*.yml|*.yaml|*.json|*.xml|*.csv|*.tsv)
            bat "$1"
            ;;
        *)
            bat "$1"
            ;;
    esac
}

case "$1" in
    *.txt|*.md|*.json|*.conf|*.cfg|*.ini|*.yml|*.yaml|*.xml|*.csv|*.tsv|*.log|*.sh|*.bash|*.zsh|*.py|*.rb|*.js|*.ts|*.html|*.css|*.scss|*.less|*.php|*.java|*.c|*.h|*.cpp|*.hpp|*.go|*.rs|*.lua|*.sql|*.hs|*.vim|*.awk|*.sed)
        handle_text "$1"
        ;;
    *)
        # Fallback to default behavior
        exit 1
        ;;
esac

exit 0
