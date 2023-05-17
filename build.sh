<<<<<<< HEAD

# JBoss, Home of Professional Open Source
# Copyright 2016, Red Hat, Inc., and others contributors as indicated
# by the @authors tag. All rights reserved.
# See the copyright.txt in the distribution for a
# full listing of individual contributors.
# This copyrighted material is made available to anyone wishing to use,
# modify, copy, or redistribute it subject to the terms and conditions
# of the GNU Lesser General Public License, v. 2.1.
# This program is distributed in the hope that it will be useful, but WITHOUT A
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
# You should have received a copy of the GNU Lesser General Public License,
# v.2.1 along with this distribution; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA  02110-1301, USA.

#!/bin/sh -e
=======
#!/bin/sh
>>>>>>> a73b1183e1c8093a64d060c8471ab7d63d8e0a82
### ====================================================================== ###
##                                                                          ##
##  This is the main entry point for the build system.                      ##
##                                                                          ##
##  Users should execute this file rather than 'mvn' to ensure              ##
##  the correct version is being used with the correct configuration.       ##
##                                                                          ##
### ====================================================================== ###

# $Id: build.sh 105735 2010-06-04 19:45:13Z pgier $

<<<<<<< HEAD
=======
# Create the bpa if you can
BPA=
uname | grep Linux >> /dev/null
if [ "$?" -ne "1" ]; then
	uname -a | grep x86_64 >> /dev/null
	if [ "$?" -ne "1" ]; then
		BPA="-Dbpa=centos54x64"
	else
		BPA="-Dbpa=centos55x32"
	fi
  # This is required for the upgrade of g++ https://issues.jboss.org/browse/JBTM-1787
  if [ -f /etc/fedora-release ]
  then
	uname -a | grep x86_64 >> /dev/null
	if [ "$?" -ne "1" ]; then
	    BPA="-Dbpa=fc18x64"
	fi
  fi
fi

ORIG_WORKING_DIR=`pwd`
>>>>>>> a73b1183e1c8093a64d060c8471ab7d63d8e0a82
PROGNAME=`basename $0`
DIRNAME=`dirname $0`
GREP="grep"
ROOT="/"

<<<<<<< HEAD
# Ignore user's MAVEN_HOME if it is set
M2_HOME=""
MAVEN_HOME=""

MAVEN_OPTS="$MAVEN_OPTS -Xmx1024M"
export MAVEN_OPTS

./tools/download-maven.sh

#  Default search path for maven.
MAVEN_SEARCH_PATH="\
    tools
    tools/maven \
    tools/apache/maven \
    maven"


=======
# Ignore user's MAVEN_HOME if it is set (M2_HOME is unsupported since Apache Maven 3.5.0)
unset M2_HOME
unset MAVEN_HOME

JAVA_VERSION=$(java -version 2>&1 | grep "\(java\|openjdk\) version" | cut -d\  -f3 | tr -d '"' | tr -d '[:space:]'| awk -F . '{if ($1==1) print $2; else print $1}')

if [ $JAVA_VERSION -eq "9" ]; then
  MAVEN_OPTS="$MAVEN_OPTS --add-modules java.corba"
  MAVEN_OPTS="$MAVEN_OPTS --add-modules java.xml.bind"
  MAVEN_OPTS="$MAVEN_OPTS --add-modules java.xml.ws"
  export MAVEN_OPTS
fi

if [ -z "$MAVEN_OPTS" ]
then
	if [ $JAVA_VERSION -ge "9" ]; then
		MAVEN_OPTS="$MAVEN_OPTS -Xms1303m -Xmx1303m"
	else
    MAVEN_OPTS="$MAVEN_OPTS -Xms1303m -Xmx1303m -XX:MaxMetaspaceSize=512m"
	fi
	export MAVEN_OPTS
fi

#  Default arguments
MVN_OPTIONS="-B -s \"${DIRNAME}/.mvn/wrapper/settings.xml\" $BPA"
>>>>>>> a73b1183e1c8093a64d060c8471ab7d63d8e0a82

