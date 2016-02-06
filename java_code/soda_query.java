public static void sodaNegation(ObjectContainer db) {
    Query query = db.query();
    query.constrain(Pilot.class);
    query.descend("name").constrain("Michael Schumacher").not();
	ObjectSet result = query.execute();
    // do something with result
}