library ieee;
use ieee.std_logic_1164.all;

ENTITY reg IS 
	
	PORT (
			D			: IN 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			Clock		: IN 	STD_LOGIC;
			En			: IN 	STD_LOGIC;
			Q			: OUT	STD_LOGIC_VECTOR (7 DOWNTO 0)
		 );
END reg;

ARCHITECTURE Behavior OF reg IS

BEGIN 

	PROCESS(Clock, En)
	BEGIN
		-- Clock'EVENT AND Clock='1'
		IF RISING_EDGE(Clock) AND En = '1' THEN
			
			Q <= D;
			
		END IF;
	END PROCESS;

END Behavior;