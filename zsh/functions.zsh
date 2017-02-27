# Create a data URI from a file and copy it to the pasteboard
function datauri {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  printf "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')" | pbcopy | printf "=> data URI copied to pasteboard.\n"
}

# Change directory to the current Finder directory
function cdf {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}

# Start an Python HTTP server from a directory, optionally specifying the port
function pyserver {
  # Get port (if specified)
  local port="${1:-8000}"

  # Open in the browser
  open "http://localhost:${port}/"

  # Redefining the default content-type to text/plain instead of the default
  # application/octet-stream allows "unknown" files to be viewable in-browser
  # as text instead of being downloaded.
  #
  # Unfortunately, "python -m SimpleHTTPServer" doesn't allow you to redefine
  # the default content-type, but the SimpleHTTPServer module can be executed
  # manually with just a few lines of code.
  python -c $'import SimpleHTTPServer;\nSimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map[""] = "text/plain";\nSimpleHTTPServer.test();' "$port"
}

# Start an PHP HTTP server from a directory, optionally specifying the port
function phpserver {
  # Get port (if specified)
  local port="${1:-8000}"

  # Open in the browser
  open "http://localhost:${port}/"

  # Run built-in web server
  php -S "localhost:${port}"
}

# animated gifs from any video
# from alex sexton   gist.github.com/SlexAxton/4989674
gifify() {
  if [[ -n "$1" ]]; then
	if [[ $2 == '--good' ]]; then
	  ffmpeg -i "$1" -r 10 -vcodec png out-static-%05d.png
	  time convert -verbose +dither -layers Optimize -resize 900x900\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > "$1.gif"
	  rm out-static*.png
	else
	  ffmpeg -i "$1" -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > "$1.gif"
	fi
  else
	echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

# turn that video into webm.
# brew reinstall ffmpeg --with-libvpx
webmify(){
	ffmpeg -i "$1" -vcodec libvpx -acodec libvorbis -isync -copyts -aq 80 -threads 3 -qmax 30 -y "$2" "$1.webm"
}

# The following script will display the 16 colors in the terminal
function bash_colors {
  echo -e "\033[0mCOLOR_NC (No color)"
  echo -e "\033[1;37mCOLOR_WHITE\t\033[0;30mCOLOR_BLACK"
  echo -e "\033[0;34mCOLOR_BLUE\t\033[1;34mCOLOR_LIGHT_BLUE"
  echo -e "\033[0;32mCOLOR_GREEN\t\033[1;32mCOLOR_LIGHT_GREEN"
  echo -e "\033[0;36mCOLOR_CYAN\t\033[1;36mCOLOR_LIGHT_CYAN"
  echo -e "\033[0;31mCOLOR_RED\t\033[1;31mCOLOR_LIGHT_RED"
  echo -e "\033[0;35mCOLOR_PURPLE\t\033[1;35mCOLOR_LIGHT_PURPLE"
  echo -e "\033[0;33mCOLOR_YELLOW\t\033[1;33mCOLOR_LIGHT_YELLOW"
  echo -e "\033[1;30mCOLOR_GRAY\t\033[0;37mCOLOR_LIGHT_GRAY"
}
