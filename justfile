# Build and serve the site using a local server (default is `127.0.0.1:1111`):
serve:
    zola serve

# Build the whole site in the `public` directory after deleting it:
build:
    zola build

# Build all pages just like the build command would, but without writing any of the results to disk
check:
    zola check

# clone submodule theme
clone-submodule:
    git clone --recurse-submodules git@github.com:Turmaxx/serene.git

# update submodule theme
update-submodule:
    git submodule foreach git pull
