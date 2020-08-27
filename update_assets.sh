#!/bin/bash

if [ -d "/tmp/materialize" ]; then
  echo "/tmp/materialize already exists, start pulling"
  git -C /tmp/materialize pull --rebase
else
  git clone git@github.com:materializecss/materialize.git /tmp/materialize
fi

rsync -avh --delete /tmp/materialize/sass/ ./assets/stylesheets/
rsync -avh --delete /tmp/materialize/js/ ./assets/javascripts/materialize/
rsync -avh /tmp/materialize/dist/js/materialize.js ./assets/javascripts/materialize.js
rm -f ./assets/stylesheets/{.npmignore,_style.scss,ghpages-materialize.scss}
