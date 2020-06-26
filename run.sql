SET SERVEROUTPUT ON


add_player_from_match(8, 'Vasyan      ');

select * from TABLE(sc2_pack.count_victories('Vasyan      ', 'Z           '));

DELETE FROM player
WHERE player_name = 'Vasyan';