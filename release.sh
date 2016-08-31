## Create a .tar file suitable for package.el

set -e
files="*.el"
name=auto-answer
version=1
tmpdir=$(mktemp -d)
subdir=$name-$version
reldir=$tmpdir/$subdir
pkgfile=$reldir/$name-pkg.el
tarball=$subdir.tar

mkdir "$reldir"

cat > $pkgfile <<EOF
;;; -*- no-byte-compile: t -*-
(define-package
  "$name"
  "$version"
  "Avoid prompting conditionnaly"
  '((dash "2.13")))
EOF


cp $files "$reldir"
tar -C "$tmpdir" -c -f "$tarball" "$subdir"
rm -rf "$reldir"
if [ -e "$tarball" ]; then
    echo "Created release $tarball."
    exit 0
else
    echo "Can't produce tarball." >&2
    exit 1
fi
