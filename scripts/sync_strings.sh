#!/bin/sh

# Sync our translation template file with the actual strings
# 1. Extracts strings from glade files into .h fileS
# 2. Extracts gettext strings from py files
# 3. Deletes the glade .h files

cd ../rabbitvcs

for i in `find . | grep '\.glade' | grep -v '\.svn'`;
do
	intltool-extract --type=gettext/glade $i
done

xgettext -L Python --keyword=_ --keyword=N_ -o po/RabbitVCS.pot -f po/POTFILES.in

for i in `find . | grep '\.glade\.h' | grep -v '\.svn'`;
do
	rm -f $i
done
