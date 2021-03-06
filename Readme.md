# torbrowser-overlay

To add the torbrowser overlay, run `layman -a torbrowser`.

Install either `www-client/torbrowser-launcher` or `www-client/torbrowser`. If unsure, choose `www-client/torbrowser-launcher`.

![Tor Browser Bundle start page](https://upload.wikimedia.org/wikipedia/commons/1/12/Tor_Browser_Bundle_start_page.png)


## www-client/torbrowser-launcher

[Homepage](https://github.com/micahflee/torbrowser-launcher)

Tor Browser Launcher is intended to make the Tor Browser Bundle (TBB) easier to
maintain and use for GNU/Linux users. You install 'torbrowser-launcher' from
your distribution's package manager and it handles everything else, including:

* Downloading the most recent version of TBB for you, in your language and for your architecture
* Automatically updating (while preserving your bookmarks and preferences)
* Verifying the TBB's [GnuPG signature](http://www.gnupg.org/gph/en/manual/x135.html)
* Adding a "Tor Browser" application launcher to your desktop environment's menu
* Optionally playing a modem sound when you open Tor Browser (because Tor is so slow)


## www-client/torbrowser

[Git repository](https://gitweb.torproject.org/tor-browser.git)

This patched Firefox build is **not recommended by Tor upstream** but
uses the exact same sources. Use this only if you know what you are doing!

The profile folder includes pre-configuration recommended by upstream,
as well as the extensions Torbutton, NoScript and HTTPS-Everywhere.
If you want to start from scratch just remove the directory `~/.mozilla/torbrowser`.

Torbrowser uses port `9150` to connect to Tor. You can change the port
in the connection settings to match your setup.
See `Preferences -> Advanced -> Network -> Connection -> SOCKS Host`


### Advanced torbutton functionality

To get the advanced functionality of Torbutton (network information,
new identity feature), `www-client/torbrowser` needs to access a control port.

![Tor Onion Menu ](https://people.torproject.org/~mikeperry/images/OnionMenu.jpg)

* If you use `www-client/torbrowser`, you need to **adjust and export** the environment variables from
  [99torbrowser.example](https://github.com/MeisterP/torbrowser-overlay/blob/master/www-client/torbrowser/files/99torbrowser.example).
  You can do this either with gentoo's `/etc/env.d`
  [mechanism](https://wiki.gentoo.org/wiki/Handbook:X86/Working/EnvVar#Defining_variables_globally)
  or on the command line.

  _Tor Network Settings_ and _Check for Tor Browser Update_ functionality is not working with the `www-client/torbrowser`.

* If you use `www-client/torbrowser-launcher`, make sure that the environment variables from
  [99torbrowser.example](https://github.com/MeisterP/torbrowser-overlay/blob/master/www-client/torbrowser/files/99torbrowser.example)
  are **unset** and that you **don't** have the system wide tor running on port `9150`.

  With `www-client/torbrowser-launcher`, all menu entries are available and working.
