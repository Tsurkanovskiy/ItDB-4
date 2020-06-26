create or replace PROCEDURE add_player_from_match(
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