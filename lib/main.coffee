module.exports =
  config:
    bundledPackages:
      order: 1
      description: 'List of Atom bundled packages to disable keymap e.g. `pack1, pack2` or `*`'
      type: 'array'
      items:
        type: 'string'
      default: []
    bundledPackagesException:
      order: 2
      description: 'Keymap for package listed here is never be disabled'
      type: 'array'
      items:
        type: 'string'
      default: []
    communityPackages:
      order: 11
      description: 'List of packages to disable keymap e.g. `pack1, pack2` or `*`'
      type: 'array'
      items:
        type: 'string'
      default: []
    communityPackagesException:
      order: 12
      description: 'Keymap for package listed here is never be disabled'
      type: 'array'
      items:
        type: 'string'
      default: []

  deactivate: ->

  activate: ->
    atom.packages.onDidActivateInitialPackages =>
      packs = atom.packages.getLoadedPackages()
      for pack in packs when @needDisable(pack.name)
        @disableKeymap pack

  # Bug?
  # For pre-activated package, package.getKeymapPaths() is empty
  #  but package.keymaps have mapping object.
  # So I intentionaly avoid using `getKeymapPaths()`.
  disableKeymap: (pack) ->
    for [file, map] in pack.keymaps
      atom.keymaps.removeBindingsFromSource(file)

  needDisable: (name) ->
    if atom.packages.isBundledPackage(name)
      disables = atom.config.get('keymap-disabler.bundledPackages')
      excepts  = atom.config.get('keymap-disabler.bundledPackagesException')
    else
      disables = atom.config.get('keymap-disabler.communityPackages')
      excepts  = atom.config.get('keymap-disabler.communityPackagesException')

    (('*' in disables) or (name in disables)) and (name not in excepts)
