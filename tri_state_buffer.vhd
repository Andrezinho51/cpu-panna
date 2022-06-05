library ieee;
use ieee.std_logic_1164.all;


ENTITY tri_state_buffer IS
    PORT ( 
				Din  		: IN   STD_LOGIC_VECTOR (7 DOWNTO 0);
				Enable  	: IN   STD_LOGIC;
				Dout 		: OUT  STD_LOGIC_VECTOR (7 DOWNTO 0)
			);
END tri_state_buffer;

ARCHITECTURE Behavioral OF tri_state_buffer IS

BEGIN

    PROCESS(Enable, Din)
	 BEGIN
	 
		IF Enable = '1' THEN 
			Dout <= Din;
		ELSE	
			Dout <= "ZZZZZZZZ";
		END IF;
		
	END PROCESS;
    

END Behavioral;