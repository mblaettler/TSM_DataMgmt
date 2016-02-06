// with specific object
public static void query1(ObjectContainer db) {
    Pilot proto = new Pilot(null, 0);
	ObjectSet result = db.queryByExample(proto);
    // do something with result
}

// with class
public static void query2(ObjectContainer db) {
	ObjectSet result = db.queryByExample(Pilot.class);
    // do something with result
}