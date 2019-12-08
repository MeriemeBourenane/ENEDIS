/* TABLES:
    - service
    - utilisateur
    - employer
    - manager
    - ville
    - parking
    - place
    - type_vehicule
    - vehicule
    - demande
    - garage
    - controle_technique
    - archivage_vehicule 
*/
DROP DATABASE IF EXISTS enedis_ppe1;
CREATE DATABASE enedis_ppe1;
USE enedis_ppe1;

CREATE TABLE ville(
    code_postal INT(5) NOT NULL,
    libelle VARCHAR(50), 
    PRIMARY KEY(code_postal)
)
ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_bin;

CREATE TABLE service(
    id_service INT(5) NOT NULL AUTO_INCREMENT,
    libelle VARCHAR(50), 
     code_postal INT(5),
    PRIMARY KEY(id_service), 
    FOREIGN KEY (code_postal) REFERENCES ville(code_postal)
)
ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_bin;

/* ---------- START Héritage ---------- */
CREATE TABLE utilisateur(
    id_utilisateur INT(5) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(50),
    mot_de_passe VARCHAR(50),
    id_service INT(5) NOT NULL,
    PRIMARY KEY(id_utilisateur),
    FOREIGN KEY(id_service) REFERENCES service(id_service)
)
ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_bin;
/* ajouter le nni */
CREATE TABLE employer(
    libelle_emploi VARCHAR(50),
    id_utilisateur INT(5) NOT NULL,
    PRIMARY KEY(id_utilisateur),
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateur(id_utilisateur)
)
ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_bin;

CREATE TABLE manager(
    libelle_emploi VARCHAR(50),
    admin BOOLEAN,
    date_fonction DATE,
    id_utilisateur INT(5) NOT NULL,
    PRIMARY KEY(id_utilisateur),
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateur(id_utilisateur)
)
ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_bin;
/* ---------- END Héritage ---------- */



CREATE TABLE parking(
    id_parking INT(5) NOT NULL AUTO_INCREMENT,
    libelle VARCHAR(50),
    capacite INT(5),
    adresse VARCHAR(50),
    code_postal INT(5) NOT NULL, 
    PRIMARY KEY(id_parking),
    FOREIGN KEY(code_postal) REFERENCES ville(code_postal)
)
ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_bin;

CREATE TABLE place(
    id_place INT(5) NOT NULL AUTO_INCREMENT,
    statut BOOLEAN,
    id_parking INT(5) NOT NULL,
    PRIMARY KEY(id_place),
    FOREIGN KEY(id_parking) REFERENCES parking(id_parking)
)
ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_bin;

CREATE TABLE type_vehicule(
    id_type INT(5) NOT NULL AUTO_INCREMENT,
    libelle VARCHAR(255),
    PRIMARY KEY(id_type)
)
ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_bin;

CREATE TABLE vehicule(
    id_vehicule INT(5) NOT NULL AUTO_INCREMENT,
    plaque_immatriculation VARCHAR(255),
    modele VARCHAR(255),
    marque VARCHAR(255),
    statut BOOLEAN,
    id_type INT(5) NOT NULL,
    id_place INT(5) NOT NULL,
    PRIMARY KEY(id_vehicule),
    FOREIGN KEY(id_type) REFERENCES type_vehicule(id_type),
    FOREIGN KEY(id_place) REFERENCES place(id_place)
)
ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_bin;

/* date debut à date fin */
CREATE TABLE demande(
    id_demande INT(5) NOT NULL AUTO_INCREMENT,
    date_demande DATE,
    date_debut_depla DATE,
    date_fin_depla DATE,
    motif VARCHAR(255),
    lieu_depart VARCHAR(255),
    lieu_dest VARCHAR(255),
    chemin_pdf VARCHAR(255),
    statut VARCHAR(255),
    visible INT(5), /*1 pour visible et 0 pour supprimée  */
    id_utilisateur INT(5) NOT NULL,
    id_vehicule INT(5) NOT NULL,
    PRIMARY KEY(id_demande),
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateur(id_utilisateur),
    FOREIGN KEY(id_vehicule) REFERENCES vehicule(id_vehicule)
)
ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_bin;

CREATE TABLE garage(
    id_garage INT(5) NOT NULL AUTO_INCREMENT,
    numero_telephone VARCHAR(255),
    adresse VARCHAR(255),
    code_postal INT(5) NOT NULL, 
    PRIMARY KEY(id_garage), 
    FOREIGN KEY(id_place) REFERENCES place(id_place)
)
ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_bin;

