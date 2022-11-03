#!/bin/bash

echo "Fix permissions of ROM files"

pushd ~/RetroPie/roms

echo "set owner:group to pi:pi . . ."
sudo chown -R pi:pi .
echo "done."

echo "set user and group read/write permissions . . ."
chmod -R ug+rw .
echo "done."

popd
