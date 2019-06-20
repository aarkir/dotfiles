# dotfiles

My dotfiles

## Usage

Clone into a subdirectory then copy into ~. Note that some files are personalized to me.

## Linux Notes

- Anki
  - On Anki, to change the order of siblings when imported in the wrong direction. First, note that reposition and resetting learning will not work. You must copy the note type, change all cards to the copied note type, flip the cards for the new note type, then copy the cards back to the original note type.
  - To create a local Latex package, create a file named "packagename.sty" with the command `\ProvidesPackage{packagename}` at the top, and put it into a subdirectory of "`kpsewhich -var-value=TEXMFHOME`/tex/latex/", not inside this directory itself. Then run `sudo texhash` and `sudo mktexlsr`. You can then import the package with `\usepackage{packagename}`.
  - On Anki, to create cards with Latex, edit the card->options and add a UsePackage. You cannot use Input. This is thanks to http://www.wucathy.com/blog/?p=2704.
- docker
  - To fix nvidia-docker repository update issues, run `curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -` (https://github.com/NVIDIA/nvidia-docker/issues/837)
- TMUX
  - Close session with `(prefix) :kill-session`
- Vim
  - open new file in buffer with `:edit`
  - add text at beginning of multiple lines http://vim.wikia.com/wiki/Inserting_text_in_multiple_lines
  - Ctrl-w-w to switch windows on Vim
  - make sure `$ vim --version | grep clipboard` is positive to use system clipboard
  - open NERDtree with `:NERDTree`
  - `:bp` to go to previous file. same for `n`,`f`,`l`, and `w`
  - Change the title of multiple files at once with "rename 's/[old]/[new]/g' *
  - refresh NERDTree with `r`
  - vimlatex or latex suite http://vim-latex.sourceforge.net/documentation/latex-suite-quickstart.html
- Bash
  - unzip to directory with `unzip (file.zip) -d (dir)`
  - `play -n synth whitenoise`
  - unzip to directory with `unzip [input.zip] -d [dir]
- MATLAB
  - you have to define local functions after their instantiations
  - It seems like MATLAB actually treats all files in the working directory as variables, so they have to be named according to naming conventions
- PDF
  - combine pdfs with `pdftk file1.pdf file2.pdf file3.pdf cat output newfile.pdf`
  - convert a set of images to pdf with `convert *.jpg pictures.pdf `
- to fix buggy audio, use 'killall pulseaudio'
- Jekyll
  - 'bundle exec jekyll serve'


### PDF management

- to split pdf into pages, `pdftk [input.pdf] burst`
- to convert pdf to image, `pdftoppm [input.pdf] outputrootname -png`

### Handling iOS

- I couldn't get libimobiledevice based syncing working within an hour or so. This includes Linux media players with built-in support like Banshee, Clementine, and Rhythembox. Instead, I found a couple apps that work. 
  1. I like FLAC Player+ the best as it which allows for playlists, artists, albums, etc.
  2. Documents includes many other features in addition to playing music, but doesn't have playlists/albums/artists besides the folder the songs are in. Also, it is 150 MB while the other two listed apps are ~50MB
  3. VLC (for mobile) supports captions and the host of extensions it does on the PC, but functions as a worse music player than Documents because it doesn't allow normal things like skipping through songs.

### mpsyt

- if you get hit with maximum api responses, create an api key at https://console.developers.google.com/apis/, then run `set api_key [api_key]`

### Installed Things

- https://github.com/tmux-plugins/tpm
- https://github.com/VundleVim/Vundle.vim
- https://github.com/mps-youtube/mps-youtube
- https://www.chinesetextanalyser.com/
- dict (dictionary), dictd (local server for offline) to try to get an offline Chinese dict, but looks like there are only a couple (xdict, star---) in external repos and they are english to chinese. I could use youdao or another non-terminal program i guess.

### Latex

- to use a URL in a frame with Beamer, use the `[fragile]` tag for the frame
