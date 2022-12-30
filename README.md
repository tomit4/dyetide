# dye/dyetide - a color conversion tool in bash

__dyetide is a simple tool written in bash for converting your hex code to rgba
codes... or visa versa! dyetide uses classic command line tools like grep, sed,
awk, cut, and bc to parse through a file (usually css) and convert all hex code
to rgba or rgba to hex code. Included is a standalone tool called dye, which is
a separate command line tool for doing one at a time color conversions, for when
you need to know what a hex/rgba/hsla code is in another color code right now!__

### Installation/Uninstallation

clone this repository and navigate into it:

`git clone https://codeberg.org/z3rOR0ne/dyetide`

`cd dyetide`

this repository includes install/uninstall scripts for your convenience.

By default, the script and data files are installed systemwide in `/usr/local` (requires root privilege).

If you want to install to your home directory, use `./install --user` (no root required).

To customize the installation, you can set the `PREFIX` directory, or further customize with the `BINDIR`, `DATADIR`, and `MANDIR` variables. Run `./install --help` for details.

You can preview the actions the install script will take by giving the `--dry-run` switch.

And if you wish to uninstall:

`./uninstall`

Note: if you used the `--user` switch and/or defined `PREFIX` (etc.), you will also need to give those to `uninstall`.

### Usage (dyetide)
```
usage: dyetide [-x|-r|-h] [hex|rgb|hsl] file
options:
 -x [color_code]    convert all hex to [color_code] in file
 -r [color_code]    convert all rgb to [color_code] in file
 -h [color_code]    convert all hsl to [color_code] in file
examples:
 dyetide -x rgb file
 dyetide -x hsl file
 dyetide -r hex file
 dyetide -r hsl file
 dyetide -h hex file
 dyetide -h rgb file
```
### Usage (dye)
```
usage: dye [-x|-r] [color_code] "input_color"
options:
 -x [color_code]          hex to [color_code]
 -r [color_code]          rgb to [color_code]
 -h [color_code]          hsl to [color_code]
examples:
 dye -x rgb "#fff"
 dye -x rgb "#ffffff"
 dye -x rgb "#43fF6480"
 dye -r hex "rgb(255, 255, 255)"
 dye -r hsl "rgba(67, 255, 100, 0.8)"
 dye -r hex "rgba(67, 255, 100, 0.5)"
 dye -h hex "hsla(350, 100%, 100%, 1.0)"
 dye -h rgb "hsl(350, 100, 100)"
```

### Backups

When utilizing dyetide, a .bak file is made to ensure that should any
unexpected or undesirable results occur to your files, you can always revert
to your original file utilizing this backup file. Although I have tried to make
dye and dyetide as accurate as possible, it is at the end of the day a beginner's
project, and therefore may have unforeseen bugs. Please feel free to open an issue
in this repository, and if it is not too time consuming I will do my best to address it.

### Why did you make this?

dye and dyetide were created for a multitude of reasons. The main reason being
for educational purposes. Obviously these sorts of tools have been done many
times before, and bash is probably not the best choice of language for its
implementation. Nevertheless, I have a love for the bash scripting language, and
wanted to see whether or not bash could accomplish color conversion.
Additionally, I find myself working in the terminal very often, and whenever I
can get the information I need without having to consult a website, or open some
sort of GUI application, I will do so. The one major convenience of dye in
particular is that it converts the color codes directly from your terminal.

### Disclaimer

dye and dyetide were made as an educational exercise in understanding the basics
of color code conversions. Due to them both being bash scripts, dye and dyetide
are not as fast as comparative tools written in other languages like python. The
calculations may be off by a single digit here and there, so if absolute
accuracy is important to you, please utilize other tools.


### Credits
Akash Mittal - [original code](https://akashmittal.com/code-example-convert-hex-color-to-rgb-rgb-to-hex-using-bash-script/) for hex_to_rgb() and rgb_to_hex()

Garry Tan, - [original code](https://axonflux.com/handy-rgb-to-hsl-and-rgb-to-hsv-color-model-c) for hsl_to_rgb and rgb_to_hsl functions translated from JavaScript

redditor zeekar - provided [explanations](https://reddit.com/r/bash/comments/zqmvz8/rgbhex_converter_syntax_how_does_this_work/) of Akash Mittal's original code

redditor ProfessorChaos112 - provided an [alternative](https://reddit.com/r/bash/comments/zut4nw/converting_hsl_to_rgb_in_bash/) rgb_to_hsl function

redditor DyslexicHobo -suggested OpenAI's ChatGPT, which was utilized to finalize rgb_to_hex()

artificial intelligence [ChatGPT](https://openai.com/blog/chatgpt/)

### Checklist

- [ ] Add documentation comments to dyetide code
- [ ] Try and refactor sed chains when extracting numbers from rgba/hsla strings
in dye
