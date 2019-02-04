MATCH(person:Person) WHERE person.name = 'Andres' RETURN person

// Insert node and relationship:
CREATE (adam:User { name: 'Adam' }),
(pernilla:User { name: 'Pernilla' }),
(david:User { name: 'David'}),
(adam)-[:FRIEND]->(pernilla),(pernilla)-[:FRIEND]->(david)
// Insert relationship
MATCH (u:User { name: "Adam" }), (c:User { name: "David"})
CREATE (u)-[:FRIEND]->(c)
// Run Queries:
MATCH (user:User {name:"Adam"})-[:FRIEND]->(friend)
WHERE friend.name = "Pernilla"
RETURN user,friend
ORDER BY friend.name
LIMIT 10