CREATE TABLE controle_technique(
    id_controle_technique INT(5) NOT NULL AUTO_INCREMENT,
    date_controle DATE,
    etat VARCHAR(255),
    id_vehicule INT(5) NOT NULL,
    id_garage INT(5) NOT NULL,
    PRIMARY KEY(id_controle_technique),
    FOREIGN KEY(id_vehicule) REFERENCES vehicule(id_vehicule),
    FOREIGN KEY(id_garage) REFERENCES garage(id_garage)
)
ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_bin;

/* ---------- START archivage des véhicules  ---------- */
CREATE TABLE archivage_vehicule(
    id_vehicule INT(5) NOT NULL,
    plaque_immatriculation VARCHAR(255),
    modele VARCHAR(255),
    marque VARCHAR(255),
    statut BOOLEAN,
    id_demande INT(5) NOT NULL,
    id_type INT(5) NOT NULL,
    PRIMARY KEY(id_vehicule),
    FOREIGN KEY(id_vehicule) REFERENCES vehicule(id_vehicule),
    FOREIGN KEY(id_demande) REFERENCES demande(id_demande),
    FOREIGN KEY(id_type) REFERENCES type_vehicule(id_type)
)
ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_bin;
/* ---------- END archivage des véhicules  ---------- */


/* VIEWS
   - list_demande_manager
   - list_demande_user
   - list_employer
   - list_manager 
   - one_vehicule
   - 
*/

CREATE VIEW list_demande_manager AS(
   SELECT d.date_demande AS date_demande, d.date_debut_depla 
   AS date_debut, d.date_fin_depla as date_fin, 
   d.statut AS statut_demande, d.id_demande AS id_demande, 
   u.nom AS nom_employer, u.prenom AS prenom_employer 
   FROM demande d 
   INNER JOIN utilisateur u 
   ON d.id_utilisateur = u.id_utilisateur
); 


CREATE VIEW list_demande_user AS (
    SELECT d.date_demande AS date_demande, d.date_debut_depla AS date_debut, 
    d.date_fin_depla AS date_fin, d.statut AS statut_demande, d.id_demande AS
    id_demande, d.lieu_depart AS lieu_depart, d.lieu_dest AS lieu_destination, 
    d.motif AS motif, v.modele AS vehicule_modele, 
    v.plaque_immatriculation AS immatriculation, t.libelle AS type_vehicule
    FROM demande d 
    INNER JOIN vehicule v 
    ON d.id_vehicule = v.id_vehicule
    INNER JOIN type_vehicule t 
    ON v.id_type = t.id_type
); 

CREATE VIEW list_employer AS
(
    SELECT u.id_utilisateur AS id_utilisateur, u.nom AS nom, u.prenom, u.email AS
    email, u.mot_de_passe AS mot_de_passe, s.libelle AS nom_service, e.libelle_emploi AS
    nom_emploie
    FROM employer e
    INNER JOIN utilisateur u 
    ON e.id_utilisateur = u.id_utilisateur
    INNER JOIN service s 
    ON u.id_service = s.id_service 
); 

CREATE VIEW one_vehicule AS 
(
    SELECT v.id_vehicule AS id_vehicule, v.plaque_immatriculation AS plaque_immatriculation,
    v.modele AS modele, v.marque AS marque, v.statut AS STATUT, t.libelle AS nom_type, 
    p.id_place AS id_place, p.capacite AS capacite, p.statut AS statut_place, 
    pa.libelle AS nom_parking, pa.capacite AS parking_capacite, pa.adresse AS
    adresse,  vi.code_postal AS code_postal, vi.libelle AS nom_ville
    FROM vehicule v
     INNER JOIN type_vehicule t
    ON v.id_type = t.id_type
    INNER JOIN place p
    ON v.id_place = p.id_place 
    INNER JOIN parking pa
    ON p.id_parking = pa.id_parking 
    INNER JOIN ville vi
    ON pa.code_postal = vi.code_postal
); 

/*TRIGGER
    - archivage_vehicule
*/

/*Ne fonctionne pas*/ 
DELIMITER $
CREATE TRIGGER archivage_vehicule BEFORE DELETE 
ON vehicule 
FOR EACH ROW 
BEGIN 
    INSERT archivage_vehicule(null, old.plaque_immatriculation, old.modele, 
    old.marque, old.statut, old.id_demande, old.id_type)
END $
DELIMITER ; 


/*PROCEDURE STOCKER
    - select_vehicule_type
    - select_demande_statue
    - insert_employer
    - insert_manager
    - edit_employer
    - edit_manager
    - suppr_employer 
    - suppr_manager
*/ 
DELIMITER $
CREATE PROCEDURE select_vehicule_type (IN un_type VARCHAR(255))
BEGIN 
    SELECT * FROM vehicule v
    INNER JOIN type_vehicule t
    ON v.id_type = t.id_type 
    WHERE t.libelle = un_type; 
END $
DELIMITER ;

