db.collection.insert(Document)

db.users.update({age:{$gt:18}},
	{$set:{status:"A"}},
	{multi:true}
)

db.users.remove({status:"D"})

db.collection.find(
	{age:{$gt:18}},
	{name:1, address:1}
).limit(5)