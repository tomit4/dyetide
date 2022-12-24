#!/usr/bin/env bash

# Convert HSL values to RGB
function hsl_to_rgb() {
    local hue=$1
    local saturation=$2
    local lightness=$3

    # Check for achromatic color
    # color is grey and allthree rgb values should be equal to the $lightness
    if [[ $saturation -eq 0 ]]; then
        echo "$lightness $lightness $lightness"
        return
    fi
# The ternary operator ((x > y ? x : y)) will evaluate to y, since x is not greater than y. As a result, the value of z will be 10.
# In the "Convert HSL values to RGB" section of the hsl_to_rgb function, the ternary operators are used to determine which of the intermediate
# or maximum values should be assigned to the red, green, or blue variables, based on the value of hue_sixth.
    # Convert HSL values to RGB
    local intermediate_value=$((lightness * 2 - saturation))
    local maximum_value=$(((intermediate_value + saturation) * 2))
    local hue_sixth=$((hue * 6))
    local red=$((hue_sixth < 1 ? intermediate_value : hue_sixth < 3 ? maximum_value : hue_sixth < 4 ? intermediate_value : lightness))
    local green=$((hue_sixth < 2 ? intermediate_value : hue_sixth < 4 ? maximum_value : hue_sixth < 5 ? intermediate_value : lightness))
    local blue=$((hue_sixth < 3 ? intermediate_value : hue_sixth < 5 ? maximum_value : hue_sixth < 6 ? intermediate_value : lightness))
    echo "$red $green $blue"
}

# Convert RGB values to HEX
function rgb_to_hex() {
    local red=$1
    local green=$2
    local blue=$3
    printf '#%02X%02X%02X' $red $green $blue
}

# Convert HSL to HEX
function hsl_to_hex() {
    local hue=$1
    local saturation=$2
    local lightness=$3

    # Convert HSL to RGB
    local red green blue
    read red green blue <<<$(hsl_to_rgb $hue $saturation $lightness)

    # Convert RGB to HEX
    rgb_to_hex $red $green $blue
}
