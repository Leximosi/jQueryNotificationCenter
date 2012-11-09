#
# Copyright 2012 Erik Frèrejean 
# Released under the MIT license
# http://leximosi.github.com
#

all: clean test build uglify

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
	coffee -lcj jQueryNotificationCenter.js -o lib/ ./coffee/*.coffee

test:
	coffeelint -f ./coffee/lint.json ./coffee/*.coffee

uglify:
	uglifyjs -o ./lib/jQueryNotificationCenter.min.js -mt ./lib/jQueryNotificationCenter.js 
