#!/bin/bash

echo "Update modification time for ROMs"

pushd ~/RetroPie/roms

find . -print0 | xargs -0 touch -hc
echo "done."

popd
