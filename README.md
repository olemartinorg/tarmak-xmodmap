# Xmodmap mappings for Tarmak 1-4
This repository contains a makefile that will generate Xmodmap mappings from your current (QWERTY, maybe localized) keyboard layout to the Tarmak 1-4 layouts.

### What is Tarmak?
[Tarmak](http://forum.colemak.com/viewtopic.php?id=1858) is a set of keyboard layouts that will help you transition from QWERTY to the [Colemak keyboard layout](http://colemak.com/). Tarmak consists of 4 different layouts, each changing 4-5 keys from the previous layout.

Normally, you'd transition from:

    QWERTY --> Tarmak 1 --> Tarmak 2 --> Tarmak 3 --> Tarmak 4 --> Colemak

For some people, this will be easier than switching to Colemak cold turkey - and you can still be somewhat productive throughout.

### Why Xmodmap?
DreymaR, the author of Tarmak, has a [big bag of tricks](http://forum.colemak.com/viewtopic.php?id=1438) that contains XKB layout files for Tarmak 1-4. Tarmak is supposed to be a temporary layout, and i think that bag of his is way too big - I'd rather not rewrite most of my XKB layouts for something i will hopefully just need for a few weeks.

Although deprecated, Xmodmap is perfect for this task. XKB still has a compatibility layer for Xmodmap - and Xmodmap makes it very easy to create and use transitional keyboard layouts like Tarmak. It will also work per-user, as xmodmap won't touch the system-wide XKB layout files.

### Cool, now how do i use this?
First of all, check out this repository (`git clone https://github.com/olemartinorg/tarmak-xmodmap`) or download the Makefile to your local machine. Run `make` inside the directory containing the Makefile. Now you can start using the Tarmak 1 by calling:

    xmodmap tarmak1.xmodmap
    
Good luck!

#### Useful links

* http://colemak.com/
* http://colemak.com/Learn
* http://forum.colemak.com/
* http://www.reddit.com/r/Colemak
* http://www.makeuseof.com/tag/how-i-quickly-mastered-a-superior-keyboard-layout-without-losing-productivity/
