    INSERT INTO player(player_name) VALUES('Vasyan');
    INSERT INTO player(player_name) VALUES('BestGG');
    INSERT INTO player(player_name) VALUES('Michone');
    INSERT INTO player(player_name) VALUES('ChonGuk');
    INSERT INTO player(player_name) VALUES('ChingChong');
    INSERT INTO player(player_name) VALUES('Gordon');
    INSERT INTO player(player_name) VALUES('Bob');

    INSERT INTO faction(faction_name) VALUES('T');
    INSERT INTO faction(faction_name) VALUES('P');
    INSERT INTO faction(faction_name) VALUES('Z');

    INSERT INTO game_expansion(expansion_name) VALUES('WoL');
    INSERT INTO game_expansion(expansion_name) VALUES('HotS');
    INSERT INTO game_expansion(expansion_name) VALUES('LotV');

    


DECLARE
    TYPE SC_NAMES IS VARRAY(10) OF CHAR(12);
    TYPE SC_LONG_NAMES IS VARRAY(10) OF CHAR(30);
    TYPE IDS IS VARRAY(10) OF NUMBER(38);
    TYPE DATES IS VARRAY(10) OF DATE;
    TYPE BOOLS IS VARRAY(10) OF CHAR(1);
    
    match_id IDS;
    match_date DATES;
    victory_status BOOLS;
    expansion SC_LONG_NAMES;
    player1_name SC_NAMES;
    player2_name SC_NAMES;
    player1_faction SC_NAMES;
    player2_faction SC_NAMES;
BEGIN
    match_id := IDS(1,2,3,4,5,6,7,8,9,10);
    match_date := DATES('07/06/2016','07/06/2016','16/07/2016','16/09/2016','01/01/2017','07/01/2017','07/01/2019','09/01/2019','07/06/2019','02/01/2020');
    victory_status := BOOLS('1','0','1','1','0','0','0','1','1','0');
    expansion := SC_LONG_NAMES('WoL','WoL','WoL','WoL','WoL','WoL','LotV','LotV','LotV','LotV');
    player1_name := SC_NAMES('Vasyan','Vasyan','Vasyan','BestGG','Michone','Vasyan','Bob', 'BestGG','Michone','ChonGuk');
    player2_name := SC_NAMES('Michone','ChonGuk','ChingChong','Vasyan','ChingChong','Gordon','Vasyan','Bob','ChingChong','Bob');
    player1_faction := SC_NAMES('T','P','T','T','Z','Z','P','P','T','P');
    player2_faction := SC_NAMES('P','P','T','Z','T','Z','Z','P','T','P');
    FOR i IN 1 .. match_id.count
    LOOP
        INSERT INTO matches (match_id,match_date,victory_status,expansion_name,player1_name,player2_name,player1_faction,player2_faction)
        VALUES (match_id(i),match_date(i),victory_status(i),expansion(i),player1_name(i),player2_name(i),player1_faction(i),player2_faction(i));
        COMMIT;
    END LOOP;

END;
