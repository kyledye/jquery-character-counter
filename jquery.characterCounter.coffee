do ($ = jQuery, window, document) ->

	pluginName = "characterCounter"
	defaults =
		maxLength: 255
		target: ""
		template: "<strong>{{cnt}}</strong> of {{len}} characters allowed"

	class Plugin
		constructor: (@element, options) ->
			@settings = $.extend {}, defaults, options
			@_defaults = defaults
			@_name = pluginName
			@init()

		init: ->
			@getMaxLength()
			@setCount()
			@bindEvents(@)
			return

		bindEvents: (me) ->
			me.setCount()
			$(@settings.target).on 'keyup', ->
				me.setCount()

		setCount: ->
			len = @getStringLength()
			max = @settings.maxLength
			str = @settings.template.replace(/\{\{cnt\}\}/ig, len).replace(/\{\{len\}\}/ig, max)
			$(@element).empty().append(str)
		
		getStringLength: ->
			len = $(@settings.target).val()
			len.length

		getMaxLength: ->
			tgt = $(@element).data "count-target"
			@settings.target = tgt
			len = parseInt $(tgt).attr('maxlength')

			if len == undefined
				len = @settings.maxLength
			else
				@settings.maxLength = len

			len

	$.fn[pluginName] = (options) ->
		@each ->
			unless $.data @, "plugin_#{pluginName}"
				$.data @, "plugin_#{pluginName}", new Plugin @, options