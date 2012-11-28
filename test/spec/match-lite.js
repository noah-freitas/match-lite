describe('MatchLite::get', function () {
	it('should retrieve a top level property.', function () {
		var person = {
			name: 'Noah'
		};
		expect((matchLite(person)).get('name')[0]).toBe('Noah');
	});
});