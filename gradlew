#!/bin/sh
# Gradle wrapper script for Unix
set -e

# Determine the OS
GRADLE_WRAPPER_JAR="$(dirname "$0")/gradle/wrapper/gradle-wrapper.jar"
GRADLE_WRAPPER_PROPERTIES="$(dirname "$0")/gradle/wrapper/gradle-wrapper.properties"

exec java -jar "$GRADLE_WRAPPER_JAR" "$@"
