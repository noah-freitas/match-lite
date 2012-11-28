retrieve = (obj, prop) ->
  found = []

  # If obj isn't an object return an empty array.
  if typeof obj isnt 'object'
    return found

  # If this obj has our search prop, attach it to found.
  found.push(obj[prop]) if obj[prop] isnt undefined

  # Search any nested objects.
  for own property of obj
    foundNested = retrieve(obj[property], prop)
    # Append the nested found properties if we found any.
    found = found.concat(foundNested) if foundNested.length > 0

  found


MatchLite = (@obj) ->
MatchLite::get = (selector) ->
  retrieve(@obj, selector)

matchLite = (obj) -> new MatchLite(obj)

# export as 'matchLite'
window.matchLite = matchLite
