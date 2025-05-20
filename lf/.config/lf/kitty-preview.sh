#!/bin/bash

file="$1"
width="$2"
height="$3"
px="$4"
py="$5"

# Helper function to display images in Kitty
kitty_icat() {
    kitty +kitten icat \
        --detect-support \
        --clear \
        --place "${width}x${height}@${px}x${py}" \
        "$1"
}

# IMAGES (PNG/JPG/GIF/WEBP/SVG)
if file -b --mime-type "$file" | grep -q '^image/'; then
    kitty_icat "$file"
    exit 0

# PDFs (show first page)
elif [[ "$file" == *.pdf ]]; then
    pdftoppm -jpeg -f 1 -l 1 "$file" /tmp/lf-preview \
        && kitty_icat /tmp/lf-preview-1.jpg \
        && rm /tmp/lf-preview-1.jpg
    exit 0

# VIDEOS (generate thumbnail)
elif file -b --mime-type "$file" | grep -q '^video/'; then
    ffmpegthumbnailer -i "$file" -o /tmp/lf-vidthumb.jpg -s 0 -q 10 \
        && kitty_icat /tmp/lf-vidthumb.jpg \
        && rm /tmp/lf-vidthumb.jpg
    exit 0

# ARCHIVES (ZIP/TAR/RAR/etc.)
elif [[ "$file" == *.zip || "$file" == *.tar* || "$file" == *.rar ]]; then
    if [[ "$file" == *.zip ]]; then
        unzip -l "$file"
    elif [[ "$file" == *.tar* ]]; then
        tar -tf "$file"
    elif [[ "$file" == *.rar ]]; then
        unrar l "$file"
    fi | bat --plain --language=json --color=always
    exit 0

# DEFAULT: Syntax-highlighted text (via bat)
else
    bat --color=always --style=numbers,changes "$file"
    exit 0
fi
