#!/bin/sh

# set this first, so it is inherited by the setting of the preferences and the actual QuPath run
export _JAVA_OPTIONS="-Duser.home=/tmp -Djavafx.cachedir=/tmp"

# set the home directory of the QuPath preferences before starting, so extensions can be loaded
echo "qupath.lib.gui.prefs.PathPrefs.userPathProperty().set('/opt/qupath/user_dir')" > /opt/qupath/set_preference_script.groovy
/opt/qupath/QuPath/bin/QuPath script /opt/qupath/set_preference_script.groovy --save

# The path `/opt/qupath/infile.tiff` is important as the Galaxy IT is inserting the user-chosen file into this path.
cd $HOME/outputs
exec /opt/qupath/QuPath/bin/QuPath --image /opt/qupath/infile.tiff --quiet
