create or replace TRIGGER player_del_trigger
    BEFORE DELETE ON player
    FOR EACH ROW
DECLARE
last_year_matches NUMBER;
last_year DATE;
del_last_year EXCEPTION;
BEGIN
SELECT add_months(trunc(sysdate,'yyyy'),-12) INTO last_year FROM dual;
SELECT count(*) INTO last_year_matches 
FROM matches 
WHERE (trunc(match_date,'yyyy') = last_year) AND (player1_name = :old.player_name OR player2_name = :old.player_name);
    IF (last_year_matches > 0) THEN
        RAISE del_last_year;
    END IF;
EXCEPTION
  WHEN del_last_year THEN  
    RAISE_APPLICATION_ERROR(-20001,'Some or all of chosen mathes are from the last year. They cannot be deleted');
END;