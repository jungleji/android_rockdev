#!/bin/bash -e

cd `dirname $0` 

echo "start to make update.img..."
if [ ! -f "parameter" ]; then
	echo "Error:No found parameter!"
	exit 1
fi

if [ ! -f "package-file" ]; then
	echo "Error:No found package-file!"
	exit 1
fi

./afptool -pack ./ Image/update_tmp.img || pause
./rkImageMaker -RK31 RK3188Loader\(L\)_V2.10.bin Image/update_tmp.img update.img -os_type:androidos
echo "Making update.img OK."
echo "update.img is at `pwd`/update.img"
exit 0
