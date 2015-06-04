# keymap-disabler

# Why

Every package provide default keymap.  
Keymap is limited resources.  
I don't want to consume keymap for feature I rarely use.  
But don't want to completely disable package itself so that I can invoke from command palette.  

After I created this package, I noticed similar [disable-keybindings](https://atom.io/packages/disable-keybindings) is already exists.  
Although I released this package for my minimalistic preference, if you want more advanced feature, try `disable-keybindings`.

# How to use.

Add package name to `bundledPackages` or `communityPackages`.  
You need to reload Atom for new configuration take effect.  
You can use wildcard `*` to disable **all** packages keymap.

* `bundledPackages`
```
tree-view, symbols-view
```

* `communityPackages`  
```
package1, package2
```
Or disable all community package's keymap by
```
*
```

## Practical example

* I want to disable default keymap for `symbols-view` bundled package.
* I want to disable all default keymap for community package except `vim-mode` provides.

Configuration to achieve above requirement is here.

* `bundledPackages`:`symbols-view`
* `communityPackages`: `*`
* `communityPackagesException`: `vim-mode`

```coffeeScript
"keymap-disabler":
  bundledPackages: [
    "symbols-view"
  ]
  communityPackages: [
    "*"
  ]
  communityPackagesException: [
    "vim-mode"
  ]
```

# Similar packages

* [disable-keybindings](https://atom.io/packages/disable-keybindings)
More advanced features and configuration take effect without reload.
# atom-keymap-disabler
