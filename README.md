# dotfiles

My dotfiles

## Usage

Clone into a subdirectory then copy into ~. Note that some files are personalized to me, though they contain no secretive information.

## Linux Notes

- Ctrl-w-w to switch windows on Vim
- make sure `$ vim --version | grep clipboard` is positive to use system clipboard
- open NERDtree with `:NERDTree`
- `:bp` to go to previous file. same for `n`,`f`,`l`, and `w`
- Change the title of multiple files at once with `rename 's/[old]/[new]/g' *`
- refresh NERDTree with `r`
- On Anki, to change the order of siblings when imported in the wrong direction. First, note that reposition and resetting learning will not work. You must copy the note type, change all cards to the copied note type, flip the cards for the new note type, then copy the cards back to the original note type.
- To create a local Latex package, create a file named "packagename.sty" with the command `\ProvidesPackage{packagename}` at the top, and put it into a subdirectory of "`kpsewhich -var-value=TEXMFHOME`/tex/latex/", not inside this directory itself. Then run `sudo texhash` and `sudo mktexlsr`. You can then import the package with `\usepackage{packagename}`.
- On Anki, to create cards with Latex, edit the card->options and add a UsePackage. You cannot use Input. This is thanks to http://www.wucathy.com/blog/?p=2704.

### PDF management

- to split pdf into pages, `pdftk [input.pdf] burst`
- to convert pdf to image, `pdftoppm [input.pdf] outputrootname -png`