#  Use the maximum available, or set MAX_FD != -1 to use that
MAX_FD="maximum"

#  OS specific support (must be 'true' or 'false').
cygwin=false;
darwin=false;
case "`uname`" in
    CYGWIN*)
        cygwin=true
        ;;

    Darwin*)
        darwin=true
        ;;
esac

#
#  Helper to complain.
#
die() {
    echo "${PROGNAME}: $*"
    exit 1
}

#
#  Helper to complain.
#
warn() {
    echo "${PROGNAME}: $*"
}

#
#  Helper to source a file if it exists.
#
source_if_exists() {
    for file in $*; do
        if [ -f "$file" ]; then
            . $file
        fi
    done
}

<<<<<<< HEAD
find_maven() {
    search="$*"
    for d in $search; do
        MAVEN_HOME="${DIRNAME}/$d"
        MVN="$MAVEN_HOME/bin/mvn"
        if [ -x "$MVN" ]; then
            #  Found.
            echo $MAVEN_HOME
            break
        fi
    done
}

=======
>>>>>>> a73b1183e1c8093a64d060c8471ab7d63d8e0a82
#
#  Main function.
#
main() {
    #  If there is a build config file, source it.
    source_if_exists "$DIRNAME/build.conf" "$HOME/.build.conf"

    #  Increase the maximum file descriptors if we can.
    if [ $cygwin = "false" ]; then
<<<<<<< HEAD
        if MAX_FD_LIMIT=`ulimit -H -n`; then
=======
        MVN_OPTIONS="$MVN_OPTIONS -Dorson.jar.location=`pwd`/ext/"
        MAX_FD_LIMIT=`ulimit -H -n`
        if [ $? -eq 0 ]; then
>>>>>>> a73b1183e1c8093a64d060c8471ab7d63d8e0a82
            if [ "$MAX_FD" = "maximum" -o "$MAX_FD" = "max" ]; then
                #  Use system's max.
                MAX_FD="$MAX_FD_LIMIT"
            fi

<<<<<<< HEAD
            if ! ulimit -n $MAX_FD; then
=======
            ulimit -n $MAX_FD
            if [ $? -ne 0 ]; then
>>>>>>> a73b1183e1c8093a64d060c8471ab7d63d8e0a82
                warn "Could not set maximum file descriptor limit: $MAX_FD"
            fi
        else
            warn "Could not query system maximum file descriptor limit: $MAX_FD_LIMIT"
        fi
<<<<<<< HEAD
    fi

    #  Try the search path.
    MAVEN_HOME=`find_maven $MAVEN_SEARCH_PATH`

    #  Try looking up to root.
    if [ "x$MAVEN_HOME" = "x" ]; then
        target="build"
        _cwd=`pwd`

        while [ "x$MAVEN_HOME" = "x" ] && [ "$cwd" != "$ROOT" ]; do
            cd ..
            cwd=`pwd`
            MAVEN_HOME=`find_maven $MAVEN_SEARCH_PATH`
        done

        #  Make sure we get back.
        cd $_cwd

        if [ "$cwd" != "$ROOT" ]; then
            found="true"
        fi

        #  Complain if we did not find anything.
        if [ "$found" != "true" ]; then
            die "Could not locate Maven; check \$MVN or \$MAVEN_HOME."
        fi
    fi

    #  Make sure we have one.
    MVN=$MAVEN_HOME/bin/mvn
    if [ ! -x "$MVN" ]; then
        die "Maven file is not executable: $MVN"
=======
    else
        MVN_OPTIONS="$MVN_OPTIONS -Dorson.jar.location=`cygpath -w $(pwd)/ext/`"
    fi

    #  Make sure we have one.
    MVN="${DIRNAME}/mvnw"
    if [ ! -x "$MVN" ]; then
        die "Maven binary is not executable: $MVN"
>>>>>>> a73b1183e1c8093a64d060c8471ab7d63d8e0a82
    fi

    #  Need to specify planet57/buildmagic protocol handler package.
    MVN_OPTS="-Djava.protocol.handler.pkgs=org.jboss.net.protocol"

    #  Setup some build properties
    MVN_OPTS="$MVN_OPTS -Dbuild.script=$0"

<<<<<<< HEAD
    #  un in non-interactive (batch) mode
    MVN_OPTS="$MVN_OPTS -B"

=======
>>>>>>> a73b1183e1c8093a64d060c8471ab7d63d8e0a82
    #  Change to the directory where the script lives, so users are not forced
    #  to be in the same directory as build.xml.
    cd $DIRNAME

<<<<<<< HEAD
    #  Add default settings before calling maven.
    MVN_SETTINGS_XML_ARGS="-s tools/maven/conf/settings.xml"
=======
>>>>>>> a73b1183e1c8093a64d060c8471ab7d63d8e0a82
    MVN_GOAL="";
    ADDIT_PARAMS="";
    #  For each parameter, check for testsuite directives.
    for param in "$@" ; do
        case $param in
<<<<<<< HEAD
            ## -s .../settings.xml - don't use our own.
            -s)      MVN_SETTINGS_XML_ARGS="";   ADDIT_PARAMS="$ADDIT_PARAMS $param";;
            -*)      ADDIT_PARAMS="$ADDIT_PARAMS '$param'";;
            help*)   MVN_GOAL="$MVN_GOAL$param ";;
