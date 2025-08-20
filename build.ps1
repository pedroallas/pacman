# Build script PowerShell
$OUTPUT = "pacman.js"

# Write header
@"
// Copyright 2012 Shaun Williams
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License Version 3 as 
//  published by the Free Software Foundation.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.

// ==========================================================================
// PAC-MAN - TECNOJOGANDO
// an accurate remake of the original arcade game

// Based on original works by Namco, GCC, and Midway.
// Research by Jamey Pittman and Bart Grantham
// Developed by Shaun Williams, Mason Borda
// Customizado por Pedro Allas - Tecnojogando

// ==========================================================================

(function(){

"@ | Out-File -FilePath $OUTPUT -Encoding UTF8

# List of files in order
$files = @(
    "inherit.js",
    "sound.js", 
    "random.js",
    "game.js",
    "direction.js",
    "Map.js",
    "colors.js",
    "mapgen.js",
    "atlas.js",
    "renderers.js",
    "hud.js",
    "galagaStars.js",
    "Button.js",
    "Menu.js",
    "inGameMenu.js",
    "sprites.js",
    "Actor.js",
    "Ghost.js",
    "Player.js",
    "actors.js",
    "targets.js",
    "ghostCommander.js",
    "ghostReleaser.js",
    "elroyTimer.js",
    "energizer.js",
    "fruit.js",
    "executive.js",
    "states.js",
    "input.js",
    "cutscenes.js",
    "maps.js",
    "vcr.js",
    "main.js"
)

# Concatenate each file
foreach ($file in $files) {
    "//@line 1 `"src/$file`"" | Add-Content -Path $OUTPUT
    Get-Content "src\$file" | Add-Content -Path $OUTPUT
}

# Close anonymous function
"})();" | Add-Content -Path $OUTPUT

Write-Host "Build completed successfully!"
