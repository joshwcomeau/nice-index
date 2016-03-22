{CompositeDisposable} = require 'atom'
path = require('path')


module.exports = NiceIndex =
  subscriptions: null


  activate: (state) ->
    @subscriptions = new CompositeDisposable

    @renameTabs = @renameTabs.bind(@)

    atom.workspace.observeTextEditors (editor) =>
      @subscriptions.add editor.onDidDestroy @renameTabs
      @subscriptions.add editor.onDidChangePath @renameTabs
      @subscriptions.add editor.onDidChangeTitle @renameTabs

    atom.workspace.observePanes (pane) =>
      @subscriptions.add pane.onDidMoveItem @renameTabs
      @subscriptions.add pane.onDidAddItem @renameTabs
      @subscriptions.add pane.onDidRemoveItem @renameTabs

    @subscriptions.add atom.workspace.onDidOpen(@renameTabs)

    setTimeout @renameTabs, 1234


  deactivate: ->
    @subscriptions.dispose()


  renameTabs: ->
    elements = @getElementsArray 'li.tab .title'

    elements.forEach (el) =>
      # Match any `index.` file
      if el.getAttribute('data-name')?.match(/^index.*/)
        el.innerText = '/' + @getDirectoryName(el)
      else
        el.innerText = el.getAttribute('data-name')


  getDirectoryName: (el) ->
    dir = path.dirname el.getAttribute('data-path')
    dirs = dir.split path.sep
    return dirs[dirs.length - 1]


  getElementsArray: (selector) ->
    return [].slice.call document.querySelectorAll(selector)
