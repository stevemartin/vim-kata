## Getting started

Clone this repository by running:

    git clone git@github.com:stevemartin/vim-kata.git
    cd vim-kata

## Build it

    rake build

## Launch the VimDojo

To run the macro tutorial in the terminal, run:

    ./macro

To run the search replace tutorial in the terminal, run:

    ./replace

To run ruby refactoring tutorial in the terminal, run:

    ### NOTE: The `rake refactoring:prepare_vimfiles` command copies your existing
    ### ~/.vimrc and ~/.vim to backed up versions until you restore them with `rake refactoring:restore_vimfiles`.

    rake refactoring:prepare_vimfiles

    ./refactoring

    rake refactoring:restore_vimfiles


## Navigate the lessons

The right/down arrow keys advance through the lessons. Use the left/up keys to go backwards through the lessons.
.
NOTE: As the arrow keys have been modified for navigation through the tutorial, you will need to use the home row ( hjkl ) to navigate the text.
