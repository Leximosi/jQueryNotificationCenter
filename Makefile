#
# Copyright 2012 Erik Frèrejean 
# Released under the MIT license
# http://leximosi.github.com
#

all: clean build uglify

clean:
	if [ -a ./lib/jQueryNotificationCenter.js ] ; \
	then \
		rm ./lib/jQueryNotificationCenter.js ; \
	fi;

	if [ -a ./lib/jQueryNotificationCenter.min.js ] ; \
	then \
		rm ./lib/jQueryNotificationCenter.min.js ; \
	fi;

build:
	coffee -l -c -j jQueryNotificationCenter.js -o lib/ ./lib/coffee/*.coffee

uglify:
	uglifyjs -o ./lib/jQueryNotificationCenter.min.js -mt ./lib/jQueryNotificationCenter.js 
