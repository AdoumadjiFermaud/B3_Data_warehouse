MODEL LOGIQUE DE DONNEES

CREATE TABLE Client
(
id_Client INTEGER NOT NULL,
code_Client INTEGER NOT NULL.
nom_Client VARCHAR(20) NOT NULL,
num_Téléphone VARCHAR(15) NOT NULL,
PRIMARY KEY(id_Client)) ;

CREATE TABLE Produit
(
Id_Article INTEGER NOT NULL,
Description VARCHAR(20),
Prix_Unitaire DECIMAL(10,2) NOT NULL,
Quantité_EnStock INTEGER DEFAULT 0 NOT NULL CHECK (quantitéEnStock >= 0),
PRIMARY KEY (id_Article),) ;


CREATE TABLE Commande
(
Id_Commande INTEGER NOT NULL,
Date_Commande DATE NOT NULL,
Id_Client INTEGER NOT NULL,
PRIMARY KEY (id_Commande),
FOREIGN KEY (id_Client) REFERENCES Client) ;

CREATE TABLE Ligne_Commande
(
Id_Commande INTEGER NOT NULL,
id_Produit INTEGER NOT NULL,
quantite INTEGER NOT NULL CHECK (quantité > 0),
PRIMARY KEY (id_Commande, id_Produit),
FOREIGN KEY (id_Commande) REFERENCES Commande,
FOREIGN KEY (id_Produit) REFERENCES Article) ;

CREATE TABLE Livraison
(
Id_Livraison INTEGER NOT NULL,
Date_Livraison DATE NOT NULL,
PRIMARY KEY (noLivraison)
) ;


CREATE TABLE DétailLivraison
(
id_Livraison INTEGER NOT NULL,
id_Commande INTEGER NOT NULL,
id_Produit INTEGER NOT NULL,
quantite_Livree INTEGER NOT NULL CHECK (quantite_Livree > 0),
PRIMARY KEY (id_Livraison, id_Commande, id_Produit),
FOREIGN KEY (id_Livraison) REFERENCES Livraison,
FOREIGN KEY (id_Commande, id_Produit) REFERENCES Ligne_Commande
