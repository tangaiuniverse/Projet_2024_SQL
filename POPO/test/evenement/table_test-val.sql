/*
-- =========================================================================== A
-- Insertion des données valides pour tester les tables.
-- -----------------------------------------------------------------------------
Produit  : KAO
Version  : 0.0.0
Statut   : en développement
-- =========================================================================== A
*/
--
set schema 'eve';
--
-- Insertion d'une Personne
insert into personne(id_personne, nom, prenom, courriel, contact)
values (1, 'Durand', 'Julie', 'julie.durand@example.com', '555-123-4567');
insert into personne(id_personne, nom, prenom, courriel, contact)
values (2, 'Petit', 'Marc', 'marc.petit@example.com', '555-234-5678');
insert into personne(id_personne, nom, prenom, courriel, contact)
values       (3, 'Roy', 'Lea', 'lea.roy@example.com', '555-345-6789');
insert into personne(id_personne, nom, prenom, courriel, contact)
values       (4, 'Berube', 'Matis', 'matis.berube@example.com', '555-456-7890');
insert into personne(id_personne, nom, prenom, courriel, contact)
values       (5, 'Kos', 'Gaby', 'gaby.kos@example.com', '555-567-8901');
insert into personne(id_personne, nom, prenom, courriel, contact)
values       (6, 'Lauziere', 'Nina', 'nina.lauziere@example.com', '555-678-9012');
insert into personne(id_personne, nom, prenom, courriel, contact)
values       (7, 'Tremblay', 'Paul', 'paul.tremblay@example.com', '555-789-0123');
insert into personne(id_personne, nom, prenom, courriel, contact)
values       (8, 'Lapointe', 'Sophie', 'sophie.lapointe@example.com', '555-890-1234');
insert into personne(id_personne, nom, prenom, courriel, contact)
values       (9, 'Simard', 'Luc', 'luc.simard@example.com', '555-901-2345');
insert into personne(id_personne, nom, prenom, courriel, contact)
values       (10, 'Cote', 'Patrice', 'patrice.cote@example.com', '555-012-3456');
INSERT INTO personne (id_personne, nom, prenom, courriel, contact) VALUES
(91, 'Martin', 'Jeanne', 'jeanne.martin@example.com', '123-456-7890'),
(92, 'Bertrand', 'Claire', 'claire.bertrand@example.com', '123-456-7891'),
(93, 'Dubois', 'René', 'rene.dubois@example.com', '123-456-7892'),
(94, 'Lefebvre', 'Marc', 'marc.lefebvre@example.com', '123-456-7893'),
(95, 'Moreau', 'Juliette', 'juliette.moreau@example.com', '623-456-7894'),
(96, 'Petit', 'Vincent', 'vincent.petit@example.com', '123-456-7895'),
(97, 'Simon', 'Isabelle', 'isabelle.simon@example.com', '123-456-7896'),
(98, 'Laurent', 'Sophie', 'sophie.laurent@example.com', '123-456-7897'),
(99, 'Lemoine', 'Christophe', 'christophe.lemoine@example.com', '123-456-7898');


-- Insertion d'un Participant
insert into participant(id_participant)
values (1),
       (2),
       (3);
insert into participant(id_participant)
values       (4),
       (5),
       (6),
       (7),
       (8),
       (9),
       (10);

-- Insertion d'un gerant
insert into gerant(id_gerant, domaine)
values (91, 'Technologie'),
       (92, 'Finance'),
       (93, 'Éducation'),
       (94, 'Santé'),
       (95, 'Arts'),
       (96, 'Sport'),
       (97, 'Loisir'),
       (98, 'Transport'),
       (99, 'Construction');

-- Insertion d'une inscription
insert into inscription(id_inscription, nom_evenement, numero_ticket, date_inscription)
values (1, 'Conférence IA', 101, '2024-01-15'),
       (2, 'Salon Finance', 102, '2024-02-20'),
       (3, 'Webinaire Santé', 103, '2024-03-10'),
       (4, 'Atelier Art', 104, '2024-04-22'),
       (5, 'Tournoi Sport', 105, '2024-05-19'),
       (6, 'Festival Musique', 106, '2024-06-18'),
       (7, 'Expo Voitures', 107, '2024-07-09'),
       (8, 'Conférence Tech', 108, '2024-08-05'),
       (9, 'Séminaire Éducation', 109, '2024-09-10'),
       (10, 'Forum Innovation', 110, '2024-10-15');

