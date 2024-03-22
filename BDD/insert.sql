INSERT INTO Categorie (nom) VALUES 
    ('Freinage'),
    ('Filtration'),
    ('Embrayage'),
    ('Essuyage');


INSERT INTO Piece (nom, categorie_id) VALUES 
    ('Câbles de frein', 1),
    ('Disques de frein', 1),
    ('Disques avec roulement', 1),
    ('Flexibles de frein', 1),
    ('Kits de frein', 1),
    ('Plaquettes de frein', 1),

    ('Filtres à huile', 2),
    ('Filtres d''habitacle', 2),
    ('Filtres à air', 2),
    ('Filtres d''habitacle', 2),
    ('Filtres à carburant', 2),

    ('Butées', 3),
    ('Câbles', 3),
    ('Kits d''embrayage', 3),
    ('Récepteurs', 3),
    ('Volants bi-masse', 3),

    ('Balais essuie-glaces', 4),
    ('Pompes lave-glaces', 4);


INSERT INTO Fournisseur (nom, image_url) VALUES 
    ('acr', 'acr.png'),
    ('afp', 'afp.png'),
    ('cal', 'cal.png'),
    ('dca', 'dca.png'),
    ('drop idf', 'drop_idf.png'),
    ('exadis', 'exadis.png'),
    ('mecadepot', 'mecadepot.png'),
    ('mga', 'mga.png'),
    ('otto''go', 'otto_go.png'),
    ('pap', 'pap.png'),
    ('procodis', 'procodis.png');


