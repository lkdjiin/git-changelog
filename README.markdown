git-changelog
================

Description
-----------
Git-changelog is a Ruby script that extends git with a `changelog` command.
This is usefull to automate changelog files production.
Git-changelog outputs in markdown or html format.
If you want to generate a simple text file and don't use markdown it's
ok too, as markdown is a human readable text file format.

Install
-------------------------
Put the file `git-changelog` somewhere in your PATH.

Usage
--------------------------

Output on console:

    git changelog

Output in a file:

    git changelog > changelog.markdown

Git-changelog accept an option `--since`. This is the same option as
the one for `git log` command. Examples:

    git changelog --since=2013-07-01
    git changelog --since=10.days

To output in Html:

    git changelog --html

All the above combined:

    git changelog --html --since=2013-05-27 > changelog.html

Contributing
-------------------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


License
--------------------------
MIT


Questions and/or Comments
--------------------------

Feel free to email [Xavier Nayrac](mailto:xavier.nayrac@gmail.com)
with any questions, or contact me on [twitter](https://twitter.com/lkdjiin).
