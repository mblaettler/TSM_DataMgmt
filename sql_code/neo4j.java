// create index
DROP INDEX IN :Person(name)

// query with index
MATCH(person:Person) WHERE person.name = 'Andres' RETURN person