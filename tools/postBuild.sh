toolsDir=$(realpath "$(pwd)/$(dirname $0)")
baseDir=`dirname "${toolsDir}"`
platform=`uname`
name="$1"
prefix="$2"
version="$3"

# print spacers
echo ""
echo ""

zipname="$name-v$version"

echo "Packing $zipname"

if [[ ${platform} == "Linux" ]]; then
	tar -czf "$baseDir/releases/${zipname}.tar.gz" -C "${baseDir}/releases/${version}" "@${name}"
	(cd ${baseDir}/releases/${version}; zip -r ${zipname}.zip "@${name}")
else
	pushd "${baseDir}/releases/$version"
		# check zipper
		if [ ! -e "${zip_path}" ]; then
			zip_path="${toolsDir}/zip.exe"
		fi

		if [ ! -e "${zip_path}" ]; then
			echo "warning: zip.exe not found, will not zip mod release!"
			exit 1
		fi

		"${zip_path}" -r "${baseDir}/releases/${version}/${zipname}.zip" "@${name}"
	popd
fi

mv "${baseDir}/releases/${version}/${zipname}.zip" "${baseDir}/releases/${zipname}.zip"

# print spacers
echo ""
echo ""
