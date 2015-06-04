# keymap-disabler

# Why

Every package provide default keymap.  
Keymap is limited resources.  
I don't want to consume keymap for feature I rarely use.  
But don't want to completely disable package itself so that I can invoke from command palette.  

After I created this package, I noticed similar [disable-keybindings](https://atom.io/packages/disable-keybindings) is already exists.  
Although I released this package for my minimalistic preference, if you want more advanced feature, try `disable-keybindings`.

# How to use.

Add list of package name to `Packages` configuration parameter.  
You need to reload Atom for new configuration take effect.  

e.g.
```
package1, package2
```

# Similar packages

* [disable-keybindings](https://atom.io/packages/disable-keybindings)
More advanced features and configuration take effect without reload.
# atom-keymap-disabler
