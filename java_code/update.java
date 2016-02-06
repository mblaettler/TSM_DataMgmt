public static void updatePilot(ObjectContainer db) {
	ObjectSet result = db.queryByExample(new Pilot("Pilot", 0));
    Pilot found = (Pilot) result.next();
    found.addPoints(11);
    db.store(found);
}