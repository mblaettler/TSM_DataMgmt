public static void nativeQuery(ObjectContainer db) {
	List<Pilot> result = db.query(new Predicate<Pilot>() {
    public boolean match(Pilot pilot) {
    	return pilot.getPoints() > 99
    		&& pilot.getPoints() < 199
    		|| pilot.getName().equals("Rubens Barrichello");
    	}
    });
    // do something with result
}