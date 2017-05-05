# pomodoro.sh
A Pomodoro shell script that allows users to tweak their Pomodoro however they see fit.

pomodoro.sh uses arguments passed in with flags to give users the ability to
tweak every aspect of their pomodoro. The flags are (the following is displayed
in terminal with `pomodoro.sh -h`):

```
pomodoro.sh [args]

Arguments:

-h              Displays the help menu.
-v              Enables Verbose mode. Echo the pomodoro status to your terminal.
                Off by default.
-s              Enable Silent mode. "Ding" is not played on pomodoro, or break.
-t [minutes]    Set the amount of minutes a pomodoro lasts. Default 25.
-b [minutes]    Set the amount of minutes the short break lasts. Default 5.
-l [minutes]    Set the amount of minutes the long break lasts. Default 10.
-L [number]     Set the amount of pomodoros before triggering a long break.
                Default 3.
-k [number]     Set the amount of pomodoros before ending the script. 0 means
                the script runs until stopped by the user. Default 0.
-f [path]       Set the path to the sound file that plays on pomodoro, or break.
                Default 'ding.wav'.
```

So for example, running `./pomodoro.sh -v -s -k 5` takes over the terminal,
echos the pomodoro status on change, does not play any sounds on change, and
exits after 5 pomodoros. `./pomodoro.sh &` runs pomodoro.sh in the background
using the default values, forever.

# License
pomodoro.sh is Licensed under the GNU GENERAL PUBLIC LICENSE 3.0. Please see the LICENSE file for more information.

ding.wav is made by Corsica\_S, and is used under Creative Commons Attribution 3.0.
