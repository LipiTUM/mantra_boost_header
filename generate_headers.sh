#!/usr/bin/bash

boost_archive="boost_1_77_0.tar.gz"
boost_url="https://boostorg.jfrog.io/artifactory/main/release/1.77.0/source"
if [ ! -f $boost_archive ]; then
	echo "Downloading boost archive from $boost_url/$boost_archive"
	wget "$boost_url/$boost_archive"
fi

if [ ! -d "boost_1_77_0/boost" ]; then
	echo "Extracting files from boost archive $boost_archive"
	tar zxf $boost_archive
fi

mv boost_1_77_0/LICENSE_1_0.txt .

declare -a modules=("accumulators"
				    "align"
					"any"
					"archive"
					"asio"
					"assert"
					"assign"
					"atomic"
					"beast"
					"bimap"
					"bind"
					"callable_traits"
					"chrono"
					"circular_buffer"
					"concept"
					"context"
					"contract"
					"convert"
					"coroutine"
					"date_time"
					"describe"
					"dll"
					"dynamic_bitset"
					"endian"
					"fiber"
					"flyweight"
					"fusion"
					"geometry"
					"gil"
					"histogram"
					"hof"
					"lexical_cast"
					"metaparse"
					"multiprecision"
					"nowide"
					"numeric"
					"outcome"
					"parameter"
					"pending"
					"pfr"
					"phoenix"
					"poly_collection"
					"polygon"
					"python"
					"qvm"
					"signals2"
					"test"
					"timer"
					"tti"
					"vmd"
					"wave"
					"xpressive"
					"yap"
				   )

echo "Removing unused boost modules"
for module in "${modules[@]}"
do
	if [ -d "boost_1_77_0/boost/$module" ]; then
		echo "Removing $module"
		rm -r "boost_1_77_0/boost/$module"
	fi
	if [ -f "boost_1_77_0/boost/$module*.hpp" ]; then
		echo "Removing $module*.hpp"
		rm "boost_1_77_0/boost/$module*.hpp"
	fi
done

mv boost_1_77_0/boost .
rm -r boost_1_77_0

echo "Removing boost archive"
rm boost_1_77_0.tar.gz

