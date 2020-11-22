#!/bash/sh

rm -rf ./docs
mkdir docs
rsync -r ./_book/* ./docs/
