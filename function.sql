CREATE OR REPLACE TYPE victories_row IS RECORD
(
    enemy_name player.player_name%TYPE
);

CREATE TYPE victories_table IS TABLE OF victories_row;

CREATE OR REPLACE   FUNCTION count_victories (pname player.player_name%TYPE, fname faction.faction_name%TYPE) 
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
