INSERT INTO type_vehicule VALUES
    (null, "Berline"),
    (null, "Grue"),
    (null, "Intervention")
    ;

INSERT INTO ville VALUES
    (95100, "Argenteuil"),
    (92230, "Gennevilliers"),
    (92600, "Asnières-Sur-Seine"),
    (69000, "Lyon"),
    (75000,"Paris"), 
    (92800, "Puteaux")
    ;

INSERT INTO parking VALUES
    (null, 25, 92600, "ENEDIS I105", "119 avenue d'Argenteuil"),
    (null, 25, 69000, "ENEDIS PC034", "12 rue Vernone"),
    (NULL, 100, 92800, "parking 1", "82 rue Paul Bert"),
    (NULL, 200, 69000, "parking 2", "2 Rue Maurice Payret Dortail"),
    (NULL, 50, 75000, "parking 3", "12 Rue de Clér")
    ;

/* 1 = dispo et 2 = non-dispo */
INSERT INTO place VALUES 
    (null, 1, 6),
    (null, 1, 6),
    (null, 1, 6),
    (null, 2, 7),
    (null, 1, 7),
    (null, 2, 7),
    (null, 1, 7),
    (null, 2, 7)
    ;

INSERT INTO vehicule VALUES
    (NULL, "AA-123-AA","206", "Peugeot", 1, 1,10), 
    (NULL, "AB-122-AB","Zoé", "Renault", 1, 1,11),  
    (NULL, "ZZ-478-RT","Logan", "Dacia", 1, 1,16),
    (NULL, "CT-238-AT","Kangoo", "Renault", 1, 4,17)
    ; 