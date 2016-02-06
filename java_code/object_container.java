ObjectContainer db = Db4oEmbedded.openFile(Db4oEmbedded.newConfiguration(), "pilot.db");
try {
    // ...
    } finally {
        db.close();
    }
}