INSERT INTO Marque (nom, image_url) VALUES 
    ('abs', 'abs.png'), -- ID: 1
    ('adi', 'adi.jpg'), -- ID: 2
    ('airtex', 'airtex.jpg'), -- ID: 3
    ('arnott', 'arnott.png'), -- ID: 4
    ('ate', 'ate.png'), -- ID: 5
    ('ava', 'ava.png'), -- ID: 6
    ('bardahl', 'bardahl.png'), -- ID: 7
    ('beru', 'beru.png'), -- ID: 8
    ('bosal', 'bosal.jpg'), -- ID: 9
    ('bosch', 'bosch.png'), -- ID: 10
    ('brembo', 'brembo.png'), -- ID: 11
    ('budweg', 'budweg.png'), -- ID: 12
    ('bv', 'bv.jpg'), -- ID: 13
    ('cautex', 'cautex.png'), -- ID: 14
    ('cabor', 'cabor.png'), -- ID: 15
    ('calorstat', 'calorstat.jpg'), -- ID: 16
    ('carpoint', 'carpoint.png'), -- ID: 17
    ('castrol', 'castrol.jpg'), -- ID: 18
    ('champion', 'champion.jpg'), -- ID: 19
    ('clas', 'clas.jpg'), -- ID: 20
    ('continental', 'continental.png'), -- ID: 21
    ('corteco', 'corteco.png'), -- ID: 22
    ('csa', 'csa.png'), -- ID: 23
    ('dayco', 'dayco.png'), -- ID: 24
    ('depa', 'depa.jpg'), -- ID: 25
    ('dewalt', 'dewalt.jpg'), -- ID: 26
    ('diframa', 'diframa.jpg'), -- ID: 27
    ('dreumex', 'dreumex.jpg'), -- ID: 28
    ('durer', 'durer.png'), -- ID: 29
    ('ebi', 'ebi.png'), -- ID: 30
    ('efi', 'efi.png'), -- ID: 31
    ('elke', 'elke.png'), -- ID: 32
    ('elring', 'elring.png'), -- ID: 33
    ('eni', 'eni.png'), -- ID: 34
    ('era', 'era.jpg'), -- ID: 35
    ('facom', 'facom.jpg'), -- ID: 36
    ('faab', 'faab.png'), -- ID: 37
    ('fag', 'fag.jpg'), -- ID: 38
    ('fare', 'fare.png'), -- ID: 39
    ('ferodo', 'ferodo.jpg'), -- ID: 40
    ('ferron', 'ferron.png'), -- ID: 41
    ('fispa', 'fispa.png'), -- ID: 42
    ('fte', 'fte.jpg'), -- ID: 43
    ('gates', 'gates.png'), -- ID: 44
    ('galfer', 'galfer.png'), -- ID: 45
    ('generalgas', 'generalgas.jpg'), -- ID: 46
    ('global hygiene', 'global_hygiene.jpg'), -- ID: 47
    ('graf', 'graf.jpg'), -- ID: 48
    ('grea', 'grea.jpg'), -- ID: 49
    ('gs27', 'gs27.jpg'), -- ID: 50
    ('guttmann', 'guttmann.jpg'), -- ID: 51
    ('hella', 'hella.png'), -- ID: 52
    ('herth+buss', 'herth+buss.jpeg'), -- ID: 53
    ('hidria', 'hidria.jpg'), -- ID: 54
    ('holts', 'holts.png'), -- ID: 55
    ('huco', 'huco.png'), -- ID: 56
    ('hoffer', 'hoffer.jpg'), -- ID: 57
    ('hutchinson', 'hutchinson.jpeg'), -- ID: 58
    ('impergom', 'impergom.jpg'), -- ID: 59
    ('ina', 'ina.jpg'), -- ID: 60
    ('intfradis', 'intfradis.jpg'), -- ID: 61
    ('irontek', 'irontek.jpg'), -- ID: 62
    ('jurid', 'jurid.png'), -- ID: 63
    ('kayaba', 'kayaba.jpg'), -- ID: 64
    ('knecht', 'knecht.png'), -- ID: 65
    ('kodak', 'kodak.png'), -- ID: 66
    ('klaxcar', 'klaxcar.png'), -- ID: 67
    ('klemax', 'klemax.jpg'), -- ID: 68
    ('koyo', 'koyo.png'), -- ID: 69
    ('lift tek', 'lift_tek.jpg'), -- ID: 70
    ('littoral batteries', 'littoral_batteries.png'), -- ID: 71
    ('lizarte', 'lizarte.png'), -- ID: 72
    ('loctite', 'loctite.png'), -- ID: 73
    ('lucas', 'lucas.png'), -- ID: 74
    ('magneti marelli', 'magneti_marelli.png'), -- ID: 76
    ('mecafilter', 'mecafilter.jpg'), -- ID: 77
    ('misfat', 'misfat.png'), -- ID: 78
    ('mintex', 'mintex.png'), -- ID: 79
    ('moog', 'moog.png'), -- ID: 80
    ('monroe', 'monroe.jpg'), -- ID: 81
    ('narva', 'narva.png'), -- ID: 82
    ('neolux', 'neolux.jpg'), -- ID: 83
    ('nexans', 'nexans.jpg'), -- ID: 84
    ('ngk ntk', 'ngk_ntk.png'), -- ID: 85
    ('nrf', 'nrf.jpg'), -- ID: 87
    ('optimal', 'optimal.jpg'), -- ID: 88
    ('osram', 'osram.png'), -- ID: 89
    ('pierburg', 'pierburg.png'), -- ID: 90
    ('philips', 'philips.jpg'), -- ID: 91
    ('planet line', 'planet_line.jpg'), -- ID: 92
    ('prestolite', 'prestolite.png'), -- ID: 93
    ('protech', 'protech.png'), -- ID: 94
    ('proxitech', 'proxitech.png'), -- ID: 95
    ('purflux', 'purflux.png'), -- ID: 96
    ('quick_steer', 'quick_steer.jpg'), -- ID: 97
    ('record france', 'record_france.jpg'), -- ID: 98
    ('reborn', 'reborn.jpg'), -- ID: 99
    ('remante', 'remante.png'), -- ID: 100
    ('restagraf', 'restagraf.jpg'), -- ID: 101
    ('rts_sa', 'rts_sa.jpeg'), -- ID: 102
    ('rymec', 'rymec.png'), -- ID: 103
    ('sachs', 'sachs.png'), -- ID: 104
    ('sasic', 'sasic.png'), -- ID: 105
    ('seim', 'seim.png'), -- ID: 106
    ('skf', 'skf.jpg'), -- ID: 107
    ('snra', 'snra.png'), -- ID: 108
    ('snr', 'snr.jpg'), -- ID: 109
    ('spilu', 'spilu.jpg'), -- ID: 110
    ('stabilus', 'stabilus.png'), -- ID: 111
    ('stc', 'stc.png'), -- ID: 112
    ('tecdrive', 'tecdrive.png'), -- ID: 113
    ('technikit', 'technikit.jpeg'), -- ID: 114
    ('textar', 'textar.jpg'), -- ID: 115
    ('textiles', 'textiles.jpg'), -- ID: 116
    ('triscan', 'triscan.png'), -- ID: 117
    ('trw', 'trw.jpg'), -- ID: 118
    ('turbos_europe', 'turbos_europe.png'), -- ID: 119
    ('ufi', 'ufi.jpg'), -- ID: 120
    ('unil opal', 'unil_opal.jpg'), -- ID: 121
    ('upol', 'upol.png'), -- ID: 122
    ('valco', 'valco.jpg'), -- ID: 123
    ('valeo', 'valeo.png'), -- ID: 124
    ('veneporte', 'veneporte.png'), -- ID: 125
    ('vdo', 'vdo.jpg'), -- ID: 126
    ('walker', 'walker.png'), -- ID: 127
    ('wd40', 'wd40.jpg'), -- ID: 128
    ('wix filters', 'wix_filters.jpg'), -- ID: 129
    ('coopers fiaam', 'coopers_fiaam.png'), -- ID: 130
    ('delphi', 'delphi.png'), -- ID: 131
    ('denso', 'denso.jpg'), -- 132
    ('dri', 'dri.png'), -- 133
    ('fae', 'fae.jpg'), -- 134
    ('letrika iskra', 'letrika_iskra.png'), -- 135
    ('luk', 'luk.png'), -- 136
    ('mitsubishi_electric', 'mitsubishi_electric.png'), -- 137
    ('payen', 'payen.png'), -- 138
    ('blueprint', 'blueprint.png'), -- 139
    ('durand', 'durand.jpg'), -- 140
    ('febi', 'febi.jpg'), -- 141
    ('facet', 'facet.png'), -- 142
    ('vernet', 'vernet.png'), --143
    ('mga', 'mga.png'), -- 144
    ('asso', 'asso.png'), --145
    ('autopart battery', 'autopart_battery.png'), --146
    ('frigair', 'frigair.jpg'), --147
    ('kstools', 'kstools.jpg'), --148
    ('liquimoly', 'liquimoly.png'), --149
    ('steco', 'steco.jpg'), --150
    ('turbo moteur', 'turbo_moteur.jpg'), --151
    ('procodis', 'procodis.png'); --152


