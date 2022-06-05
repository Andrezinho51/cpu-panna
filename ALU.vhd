library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

ENTITY ALU IS 

	PORT (
			A, B		: IN 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			AddSub	: IN 	STD_LOGIC;
			R			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		  );
END ALU;

ARCHITECTURE Behavior of ALU IS

BEGIN 

	PROCESS (AddSub, A, B)
	BEGIN
	
		IF AddSub = '0' THEN 
			R <= A + B;
		ELSE 
			R <= A - B;
		END IF;
		
	END PROCESS;
	
END Behavior;
		