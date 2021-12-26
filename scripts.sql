#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: employés
#------------------------------------------------------------

CREATE TABLE employes(
        id    Int  Auto_increment  NOT NULL ,
        posts Varchar (50) ,
        role  Varchar (50)
	,CONSTRAINT employes_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: clients
#------------------------------------------------------------

CREATE TABLE clients(
        id          Int  Auto_increment  NOT NULL ,
        id_employes Int NOT NULL
	,CONSTRAINT clients_PK PRIMARY KEY (id)

	,CONSTRAINT clients_employes_FK FOREIGN KEY (id_employes) REFERENCES employes(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: materielles_cuisines
#------------------------------------------------------------

CREATE TABLE materielles_cuisines(
        id_materielle_cuisines Int  Auto_increment  NOT NULL ,
        nom                    Varchar (50) NOT NULL ,
        quantiter              Varchar (50) NOT NULL
	,CONSTRAINT materielles_cuisines_PK PRIMARY KEY (id_materielle_cuisines)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: materiel_commun
#------------------------------------------------------------

CREATE TABLE materiel_commun(
        id       Int  Auto_increment  NOT NULL ,
        ensemble Varchar (50) NOT NULL ,
        nombre   Int NOT NULL ,
        nom      Varchar (5) NOT NULL
	,CONSTRAINT materiel_commun_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Restaurans
#------------------------------------------------------------

CREATE TABLE Restaurans(
        id  Int  Auto_increment  NOT NULL ,
        nom Varchar (50) NOT NULL
	,CONSTRAINT Restaurans_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Materiel_salle_restauration
#------------------------------------------------------------

CREATE TABLE Materiel_salle_restauration(
        id_mariel_resto Int  Auto_increment  NOT NULL ,
        nom             Varchar (50) NOT NULL ,
        quantites       Int NOT NULL
	,CONSTRAINT Materiel_salle_restauration_PK PRIMARY KEY (id_mariel_resto)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ingrediens
#------------------------------------------------------------

CREATE TABLE Ingrediens(
        nom     Varchar (50) NOT NULL ,
        id_Ingr Int  Auto_increment  NOT NULL
	,CONSTRAINT Ingrediens_PK PRIMARY KEY (nom)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: stokageIngredients
#------------------------------------------------------------

CREATE TABLE stokageIngredients(
        id_stockageIngredients Int  Auto_increment  NOT NULL
	,CONSTRAINT stokageIngredients_PK PRIMARY KEY (id_stockageIngredients)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Recettes
#------------------------------------------------------------

CREATE TABLE Recettes(
        id_recetteS  Int  Auto_increment  NOT NULL ,
        nomDeRecette Varchar (50) NOT NULL ,
        prix         Int NOT NULL ,
        prix_achat   DECIMAL (15,3)  NOT NULL ,
        id           Int NOT NULL
	,CONSTRAINT Recettes_PK PRIMARY KEY (id_recetteS)

	,CONSTRAINT Recettes_clients_FK FOREIGN KEY (id) REFERENCES clients(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Appartenir
#------------------------------------------------------------

CREATE TABLE Appartenir(
        id                     Int NOT NULL ,
        id_mariel_resto        Int NOT NULL ,
        id_materielle_cuisines Int NOT NULL
	,CONSTRAINT Appartenir_PK PRIMARY KEY (id,id_mariel_resto,id_materielle_cuisines)

	,CONSTRAINT Appartenir_Restaurans_FK FOREIGN KEY (id) REFERENCES Restaurans(id)
	,CONSTRAINT Appartenir_Materiel_salle_restauration0_FK FOREIGN KEY (id_mariel_resto) REFERENCES Materiel_salle_restauration(id_mariel_resto)
	,CONSTRAINT Appartenir_materielles_cuisines1_FK FOREIGN KEY (id_materielle_cuisines) REFERENCES materielles_cuisines(id_materielle_cuisines)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: preparer
#------------------------------------------------------------

CREATE TABLE preparer(
        id_recetteS Int NOT NULL ,
        id          Int NOT NULL
	,CONSTRAINT preparer_PK PRIMARY KEY (id_recetteS,id)

	,CONSTRAINT preparer_Recettes_FK FOREIGN KEY (id_recetteS) REFERENCES Recettes(id_recetteS)
	,CONSTRAINT preparer_employes0_FK FOREIGN KEY (id) REFERENCES employes(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Classer
#------------------------------------------------------------

CREATE TABLE Classer(
        id                 Int NOT NULL ,
        id_materiel_commun Int NOT NULL ,
        nom                Varchar (50) NOT NULL
	,CONSTRAINT Classer_PK PRIMARY KEY (id,id_materiel_commun,nom)

	,CONSTRAINT Classer_employes_FK FOREIGN KEY (id) REFERENCES employes(id)
	,CONSTRAINT Classer_materiel_commun0_FK FOREIGN KEY (id_materiel_commun) REFERENCES materiel_commun(id)
	,CONSTRAINT Classer_Ingrediens1_FK FOREIGN KEY (nom) REFERENCES Ingrediens(nom)
)ENGINE=InnoDB;






	=======================================================================
	   Désolé, il faut activer cette version pour voir la suite du script ! 
	=======================================================================
