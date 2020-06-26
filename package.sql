CREATE OR REPLACE PACKAGE sc2_pack IS

PROCEDURE add_player_from_match(
    var_id  INTEGER,
    var_pname  player.player_name%TYPE
);

TYPE victories_row IS RECORD
(
    enemy_name player.player_name%TYPE
);

TYPE victories_table IS TABLE OF victories_row;

FUNCTION count_victories (pname player.player_name%TYPE, fname faction.faction_name%TYPE) 
    RETURN victories_table 
    PIPELINED;

END sc2_pack;
/






CREATE OR REPLACE PACKAGE BODY sc2_pack IS

	  PROCEDURE add_player_from_match(
	    var_id  INTEGER,
	    var_pname  player.player_name%TYPE
	  ) IS
	    counter NUMBER;
	    no_player EXCEPTION;    
	  BEGIN
	    SELECT COUNT(*)
	    INTO counter
	    FROM matches
	    WHERE (match_id = var_id)
	      AND (player1_name = var_pname OR player2_name = var_pname);

	    IF (counter > 0) THEN
	        UPDATE  player
	        SET player_name = var_pname
	        WHERE player_name = var_pname;
	    ELSE
	        RAISE no_player;
	    END IF;
	    EXCEPTION
	        WHEN no_player THEN
	            dbms_output.put_line('No such match with that player found');
	  END;



	FUNCTION count_victories (pname player.player_name%TYPE, fname faction.faction_name%TYPE) 
	    RETURN victories_table 
	    PIPELINED 
	    AS
	    enemy_name player.player_name%TYPE;
	    CURSOR victories_cursor
	        IS
	        SELECT DISTINCT player.player_name
	        FROM player, matches
	        WHERE (matches.player1_name = player.player_name AND matches.player2_name = pname AND matches.player2_faction = fname) OR 
	            (matches.player2_name = player.player_name AND matches.player1_name = pname AND matches.player1_faction = fname);
	    BEGIN
        FOR enemy IN victories_cursor
            LOOP
                PIPE ROW (enemy);
            END LOOP;
	END count_victories;
END;