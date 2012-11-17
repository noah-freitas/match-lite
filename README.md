match-lite
==========

jQuery style object selection and manipulation.

Examples
========

Selection
---------

```javascript
// Most basic property selection.
var myObject = {
	name: 'My Object'
};

var nameProp = m(myObject)('name');
// nameProp === 'My Object'
```
This is not very exciting, and it's slower and less useful than `myObject.name`.
It will get better.

```javascript
// Nested property selection
var myObject = {
	anotherObject: {
		name: 'Another Object'
	}
};
var nameProp = m(myObject)('name');
// nameProp === 'Another Object'
```
This is a little more useful and not just an alias for built-in property access.

```javascript
// Property aggregation
var myObject = {
	name: 'My Object',
	anotherObject: {
		name: 'Another Object'
	},
	yetAnother: {
		name: 'Yet Another'
		andAnother: {
			name: 'And Another'
		}
	}
};
var nameProp = m(myObject)('name');
// nameProp === ['My Object', 'Another Object', 'Yet Another', 'And Another']
```
Found every `name` property of `myObject` and its nested objects.
