###
 * Copyright 2012 Erik Frèrejean 
 * Released under the MIT license
 * http://leximosi.github.com
###
(($) ->
	$.extend true
		'NotificationCenter': (method) ->
			if _notificationCenter is undefined then _notificationCenter = new NotificationCenter()

			if NotificationCenter.prototype[method] is undefined
				$.error "Method: #{method} does not exist on jQuery.NotificationCenter"

			NotificationCenter.prototype[method].apply(_notificationCenter, Array.prototype.slice.call(arguments, 1));
) jQuery
