# jQuery Character Counter

A basic jQuery plugin that uses a simple, overridable method to display the character count.

## Setup

1. Include the file as you typically would in your asset pipeline, via a `<script>` tag, etc.
2. Add the count container element.  Example: `<div class="character-counter" data-count-target="#target-to-count"></div>`
3. Make sure the element specified in `data-count-target` attribute has a `maxlength` attribute set
4. Initialize the plugin: `$('.character-counter').characterCounter();`

## Overrides

There are three overridable options:

1. __maxLength:__ sets the default maximum length for the character counter, in case the maxlength attribute is not set on the target
2. __target:__ sets the target input element to count characters on. can be set as an option override if you are too lazy to set the data attribute
3. __template:__ sets the output of count. default: `"<strong>{{cnt}}</strong> of {{len}} characters allowed"`
	- **{{cnt}}** signifies the current count of the string
	- **{{len}}** specifies the maximum length the string can be
