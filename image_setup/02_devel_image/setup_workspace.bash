#!/bin/bash

# In this file you can add a script that intitializes your workspace

# stop on errors
set -e

BUILDCONF=
BRANCH=

if [ ! $1 = "" ]; then
   echo "overriding git credential helper to $1"
   CREDENTIAL_HELPER_MODE=$1
fi

# for Continuous Deployment builds the mode needs to be overridden to be non-interactive
# if set outside this script, use that value, if unset use cache
CREDENTIAL_HELPER_MODE=${CREDENTIAL_HELPER_MODE:="cache"}

# In this file you can add a script that intitializes your workspace

URL_ECLIPSE=https://download.eclipse.org/modeling/mdt/papyrus/rcp/2023-06/6.5.0/papyrus-2023-06-6.5.0-linux64.tar.gz

#Check if tar.gz is already present and decompressed in tmp
wget -c ${URL_ECLIPSE} -P /opt/workspace/ -O - | tar -xz
