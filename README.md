Powershell Lite Prompt for Bash
===============================

A very minimalistic and fast powershell prompt for Bash.

Usage is very simple: just use the `print_sections` function to create
a prompt with as many sections as you like.

Syntax is:

```sh
    print_sections FG1 BG1 TXT1 ... FGn BGn TXTn
```

where FG# and BG# is respectively the foreground and background color,
specified as RGB components between 0 and 5 (i.e.: '000' is black, '555'
is white), and TXT# can be any text.

Example:

```sh
    PS1=$(print_sections '000' '235' ' \u ' '450' '111' ' \w ' '100' '151' ' \$ ')
```

will give you this prompt:

![screenshot](screenshot.png)

