Continuous Builder
=================

Continuous integration made trivial.

Subversion post-commit hook for email:

DEVELOPERS=david@loudthinking.com
BUILDER="'Continuous Builder' <cb@37signals.com>"

cd /u/apps/your/app    && /usr/local/bin/rake -t test_latest_revision NAME=YourApp RECIPIENTS="$DEVELOPERS" SENDER="$BUILDER" &
cd /u/apps/another/app && /usr/local/bin/rake -t test_latest_revision NAME=AnotherApp RECIPIENTS="$DEVELOPERS" SENDER="$BUILDER" &


Subversion post-commit hook for Campfire:

CAMPFIRE_URL  = 'https://username:password@domain.campfirenow.com/rooms/1234'
CHANGESET_URL = 'https://dev.example.com/trac/changeset/'

cd /u/apps/your/app    && /usr/local/bin/rake -t test_latest_revision NAME=YourApp    CAMPFIRE_URL="$CAMPFIRE_URL" CHANGESET_URL="$CHANGESET_URL" &
cd /u/apps/another/app && /usr/local/bin/rake -t test_latest_revision NAME=AnotherApp CAMPFIRE_URL="$CAMPFIRE_URL" CHANGESET_URL="$CHANGESET_URL" &
