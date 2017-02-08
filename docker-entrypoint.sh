# Distributed under the terms of the Modified BSD License.

set -e

# If the run command is the default, do some initialization first
if [ "$(which "$1")" = "/usr/local/bin/start-singleuser.sh" ]; then
  # Clone sample notebooks to user's notebook directory.  Assume $NB_USER's work
  # directory if notebook directory not explicitly set.  `git clone` will fail
  # if target directory already exists and is not empty, which likely means
  # that we've already done it, so just ignore.
  : ${NOTEBOOK_DIR:=/home/$NB_USER/work}
  git clone https://gist.github.com/davad/2add3669ad639a9f17336c78204adf4b \
    --depth 1 \
    "$NOTEBOOK_DIR/visualize_stocks" || true
fi

# Run the command provided
exec "$@"
