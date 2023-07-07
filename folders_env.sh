#!/usr/bin/env bash
export FOLDERS=$(echo AT_* NT_* S_*)

function foreach_folder {
    for folder in $FOLDERS
    do
        pushd $folder >/dev/null
        echo "## ./$folder\$ $@"
        echo
        $@
        echo
        popd >/dev/null
    done
}