-- Insertion d'un evenement

insert into evenement(id_gerant, id_inscription, id_evenement, nom_evenement, description, date_debut, date_fin, prix_inscription, durée)
values (91, 1, 121, 'Conférence IA', 'Intelligence Artificielle et son avenir', '2024-01-15', '2024-01-16', 150,  '60 minute'),
       (92, 2, 232, 'Salon Finance', 'Innovations en finance', '2024-02-20', '2024-02-21', 200,  '60 minute'),
       (93, 3, 334, 'Webinaire Santé', 'Santé publique et innovations', '2024-03-10', '2024-03-11', 100,  '60 minute'),
       (94, 4, 445, 'Atelier Art', 'Les nouveaux horizons de l art', '2024-04-22', '2024-04-23', 120,  '60 minute'),
       (95, 5, 556, 'Tournoi Sport', 'Tournoi international de tennis', '2024-05-19', '2024-05-20', 250,  '60 minute');


insert into activite(id_evenement, nom_activite, nom_theme, type_activite)
values (121, 'Développement IA', 'Intelligence Artificielle', 'Centres communautaires'),
       (232, 'Crypto 2024', 'Finance numérique', 'Gouvernements locaux'),
       (334, 'Santé Innov', 'Nouvelles technologies médicales', 'Gouvernements locaux'),
       (556, 'E-sports', 'Compétition de jeux vidéo', 'Résidents à la recherche d''activités locales'),
       (334, 'Voitures de luxe', 'Exposition de voitures', 'Centres communautaires'),
       (121, 'Tech Talk', 'Dernières innovations', 'Résidents à la recherche d''activités locales'),
       (232, 'Enseignement futuriste', 'Education 2.0', 'Organisateurs d''événements'),
       (445, 'Startup Pitch', 'Présentation de startups', 'Centres communautaires');


insert into sponsors(id_evenement, nom_sponsor, info_parrainage, contibution)
values (121, 'TechCorp', 'Sponsor principal', 5000),
       (445, 'ArtGallery', 'Sponsor d art', 3500),
       (232, 'GameZone', 'Sponsor de jeu', 4500);


insert into endroit(id_evenement, id_endroit, nom_lieu, adresse)
values (556, 101, 'Convention Center', '100 Main St, Metro City'),
       (556, 401, 'Finance Hall', '200 Finance Ave, Capital City'),
       (334, 403, 'Health Conference Room', '300 Health Blvd, Wellness City'),
       (445, 404, 'Art Studio', '400 Art St, Creative City'),
       (232, 407, 'Auto Showroom', '700 Speed Way, Luxury Town'),
       (232, 408, 'Tech Hub', '800 Innovation Dr, Tech City'),
       (334, 410, 'Startup Loft', '1000 Venture Blvd, Business City');


insert into presentiel(id_endroit, capacite)
values (401, 5),
       (101, 3),
       (403, 4),
       (404, 1),
       (407, 2),
       (408, 4),
       (410, 6);

insert into virtuel(id_endroit, lien)
values (401, 'https://event.com/virtual-room-101'),
       (101, 'https://event.com/virtual-room-102'),
       (403, 'https://event.com/virtual-room-103'),
       (404, 'https://event.com/virtual-room-104'),
       (407, 'https://event.com/virtual-room-107'),
       (408, 'https://event.com/virtual-room-108'),
       (410, 'https://event.com/virtual-room-110');

--
/*
-- =========================================================================== Z
Contributeurs :
  (LR) Lea.Roy4@USherbrooke.ca
  (MBL)Matis.BerubeLauziere@USherbrooke.ca
  (GK) Kosg1101@usherbrooke.ca

Tâches projetées :

Tâches réalisées :
  2023-11-16 (LR) : Création
-- -----------------------------------------------------------------------------
-- Fin de table-test-val_ins.sql
-- =========================================================================== Z
*/