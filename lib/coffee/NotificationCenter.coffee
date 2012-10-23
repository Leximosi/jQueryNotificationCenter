###
 * Copyright 2012 Erik Frèrejean
 * Released under the MIT license
 * http://leximosi.github.com
###

###
NotificationCenter object instance
###
_notificationCenter = undefined

###
NotificationCenter class.
Allows you to easily send notifications on OS X in supported
browsers
###
class NotificationCenter
	constructor: ->
		@notificationCenterAvailable	= if window.webkitNotifications? then true else false
		@notificationRequestAction		= ->

	###
Send a notification
@param String notification The string that will be send
	###
	notify: ->
		if _notificationCenter.hasNotificationCenter() is true
			switch @getPermission()
				when 0
					_notification = webkitNotifications.createNotification null, @notificationTitle, @notificationBody
					if @notificationAction isnt 'undefined' then _notification.onclick = @notificationAction
					_notification.show()
				when 1
					webkitNotifications.requestPermission => @notify()
				when 2
					@notificationBlockedAction()

	###
Returns whether the users browser supports Notification Center
	###
	hasNotificationCenter: ->
		return @notificationCenterAvailable

	###
Ask the user to give permission for this site.
This can *only* be done if the user never did
this before

@param callback callback The action performed after the permission is set
	###
	askPermission: (callback) ->
		if _notificationCenter.hasNotificationCenter() is true
			callback = callback or @notificationRequestAction()
			if webkitNotifications.checkPermission() is 1
				webkitNotifications.requestPermission callback

	###
Get the permission the user gave to this site

0 = User granted permission to show notifications.
1 = No permission set yet.
2 = User blocked notifications.
	###
	getPermission: ->
		if _notificationCenter.hasNotificationCenter() is true
			return webkitNotifications.checkPermission()

	###
Setup the notification

@param String notificationTitle
@param String notificationBody
@param callback notificationAction
	###
	setNotification: (@notificationTitle, @notificationBody, @notificationAction) ->

	###
Set the action performed after requesting permissions
	###
	setRequestAction: (@notificationRequestAction) ->

	###
Set the action performed when the user blocked notifications
	###
	setBlockedAction: (@notificationBlockedAction) ->
