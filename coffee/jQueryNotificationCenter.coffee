###
 * Copyright 2012 Erik Frèrejean
 * Released under the MIT license
 * http://leximosi.github.com
###

###
NotificationCenter object instance
###
_jQueryNotificationCenterObject = undefined

###
NotificationCenter class.
Allows you to easily send notifications on OS X in supported
browsers
###
class jQueryNotificationCenter
	@PERMISSIONSET:			0
	@PERMISSIONNOTSET:		1
	@PERMISSIONSETBLOCKED:	2

	constructor: (notificationTitle, notificationBody, notificationAction, notificationRequestAction, notificationBlockedAction) ->
		@notificationCenterAvailable	= if window.webkitNotifications is undefined then false else true

		@setNotification notificationTitle, notificationBody, notificationAction
		@setRequestAction notificationRequestAction
		@setBlockedAction notificationBlockedAction

	###
Send a notification
@param String notification The string that will be send
	###
	notify: ->
		switch @getPermission()
			when @PERMISSIONSET
				notification			= webkitNotifications.createNotification null, @notificationTitle, @notificationBody
				notification.onclick	= @notificationAction if @notificationAction isnt undefined
				notification.show()
			when @PERMISSIONNOTSET
				webkitNotifications.requestPermission => @notify()
			when @PERMISSIONSETBLOCKED
				@notificationBlockedAction() if @notificationBlockedAction isnt undefined

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
	askPermission: (callback = @notificationRequestAction()) ->
		webkitNotifications.requestPermission callback

	###
Get the permission the user gave to this site

0 = User granted permission to show notifications.
1 = No permission set yet.
2 = User blocked notifications.
	###
	getPermission: ->
		return webkitNotifications.checkPermission()

	###
Setup the notification

@param String notificationTitle
@param String notificationBody
@param callback notificationAction
	###
	setNotification: (@notificationTitle = '', @notificationBody = '', @notificationAction = undefined) ->

	###
Set the action performed after requesting permissions
	###
	setRequestAction: (@notificationRequestAction = undefined) ->

	###
Set the action performed when the user blocked notifications
	###
	setBlockedAction: (@notificationBlockedAction = undefined) ->
