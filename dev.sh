echo "Dont forget to run gulp"
cp base.html index.html
#elm-live src/Main.elm
elm-live src/Main.elm --output=elm.js --open
