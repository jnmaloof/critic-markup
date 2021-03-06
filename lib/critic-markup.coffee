module.exports =
  activate: ->
    atom.commands.add 'atom-workspace',
      "critic-markup:addition": =>
        @addition()
      "critic-markup:deletion": =>
        @deletion()
      "critic-markup:substitution": =>
        @substitution()
      "critic-markup:highlight": =>
        @highlight()
      "critic-markup:comment": =>
        @comment()

  addition: ->
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection()
    text = selection.getText()
    editor.insertText("{++"+text+"++}")
    if !text
        editor.moveLeft(3)

  deletion: ->
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection()
    text = selection.getText()
    editor.insertText("{--"+text+"--}")

  substitution: ->
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection()
    text = selection.getText()
    editor.insertText("{~~"+text+"~>~~}")
    editor.moveLeft(3)

  highlight: ->
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection()
    text = selection.getText()
    editor.insertText("{=="+text+"==}{>><<}")
    editor.moveLeft(3)

  comment: ->
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection()
    text = selection.getText()
    editor.insertText("{>>"+text+"<<}")
    if !text
        editor.moveLeft(3)