=======
            -*)      ADDIT_PARAMS="$ADDIT_PARAMS '$param'";;
>>>>>>> a73b1183e1c8093a64d060c8471ab7d63d8e0a82
            clean)   MVN_GOAL="$MVN_GOAL$param ";;
            test)    MVN_GOAL="$MVN_GOAL$param ";;
            install) MVN_GOAL="$MVN_GOAL$param ";;
            deploy)  MVN_GOAL="$MVN_GOAL$param ";;
            site)    MVN_GOAL="$MVN_GOAL$param ";;
            *)       ADDIT_PARAMS="$ADDIT_PARAMS '$param'";;
        esac
    done
    #  Default goal if none specified.
    if [ -z "$MVN_GOAL" ]; then MVN_GOAL="install"; fi

    #  Export some stuff for maven.
<<<<<<< HEAD
    export MVN MAVEN_HOME MVN_OPTS MVN_GOAL

    # The default arguments.  `mvn -s ...` will override this.
    MVN_ARGS=${MVN_ARGS:-"$MVN_SETTINGS_XML_ARGS"};

    echo "$MVN $MVN_ARGS $MVN_GOAL $ADDIT_PARAMS"

    #  Execute in debug mode, or simply execute.
    if [ "x$MVN_DEBUG" != "x" ]; then
        eval /bin/sh -x $MVN $MVN_ARGS $MVN_GOAL $ADDIT_PARAMS
    else
        eval exec       $MVN $MVN_ARGS $MVN_GOAL $ADDIT_PARAMS
=======
    export MVN MVN_OPTS MVN_GOAL

    echo "$MVN $MVN_OPTIONS $MVN_GOAL $ADDIT_PARAMS"

    # workaround in case 'mvn -f' is not supported
    if [ "$PRESERVE_WORKING_DIR" = "true" ]; then cd "$ORIG_WORKING_DIR"; fi

    #  Execute in debug mode, or simply execute.
    if [ "x$MVN_DEBUG" != "x" ]; then
        eval /bin/sh -x $MVN $MVN_OPTIONS $MVN_GOAL $ADDIT_PARAMS
    else
        eval exec $MVN $MVN_OPTIONS $MVN_GOAL $ADDIT_PARAMS
>>>>>>> a73b1183e1c8093a64d060c8471ab7d63d8e0a82
    fi
}

##
##  Bootstrap
##
main "$@"
