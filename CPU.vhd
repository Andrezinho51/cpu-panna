library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

ENTITY CPU IS

	PORT (
				Data			: 	IN  STD_LOGIC_VECTOR  (7 DOWNTO 0);
				Clock			: 	IN  STD_LOGIC;
				w				: 	IN  STD_LOGIC;
				RX, RY		: 	IN  STD_LOGIC_VECTOR  (1 DOWNTO 0);
				Functions	: 	IN  STD_LOGIC_VECTOR  (1 DOWNTO 0); -- OPCODE
				Barramento	: 	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
				Done			:  OUT STD_LOGIC
			);
			
END CPU;

ARCHITECTURE Behavior OF CPU IS

	COMPONENT datap
		PORT (
					Data	 		: IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
					Clock	 		: IN  STD_LOGIC;
					R0in,	R0out	: IN  STD_LOGIC;
					R1in,	R1out : IN  STD_LOGIC;
					R2in,	R2out	: IN  STD_LOGIC;
					R3in,	R3out	: IN  STD_LOGIC;
					Ain			: IN  STD_LOGIC;
					Gin,	Gout 	: IN  STD_LOGIC;
					AddSub		: IN  STD_LOGIC;
					Extern 		: IN  STD_LOGIC;
					Barramento	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);
		
	END COMPONENT;
	
	COMPONENT CtrlUnit
		PORT (
					W				: 	IN  STD_LOGIC;
					RX, RY		:	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
					Functions 	: 	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
					Clock			: 	IN  STD_LOGIC;
					R0in,	R0out	:	OUT STD_LOGIC;
					R1in,	R1out	: 	OUT STD_LOGIC;
					R2in,	R2out	: 	OUT STD_LOGIC;
					R3in,	R3out	: 	OUT STD_LOGIC;
					Ain			: 	OUT STD_LOGIC;
					Gin,	Gout 	: 	OUT STD_LOGIC;
					AddSub		: 	OUT STD_LOGIC;
					Extern 		: 	OUT STD_LOGIC;
					Done			: 	OUT STD_LOGIC	
		);
	
	END COMPONENT;
	
	SIGNAL R0in, R0out	: STD_LOGIC;
	SIGNAL R1in, R1out	: STD_LOGIC;
	SIGNAL R2in, R2out	: STD_LOGIC;
	SIGNAL R3in, R3out	: STD_LOGIC; 
	SIGNAL Ain				: STD_LOGIC;
	SIGNAL Gin, Gout		: STD_LOGIC;
	SIGNAL AddSub			: STD_LOGIC;
	SIGNAL Extern 			: STD_LOGIC;
	
	BEGIN
		
		flux : datap 		PORT MAP (Data, Clock, R0in, R0out, R1in, R1out, R2in, R2out, R3in, R3out, Ain, Gin, Gout, AddSub, Extern, Barramento);
		ctrl : CtrlUnit	PORT MAP (w, RX, RY, Functions, Clock, R0in, R0out, R1in, R1out, R2in, R2out, R3in, R3out, Ain, Gin, Gout, AddSub, Extern, Done);
			
END Behavior;
		
	
		