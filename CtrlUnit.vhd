library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

ENTITY CtrlUnit IS 

	PORT (
			 w				 : 	IN  STD_LOGIC;
			 RX, RY	 	 :  	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
			 Functions	 : 	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
			 Clock		 :  	IN  STD_LOGIC;
			 R0in, R0out : 	OUT STD_LOGIC;
			 R1in, R1out : 	OUT STD_LOGIC;
			 R2in, R2out : 	OUT STD_LOGIC;
			 R3in, R3out : 	OUT STD_LOGIC;
			 Ain  		 : 	OUT STD_LOGIC;
			 Gin, Gout	 : 	OUT STD_LOGIC;
			 AddSub		 :		OUT STD_LOGIC;
			 Extern		 :		OUT STD_LOGIC;
			 Done			 :		OUT STD_LOGIC
		  );
		  
END CtrlUnit;

ARCHITECTURE Behavior of CtrlUnit IS

	TYPE State_type IS (S0, S1, S2, S3, S4, S5, S6, S7, S8);
	
	SIGNAL current_state, next_state : State_type;

	BEGIN
	PROCESS (w, RX, RY, Functions, current_state)
		
		BEGIN
			
			CASE current_state IS
				WHEN S0 => 
					
					IF w = '0' THEN
						next_state <= S0;
					ELSE
						IF Functions = "00" THEN
						
							next_state <= S1;
							
						ELSIF Functions = "01" THEN
							
							next_state <= S2;
						
						ELSIF Functions = "10" THEN
							
							next_state <= S3;
						
						ELSE
						 
							next_state <= S6;
						
						END IF;
						
				 END IF;
				 
				R0in 		<= '0';
				R0out 	<= '0';
				R1in 		<= '0';
				R1out 	<= '0';
				R2in 		<= '0';
				R2out 	<= '0';
				R3in 		<= '0';
				R3out 	<= '0';
				Ain 		<= '0';
				Gin 		<= '0';
				Gout 		<= '0';
				AddSub 	<= '0';
				Extern 	<= '0';
				Done 		<= '0';
				
				-- MOVE
				WHEN S1 => 
					IF RX = "00" THEN 
						
						R0in <= '1';
						R1in <= '0';
						R2in <= '0';
						R3in <= '0';
						
					ELSIF RX = "01" THEN
					
						R0in <= '0';
						R1in <= '1';
						R2in <= '0';
						R3in <= '0';
						
					ELSIF RX = "10" THEN  
					
						R0in <= '0';
						R1in <= '0';
						R2in <= '1';
						R3in <= '0';
						
					ELSE 
					
						R0in <= '0';
						R1in <= '0';	
						R2in <= '0';
						R3in <= '1';
						
					END IF;
				
					IF RY = "00" THEN 
					
						R0out <= '1';
						R1out <= '0';
						R2out <= '0';
						R3out <= '0';
						
					ELSIF RY = "01" THEN  
					
						R0out <= '0';
						R1out <= '1';
						R2out <= '0';
						R3out <= '0';
						
					ELSIF RY = "10" THEN 
					
						R0out <= '0';
						R1out <= '0';
						R2out <= '1';
						R3out <= '0';
						
					ELSE
					
						R0out <= '0';
						R1out <= '0';
						R2out <= '0';
						R3out <= '1';
					
					END IF;
					
					next_state <= S0;
					
					Ain 		<= '0';
					Gin 		<= '0';
					Gout 		<= '0';
					AddSub 	<= '0';
					Extern 	<= '0';
					Done 		<= '1';
			
			 -- LOAD
			 	WHEN S2 =>
				IF RX="00" THEN 
				
					R0in <= '1';
					R1in <= '0';
					R2in <= '0';
					R3in <= '0';
					
				ELSIF RX="01" THEN  
				
					R0in <= '0';
					R1in <= '1';
					R2in <= '0';
					R3in <= '0';
					
				ELSIF RX="10" THEN  
				
					R0in <= '0';
					R1in <= '0';
					R2in <= '1';
					R3in <= '0';
					
				ELSE 
				
					R0in <= '0';
					R1in <= '0';
					R2in <= '0';
					R3in <= '1';
					
				END IF;
				
				R0out <= '0';
				R1out <= '0';
				R2out <= '0';
				R3out <= '0';
				
				next_state <= S0;
				
				Ain 		<= '0';
				Gin 		<= '0';
				Gout 		<= '0';
				AddSub 	<= '0';
				Extern 	<= '1';
				Done 		<= '1';
				
			WHEN S3 =>--Add T1
				
				IF RX="00" THEN 
				
					R0out <= '1';
					R1out <= '0';
					R2out <= '0';
					R3out <= '0';
					
				ELSIF RX="01" THEN 
				
					R0out <= '0';
					R1out <= '1';
					R2out <= '0';
					R3out <= '0';
					
				ELSIF RX="10" THEN 
				
					R0out <= '0';
					R1out <= '0';
					R2out <= '1';
					R3out <= '0';
					
				ELSE 
				
					R0out <= '0';
					R1out <= '0';
					R2out <= '0';
					R3out <= '1';
					
				END IF;
				
				R0in <= '0';
				R1in <= '0';
				R2in <= '0';
				R3in <= '0';
				
				next_state <= S4;
				
				Ain 		<= '1';
				Gin 		<= '0';
				Gout 		<= '0';
				AddSub 	<= '0';
				Extern 	<= '0';
				Done 		<= '0';
				
			WHEN S4 =>--Add T2
				
				IF RY="00" THEN 
				
					R0out <= '1';
					R1out <= '0';
					R2out <= '0';
					R3out <= '0';
					
				ELSIF RY="01" THEN 
				
					R0out <= '0';
					R1out <= '1';
					R2out <= '0';
					R3out <= '0';
					
				ELSIF RY="10" THEN 
				
					R0out <= '0';
					R1out <= '0';
					R2out <= '1';
					R3out <= '0';
					
				ELSE 
				
					R0out <= '0';
					R1out <= '0';
					R2out <= '0';
					R3out <= '1';
					
				END IF;
				
				R0in <= '0';
				R1in <= '0';
				R2in <= '0';
				R3in <= '0';
				
				next_state <= S5;
				
				Ain 		<= '0';
				Gin 		<= '1';
				Gout 		<= '0';
				AddSub 	<= '0';
				Extern 	<= '0';
				Done 		<= '0';
				
			WHEN S5 =>--Add T3
				
				IF RX="00" THEN 
				
					R0in <= '1';
					R1in <= '0';
					R2in <= '0';
					R3in <= '0';
					
				ELSIF RX="01" THEN 
				
					R0in <= '0';
					R1in <= '1';
					R2in <= '0';
					R3in <= '0';
					
				ELSIF RX="10" THEN 
				
					R0in <= '0';
					R1in <= '0';
					R2in <= '1';
					R3in <= '0';
					
				ELSE 
				
					R0in <= '0';
					R1in <= '0';
					R2in <= '0';
					R3in <= '1';
					
				END IF;
				
				R0out <= '0';
				R1out <= '0';
				R2out <= '0';
				R3out <= '0';
				
				next_state <= S0;
				
				Ain 		<= '0';
				Gin 		<= '0';
				Gout 		<= '1';
				AddSub 	<= '0';
				Extern 	<= '0';
				Done 		<= '1';
				
			WHEN S6 =>--Sub T1
				
				IF RX="00" THEN 
				
					R0out <= '1';
					R1out <= '0';
					R2out <= '0';
					R3out <= '0';
					
				ELSIF RX="01" THEN  
				
					R0out <= '0';
					R1out <= '1';
					R2out <= '0';
					R3out <= '0';
					
				ELSIF RX="10" THEN 
				
					R0out <= '0';
					R1out <= '0';
					R2out <= '1';
					R3out <= '0';
					
				ELSE 
				
					R0out <= '0';
					R1out <= '0';
					R2out <= '0';
					R3out <= '1';
					
				END IF;
				
				R0in <= '0';
				R1in <= '0';
				R2in <= '0';
				R3in <= '0';
				
				next_state <= S7;
				
				Ain 		<= '1';
				Gin 		<= '0';
				Gout 		<= '0';
				AddSub 	<= '0';
				Extern 	<= '0';
				Done 		<= '0';
				
			WHEN S7 =>--Sub T2
				
				IF RY="00" THEN 
				
					R0out <= '1';
					R1out <= '0';
					R2out <= '0';
					R3out <= '0';
					
				ELSIF RY="01" THEN 
				
					R0out <= '0';
					R1out <= '1';
					R2out <= '0';
					R3out <= '0';
					
				ELSIF RY="10" THEN  
				
					R0out <= '0';
					R1out <= '0';
					R2out <= '1';
					R3out <= '0';
					
				ELSE 
				
					R0out <= '0';
					R1out <= '0';
					R2out <= '0';
					R3out <= '1';
					
				END IF;
				
				R0in <= '0';
				R1in <= '0';
				R2in <= '0';
				R3in <= '0';
				
				next_state <= S8;
				
				Ain 		<= '0';
				Gin 		<= '1';
				Gout 		<= '0';
				AddSub 	<= '1';
				Extern 	<= '0';
				Done 		<= '0';
				
			WHEN S8 =>--Sub T3
				
				IF RX="00" THEN 
					R0in <= '1';
					R1in <= '0';
					R2in <= '0';
					R3in <= '0';
					
				ELSIF RX="01" THEN 
				
					R0in <= '0';
					R1in <= '1';
					R2in <= '0';
					R3in <= '0';
				ELSIF RX="10" THEN 
				
					R0in <= '0';
					R1in <= '0';
					R2in <= '1';
					R3in <= '0';
					
				ELSE
				
					R0in <= '0';
					R1in <= '0';
					R2in <= '0';
					R3in <= '1';
					
				END IF;
				
				R0out <= '0';
				R1out <= '0';
				R2out <= '0';
				R3out <= '0';
				
				next_state <= S0;
				
				Ain 		<= '0';
				Gin 		<= '0';
				Gout 		<= '1';
				AddSub 	<= '0';
				Extern 	<= '0';
				Done 		<= '1';
			
		END CASE ;
		
	END PROCESS ;
	
	PROCESS (Clock)
	BEGIN
  
		IF RISING_EDGE(Clock) THEN

			current_state <= next_state ;
		
		END IF;
	
	END PROCESS ;
				
END Behavior;
		