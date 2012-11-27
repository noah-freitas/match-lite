What Is This?
=============
Select from, filter, and mutate your JavaScript objects using jQuery-like selection
syntax with some added sugar.  Use it with your own created objects or JSON data.

Examples
========
Basic Selection
---------------
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

Hierarchy Selection
-------------------
```javascript
// Describe an object hierarchy
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
var nameProp = m(myObject)('* name');
// nameProp === ['Another Object', 'Yet Another', 'And Another']
```
Selects the `name` property of any nested object that has at least one level
between it and the root element.

Multiple Property Selection
---------------------------
```javascript
// Select multiple properties, while maintaining their relationship.
var myObject = {
	name: 'My Object',
	num: 5,
	anotherObject: {
		name: 'Another Object'
	},
	yetAnother: {
		name: 'Yet Another',
		num: 4,
		andAnother: {
			name: 'And Another',
			num: 3
		}
	}
};
var nameProp = m(myObject)('{name, num}');
// nameProp === [
//	{name: 'My Object', num: 5},
//	{name: 'Another Object'},
//	{name: 'Yet Another', num: 4},
//	{name: 'And Another', num: 3}
// ]
```
Selects multiple properties from each level of the object hierarchy and maintains
property correlation.  This syntax `{}` is lenient and will include an object even
if it does not contain all the selected properties.  `{{}}` (double curly braces)
will only include an object in the selection if all the selected properties are
not `undefined`.  Using double curly braces in the selection above would have
omitted `{name: 'Another Object'}` from the selection.

Guards
======
```javascript
// Select the object whose name property equals "Peter" and return an
// object containing its name, phone, and address properties. 
}
var person = m(jsonData)('{ name= "Peter", phone, address }');
```
