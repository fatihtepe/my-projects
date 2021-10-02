CREATE TABLE phonebook_db.phonebook(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    number VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO phonebook_db.phonebook (name, number)
    VALUES
        ("Uygur", "1234567890"),
        "Callahan", "4567890")
        ("Ali", "67854"),
        "Vincenzo", "1237890")
        ("Fatih Tepe", "88888888");