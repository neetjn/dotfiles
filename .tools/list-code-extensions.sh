#!/usr/bin/env bash

##
# Author: John Nolette
#   This script generates an installation script for vscode extensions using a snapshot of the current environment.
##

CODE_PATH=$(echo $(which code))
SCRIPT_NAME="install-code-extensions.sh"
HOME_PATH=$(echo ~)
SCRIPT_LOCATION=$HOME_PATH/.tools/$SCRIPT_NAME

echo "#!/usr/bin/env bash\n" > $SCRIPT_LOCATION

if [ $CODE_PATH ]; then
  echo "Visual Studio Code found, exporting list of extensions..."
  code --list-extensions | xargs -L 1 echo "code --install-extension" >> $SCRIPT_LOCATION
  chmod +x $SCRIPT_LOCATION
  echo "Installation script dumped @ ${SCRIPT_LOCATION}"
fi
