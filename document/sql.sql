#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: langage
#------------------------------------------------------------

CREATE TABLE langage(
        ID      Int  Auto_increment  NOT NULL ,
        langage Varchar (50) NOT NULL
	,CONSTRAINT langage_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ville
#------------------------------------------------------------

CREATE TABLE ville(
        ID    Int  Auto_increment  NOT NULL ,
        ville Varchar (50) NOT NULL
	,CONSTRAINT ville_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Utilisateur
#------------------------------------------------------------

CREATE TABLE Utilisateur(
        ID       Int  Auto_increment  NOT NULL ,
        mail     Varchar (50) NOT NULL ,
        mdp      Varchar (50) NOT NULL ,
        photo    Varchar (50) NOT NULL ,
        nom      Varchar (50) NOT NULL ,
        prenom   Varchar (50) NOT NULL ,
        jour     Int NOT NULL ,
        mois     Int NOT NULL ,
        anner    Int NOT NULL ,
        tel      Int NOT NULL ,
        descript Text NOT NULL ,
        type     Int NOT NULL ,
        ID_ville Int NOT NULL
	,CONSTRAINT Utilisateur_PK PRIMARY KEY (ID)

	,CONSTRAINT Utilisateur_ville_FK FOREIGN KEY (ID_ville) REFERENCES ville(ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: offre
#------------------------------------------------------------

CREATE TABLE offre(
        ID                    Int  Auto_increment  NOT NULL ,
        descript              Text NOT NULL ,
        ID_Utilisateur_offre  Int NOT NULL ,
        ID_Utilisateur_accept Int
	,CONSTRAINT offre_PK PRIMARY KEY (ID)

	,CONSTRAINT offre_Utilisateur_FK FOREIGN KEY (ID_Utilisateur_offre) REFERENCES Utilisateur(ID)
	,CONSTRAINT offre_Utilisateur0_FK FOREIGN KEY (ID_Utilisateur_accept) REFERENCES Utilisateur(ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: entreprise
#------------------------------------------------------------

CREATE TABLE entreprise(
        ID             Int  Auto_increment  NOT NULL ,
        nom_entreprise Varchar (50) NOT NULL ,
        ID_Utilisateur Int NOT NULL
	,CONSTRAINT entreprise_PK PRIMARY KEY (ID)

	,CONSTRAINT entreprise_Utilisateur_FK FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID)
	,CONSTRAINT entreprise_Utilisateur_AK UNIQUE (ID_Utilisateur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: lien
#------------------------------------------------------------

CREATE TABLE lien(
        ID             Int  Auto_increment  NOT NULL ,
        lien           Varchar (100) NOT NULL ,
        ID_Utilisateur Int NOT NULL
	,CONSTRAINT lien_PK PRIMARY KEY (ID)

	,CONSTRAINT lien_Utilisateur_FK FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID)
	,CONSTRAINT lien_Utilisateur_AK UNIQUE (ID_Utilisateur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: note
#------------------------------------------------------------

CREATE TABLE note(
        ID             Int  Auto_increment  NOT NULL ,
        note           Int NOT NULL ,
        text           Text NOT NULL ,
        jour           Int NOT NULL ,
        mois           Int NOT NULL ,
        anner          Int NOT NULL ,
        heur           Int NOT NULL ,
        minute         Int NOT NULL ,
        ID_Utilisateur Int NOT NULL
	,CONSTRAINT note_PK PRIMARY KEY (ID)

	,CONSTRAINT note_Utilisateur_FK FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: mail
#------------------------------------------------------------

CREATE TABLE mail(
        ID                    Int  Auto_increment  NOT NULL ,
        sujet                 Varchar (100) NOT NULL ,
        text                  Text NOT NULL ,
        ID_Utilisateur_envoie Int NOT NULL ,
        ID_Utilisateur_recois Int NOT NULL
	,CONSTRAINT mail_PK PRIMARY KEY (ID)

	,CONSTRAINT mail_Utilisateur_FK FOREIGN KEY (ID_Utilisateur_envoie) REFERENCES Utilisateur(ID)
	,CONSTRAINT mail_Utilisateur0_FK FOREIGN KEY (ID_Utilisateur_recois) REFERENCES Utilisateur(ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: acquis
#------------------------------------------------------------

CREATE TABLE acquis(
        ID             Int NOT NULL ,
        ID_Utilisateur Int NOT NULL ,
        niveau         Int NOT NULL
	,CONSTRAINT acquis_PK PRIMARY KEY (ID,ID_Utilisateur)

	,CONSTRAINT acquis_langage_FK FOREIGN KEY (ID) REFERENCES langage(ID)
	,CONSTRAINT acquis_Utilisateur0_FK FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: demande
#------------------------------------------------------------

CREATE TABLE demande(
        ID             Int NOT NULL ,
        ID_Utilisateur Int NOT NULL
	,CONSTRAINT demande_PK PRIMARY KEY (ID,ID_Utilisateur)

	,CONSTRAINT demande_offre_FK FOREIGN KEY (ID) REFERENCES offre(ID)
	,CONSTRAINT demande_Utilisateur0_FK FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: requi
#------------------------------------------------------------

CREATE TABLE requi(
        ID         Int NOT NULL ,
        ID_langage Int NOT NULL
	,CONSTRAINT requi_PK PRIMARY KEY (ID,ID_langage)

	,CONSTRAINT requi_offre_FK FOREIGN KEY (ID) REFERENCES offre(ID)
	,CONSTRAINT requi_langage0_FK FOREIGN KEY (ID_langage) REFERENCES langage(ID)
)ENGINE=InnoDB;

