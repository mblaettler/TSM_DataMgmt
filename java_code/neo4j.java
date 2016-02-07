DROP INDEX IN :Person(name)

MATCH(person:Person) WHERE person.name = 'Andres' RETURN person