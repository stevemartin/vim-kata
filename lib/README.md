* generate a `locations` file from a list of filenames
* parse input format with anchor lines, generating line/column addresses
    * output same file with anchor lines stripped
    * generate an address from each anchor line

src/chapter/toc
src/chapter/example-1.src
src/chapter/example-2.src

tut/chapter/locations
tut/chapter/example-1
tut/chapter/example-2

Usage:

from root directory, run:

    rake

* the task will look inside each `src/chapter` directory for a `toc` file.
* each line in the file will list an example file, in the order they are to appear
* the example source files will be processed in that order
* each example source file will be parsed, output to tut/chapter
* 