DELIMITER $
CREATE PROCEDURE select_demande_statue (IN un_statue VARCHAR(255))
BEGIN
    SELECT * from list_demande_manager
    WHERE statut_demande = un_statue; 
END $ 
DELIMITER ; 


/* ---------- START Héritage ---------- */
DELIMITER $
CREATE PROCEDURE insert_employer (IN enom VARCHAR(50), IN eprenom VARCHAR(50), 
IN eemail VARCHAR(50), IN emot_de_passe VARCHAR(50), eid_service INT(5), 
IN elibelle_emploie
VARCHAR(50))
BEGIN
    DECLARE id INT(5); 
    INSERT INTO utilisateur 
    VALUES (NULL, enom, eprenom, eemail, emot_de_passe, eid_service); 
    SELECT id_utilisateur INTO id FROM utilisateur WHERE email = eemail; 
    INSERT INTO employer VALUES(elibelle_emploie, id); 
END $
DELIMITER ; 

DELIMITER $
CREATE PROCEDURE insert_manager (IN m_nom VARCHAR(50), IN m_prenom VARCHAR(50), 
IN m_email VARCHAR(50), IN m_mot_de_passe VARCHAR(50), m_id_service INT(5), 
IN m_libelle_emploie VARCHAR(50), BOOLEAN m_admin,  IN m_date_fonction DATE)
BEGIN
    DECLARE id INT(5); 
    INSERT INTO utilisateur
    VALUES (NULL, m_nom, m_prenom, m_email, m_mot_de_passe, m_id_service); 
        SELECT id_utilisateur INTO id FROM utilisateur WHERE email = m_email; 
    INSERT INTO manager VALUES(m_libelle_emploie,m_admin, m_date_fonction, id); 
END $
DELIMITER ; 

DELIMITER $
CREATE PROCEDURE edit_employer ()
BEGIN

END $
DELIMITER ; 

DELIMITER $
CREATE PROCEDURE edit_manager ()
BEGIN

END $
DELIMITER ; 

DELIMITER $
CREATE PROCEDURE suppr_employer ()
BEGIN

END $
DELIMITER ; 

DELIMITER $
CREATE PROCEDURE  suppr_manager ()
BEGIN

END $
DELIMITER ; 
/* ---------- END Héritage ---------- */


/*INSERTION SQL
    - service
    - utilisateur
    - employer
    - manager
    - ville
    - parking
    - place
    - type_vehicule
    - vehicule
    - demande
    - garage
    - controle_technique
    - archivage_vehicule 
*/ 

INSERT INTO ville 
VALUES
(75000,"Paris"), 
(92800, "Puteaux"), 
(69000, "Lyon"); 

INSERT INTO service 
VALUES 
(NULL, "Développement web", 92800), 
(NULL, "Techniciens", 69000), 
(NULL, "Commercial", 75000); 

CALL insert_employer
("Lissillour", "Corentin", "corentin.lissillour304@gmail.com", "", 1, "developpeur web");
CALL insert_employer
("Bourenane", "Merieme", "merieme.bourenae@gmail.com", "", 2, "technicien électricité");
CALL insert_employer
("Anthony", "Defiguero", "anthony.defiguero@gmail.com", "", 3, "commercial");

CALL insert_manager
("Peng", "Sandrine", "sandrine.peng@gmail.com", "", 1,"manager web", 0, NOW() ); 
CALL insert_manager
("Ehanno", "Christine", "christine.ehanno@gmail.com", "", 2,"technicien chef", 1, NOW() ); 
CALL insert_manager
("Messe", "Germain", "messe.germain@gmail.com", "", 3,"directeur commercial", 0, NOW() ); 

INSERT INTO parking
VALUES 
(NULL, "parking 1", 100, "82 rue Paul Bert", 92800),
(NULL, "parking 2", 200, "2 Rue Maurice Payret Dortail", 69000),
(NULL, "parking 3", 50, "12 Rue de Clér", 75000); 

INSERT INTO place
VALUES
(); 

INSERT INTO type_vehicule
VALUES
(NULL, "utilitaire"),
(NULL, "camionette"),
(NULL, "poid lourd"); 

INSERT INTO vehicule
VALUES
(NULL, "AA-123-AA","206", "Peugeot", 1, 1,1), 
(NULL, "AB-122-AB","Zoé", "Renault", 1, 1,2),  
(NULL, "ZZ-478-RT","Logan", "Dacia", 1, 1,3); 

INSERT INTO demande
VALUES
(); 

INSERT INTO garage
VALUES
(NULL, "0637857575", "81 rue Paul Bert",92800), 
(NULL, "0637857575", "78 rue Emile Zola",92800), 
(NULL, "0637857575", "50 rue Paul Langevin",92800); 

INSERT INTO controle_technique
VALUES
();