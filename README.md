# x11-calc-flatpak

This is a preliminary [x-11-calc](https://github.com/mike632t/x11-calc) flatpak distribution package for HP calc simulators.

[Sample x86-64 package](https://github.com/macmpi/x11-calc-flatpak/releases/download/v0.1/x11-calc.flatpak) can be installed/side-loaded on most distributions: application icon should then appear in launcher.\
It can also be launched under terminal (to monitor eventual error messages):\
`flatpak run com.github.mike632t.x11-calc`

User can launch any of the project calculator simulator. Preferred calculator model reference is set by editing:\
`nano ~/.var/app/com.github.mike632t.x11-calc/config/model.conf`\
(default is `MODEL=35`)

Voyager models (10c, 11c, 12c, 15c, 16c) can be used if relevant rom file is supplied at:\
`~/.var/app/com.github.mike632t.x11-calc/data/$MODEL.rom`

## Building & testing
Copy / clone this repo in a directory and then run:\
`flatpak-builder -v --force-clean build-dir com.github.mike632t.x11-calc.yaml`\
Test install:\
`flatpak-builder --user --install --force-clean build-dir com.github.mike632t.x11-calc.yaml`

Once ready, extract side-loadable `x11-calc.flatpak` package for distribution:\
`flatpak build-bundle ~/.local/share/flatpak/repo x11-calc.flatpak com.github.mike632t.x11-calc master`
