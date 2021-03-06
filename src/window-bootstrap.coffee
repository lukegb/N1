# Swap out Node's native Promise for Bluebird, which allows us to
# do fancy things like handle exceptions inside promise blocks
global.Promise = require 'bluebird'

# Like sands through the hourglass, so are the days of our lives.
require './window'

Atom = require './atom'
window.atom = Atom.loadOrCreate('editor')
global.Promise.longStackTraces() if atom.inDevMode()
atom.initialize()
atom.startRootWindow()


# Workaround for focus getting cleared upon window creation
windowFocused = ->
  window.removeEventListener('focus', windowFocused)
  setTimeout (-> document.getElementById('sheet-container').focus()), 0
window.addEventListener('focus', windowFocused)
