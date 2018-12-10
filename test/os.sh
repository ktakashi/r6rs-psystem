#!/bin/sh

declare -a implementations=(sagittarius@0.9.2 chez@v9.5 larceny@1.3)
name=`uname`
EXIT_STATUS=0
for impl in ${implementations[@]}; do
    echo Testing with ${impl}
    scheme-env run ${impl} --loadpath ../lib --loadpath ../deps/pffi/src \
	       --standard r6rs --program os.scm -- $name
    case ${EXIT_STATUS} in
	0) EXIT_STATUS=$? ;;
    esac
    echo Done!
    echo
done

echo OS detection test status ${EXIT_STATUS}
exit ${EXIT_STATUS}
