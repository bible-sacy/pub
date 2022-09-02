#!/usr/bin/env bash
export FOLDERS=$(echo S_* NT_*)

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