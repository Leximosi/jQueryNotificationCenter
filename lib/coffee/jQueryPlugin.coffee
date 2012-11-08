###
 * Copyright 2012 Erik Frèrejean 
 * Released under the MIT license
 * http://leximosi.github.com
###
(($) ->
	$.extend true
		'NotificationCenter': (method) ->
			_jQueryNotificationCenterObject = new jQueryNotificationCenter() if _jQueryNotificationCenterObject is undefined

			if jQueryNotificationCenter.prototype[method] is undefined
				$.error "Method: #{method} does not exist on jQueryNotificationCenter"

			if method is "hasNotificationCenter"
				_jQueryNotificationCenterObject.hasNotificationCenter()
			else if _jQueryNotificationCenterObject.hasNotificationCenter() is true
				jQueryNotificationCenter.prototype[method].apply _jQueryNotificationCenterObject, Array.prototype.slice.call arguments, 1;
) jQuery
