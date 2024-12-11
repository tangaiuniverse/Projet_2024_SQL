/*
-- =========================================================================== A
-- Création des tables du schéma Evenement
-- -----------------------------------------------------------------------------
Produit  : KAO
Version  : 0.0.0
Statut   : en développement
-- =========================================================================== A
*/
--
set schema 'eve';
--

create domain prix as float check (value > 0);
comment on domain prix is
    $$ Le domaine pour le prix dune inscription $$;

create domain courriel as varchar(320) check ( value ~
                                               '[A-Z,a-z,0-9,!,#,$,%,&,*,+,-,\/,=,?,^,_,`,{,|,},~]{1}[A-Z,a-z,0-9,!,#,$,%,&,*,+,-,\/,=,?,^,_,`,{,|,},~,.]{0,53}[A-Z,a-z,0-9,!,#,$,%,&,*,+,-,\/,=,?,^,_,`,{,|,},~]{1}@([A-Z,a-z,0-9,-]{0,63}\.)+[A-Z,a-z,0-9,-]{0,63}' );
comment on domain courriel is
    $$ Le domaine pour un courriel $$;


create domain id_Inscription as integer;
comment on domain id_Inscription is
    $$  Le domaine pour une clé artificielle pour une inscription$$;


create domain nb_Personnes as integer check (value > 0);
comment on domain nb_Personnes is
    $$ Le domaine pour un nombre de personnes  $$;

create domain nom as varchar(60);
comment on domain nom is
    $$Le domaine pour un nom de personne  $$;


create domain no_Tel as varchar(14)
    check ( value ~ '^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$');
comment on domain no_Tel is
    $$Le domaine pour un numéro de téléphone$$;


create domain duree interval check (value <= '190 minute' and value > '0 minute');
comment on domain duree is
    $$ Le domaine pour une durée d'une activité $$;


create domain id_Endroit integer;
comment on domain id_Endroit is
    $$ Le domaine pour une clé artificielle pour un endroit $$;


create domain nb_Places integer check (value > 0);
comment on domain nb_Places is
    $$ Le domaine pour le nombre de place disponibles dans un endroit $$;

create type type_Activite as enum ('Centres communautaires', 'Gouvernements locaux', 'Organisateurs d''événements', 'Résidents à la recherche d''activités locales');
comment on type type_Activite is
    $$ Le type représantant le type de l'activité $$;

create table personne
(

    id_personne  id_Inscription  not null ,
     nom                    nom                    not null,
    prenom                 nom                    not null,
    courriel               courriel               not null,
    contact                 no_tel          not null,

    constraint cip_matricule_cc00 primary key (id_personne)

);

create table participant
(
    id_participant  id_Inscription not null,

    constraint inscription_etudiant_cc00 primary key (id_participant),
    constraint cip_matricule_cr01 foreign key (id_participant) references personne (id_personne)--,
    --constraint popop_35 unique (id_participant)
   -- constraint inscription_etudiant_cr00 foreign key (id_Inscription) references inscription (id_Inscription)
);

create table gerant
(
    id_gerant id_Inscription not null,
    domaine      varchar(42)     not null,
    constraint organisateur_cc00 primary key (id_gerant) ,
    constraint cip_matricule_cr01 foreign key (id_gerant) references personne (id_personne),
    constraint cip_matricule_cu01 unique (id_gerant)
);

create table inscription
(
    id_Inscription   id_Inscription not null,
    nom_Evenement    varchar(42) not null,
    numero_ticket    int not null,
    date_inscription date not null,

    constraint pk_inscription primary key ( id_Inscription),
    constraint fk_inscription_participant foreign key (id_Inscription) references participant (id_participant),
    constraint uq_numero_ticket unique (numero_ticket)
);

create table evenement
(
    id_gerant        id_Inscription   not null,
    id_inscription id_inscription not null,
    id_evenement id_Inscription not null,
    nom_Evenement    varchar(42) not null,
    description      varchar(42) not null,
    date_Debut       date        not null,
    date_Fin         date        not null,
    prix_Inscription prix        not null,
    durée            duree       not null,
    constraint evenement_cc07 primary key (id_evenement),
    constraint inscription_cc07 foreign key (id_gerant) references gerant (id_gerant),
    constraint inscription_cc08 foreign key (id_inscription) references inscription (id_inscription),
    constraint date_contrainte check (date_Debut < date_Fin),
    unique (nom_Evenement)

);

create table activite
(
    id_evenement id_Inscription not null,
    nom_Activite  varchar(42)   not null,
    nom_Theme     varchar(42)   not null,
    type_Activite type_Activite not null,

    constraint activite_cc00 primary key (nom_Activite),
    constraint activite_cr00 foreign key (id_evenement) references evenement (id_evenement)
);

create table sponsors
(
    id_evenement id_Inscription not null,
    nom_sponsor  nom not null,
    info_parrainage        varchar(42)    not null,
    contibution          int    not null,
    constraint inscription_professionnel_cc00 primary key (id_evenement),
    constraint inscription_professionnel_cr00 foreign key (id_evenement) references evenement (id_evenement),
    constraint cip_matricule_cu01 unique (nom_sponsor)
);

create table endroit
(
    id_evenement id_Inscription not null,
    id_Endroit id_Endroit not null,
    nom_lieu varchar(142) not null,
    adresse varchar(142)   not null,
    constraint endroit_cc00 primary key (id_Endroit),
    constraint inscription_professionnel_cr00 foreign key (id_evenement) references evenement (id_evenement)

);

create table presentiel
(
    id_Endroit   id_Endroit   not null,
    capacite    nb_Places    not null,
    constraint endroit_interne_cc00 primary key (id_Endroit),
    constraint endroit_interne_cr00 foreign key (id_Endroit) references endroit (id_Endroit)--,

);

create table virtuel
(
    id_Endroit id_Endroit   not null,
    lien       varchar(120) not null,
    constraint endroit_virtuel_cc00 primary key (id_Endroit),
    constraint endroit_virtuel_cr00 foreign key (id_Endroit) references endroit (id_Endroit),
    constraint endroit_virtuel_cu00 unique (lien)
);






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
-- Fin de table_cre.sql
-- =========================================================================== Z
*/