INSERT INTO FournisseurMarque (fournisseur_id, marque_id) VALUES
    (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,8),(1,10),(1,11),(1,12),(1,19),(1,130),(1,21),(1,131),(1,132),(1,133),(1,35),(1,134),(1,40),(1,42),(1,43),(1,44),(1,52),(1,60),(1,61),(1,65),(1,135),(1,136),(1,74),(1,76-1),(1,77-1),(1,78-1),(1,79-1),(1,80-1),(1,81-1),(1,85-1),(1,89-2),(1,138-2),(1,90-2),(1,93-2),(1,96-2),(1,97-2),(1,102-2),(1,104-2),(1,106-2),(1,107-2),(1,112-2),(1,118-2),(1,119-2),(1,126-2),(1,124-2),(1,127-2),
    (3,3),(3,139),(3,15),(3,16),(3,17),(3,22),(3,25),(3,26),(3,140),(3,31),(3,37),(3,36),(3,38),(3,141),(3,40),(3,41),(3,44),(3,49),(3,50),(3,52),(3,55),(3,60),(3,61),(3,64),(3,67),(3,68),(3,136),(3,76),(3,79),(3,80),(3,82),(3,85),(3,87-2),(3,91-2),(3,95-2),(3,96-2),(3,101-2),(3,106-2),(3,107-2),(3,115-2),(3,123-2),(3,124-2),(3,125-2),(3,128-2),
    (5,3),(5,5),(5,7),(5,8),(5,9),(5,13),(5,14),(5,19),(5,20),(5,21),(5,22),(5,23),(5,24),(5,131),(5,27),(5,28),(5,29),(5,32),(5,37),(5,142),(5,38),(5,45),(5,44),(5,46),(5,47),(5,52),(5,53),(5,57),(5,55),(5,56),(5,59),(5,60),(5,61),(5,62),(5,70),(5,71),(5,72),(5,136),(5,76),(5,77),(5,81),(5,80),(5,85),(5,87-2),(5,89-2),(5,92-2),(5,94-2),(5,95-2),(5,96-2),(5,100-2),(5,106-2),(5,110-2),(5,111-2),(5,113-2),(5,116-2),(5,119-2),(5,120-2),(5,121-2),(5,124-2),(5,126-2),(5,143-2),(5,128-2),(5,129-2),
    (8,48-1),(8,144-1),
    (9,145-2),(9,146-2),(9,6-1),(9,7-1),(9,18-1),(9,20-1),(9,22-1),(9,24-1),(9,131-1),(9,30-1),(9,33-1),(9,34-1),(9,142-1),(9,39-1),(9,40-1),(9,147-1),(9,48-1),(9,50-1),(9,51-1),(9,54-1),(9,55-1),(9,58-1),(9,61-1),(9, 63-1),(9,65-1),(9,66-1),(9,148-1),(9,149-1),(9,73-1),(9,136-1),(9,83-1),(9,85-1),(9,84-1),(9,109-1),(9,77-1),(9,78-1),(9,88-1),(9,89-1),(9,90-1),(9,95-1),(9,99-1),(9,98-1),(9,103-1),(9,104-1),(9,105-1),(9,108-1),(9,110-1),(9,150-1),(9,151-1),(9,117-1),(9,114-1),(9,118-1),(9,122-1),(9,124-1),(9,143-1),
    (11,5),(11,21),(11,24),(11,44),(11,60),(11,69),(11,77),(11,152-2),(11,109-2),(11,107-2),(11,126-2);


INSERT INTO PieceMarque (piece_id, marque_id) VALUES 
    (1,10),(1,30),(1,19),(1,130),(8,1),(9,1)(10,1),(13,1),(14,2)