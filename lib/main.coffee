module.exports =
  config:
    packages:
      description: 'List of packages to disable keymap e.g. "pack1, pack2"'
      type: 'array'
      items:
        type: 'string'
      default: []

  activate: ->
    atom.packages.onDidActivateInitialPackages =>
      packs = atom.packages.getLoadedPackages()
      for pack in packs when @needDisable(pack.name)
        @disableKeymap pack
        
  disableKeymap: (pack) ->
    for file in pack.getKeymapPaths()
      atom.keymaps.removeBindingsFromSource(file)

  needDisable: (name) ->
    name in atom.config.get('keymap-disabler.packages')
