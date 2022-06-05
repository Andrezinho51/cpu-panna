library IEEE;

use IEEE.std_logic_1164.all;

ENTITY datap	IS

	PORT (
			Data			: 	IN 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			Clock			:	IN 	STD_LOGIC;
			R0in, R0out	: 	IN 	STD_LOGIC;
			R1in, R1out	: 	IN 	STD_LOGIC;
			R2in, R2out	: 	IN 	STD_LOGIC;
			R3in, R3out	: 	IN 	STD_LOGIC;
			Ain			: 	IN 	STD_LOGIC;
			Gin, Gout	: 	IN 	STD_LOGIC;
			AddSub		: 	IN 	STD_LOGIC;
			Extern		: 	IN 	STD_LOGIC;
			Barramento	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0)
		  );
END datap;

ARCHITECTURE Behavior of datap IS


	COMPONENT reg
		PORT (
				 D 			: 	IN 	STD_LOGIC_VECTOR (7 DOWNTO 0);
				 Clock		:	IN 	STD_LOGIC;
				 En			: 	IN 	STD_LOGIC;
				 Q				: 	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0)
			  );
	END COMPONENT;
	
	COMPONENT tri_state_buffer
		PORT (
				 Din			:	IN 	STD_LOGIC_VECTOR (7 DOWNTO 0);
				 Enable		:	IN 	STD_LOGIC;
				 Dout			: 	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0)
			  );
	END COMPONENT;
	
	COMPONENT ALU
		PORT (
				 A, B			: 	IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				 AddSub		:	IN		STD_LOGIC;
				 R				:	OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0)
			  );
	END COMPONENT;
	
	SIGNAL BarramentoData, R0_d, R1_d, R2_d, R3_d, A_d, G_d, R	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	BEGIN
		
		reg_R0	 :	 reg PORT MAP (BarramentoData, Clock, R0in, R0_d);
		reg_R1	 :  reg PORT MAP (BarramentoData, Clock, R1in, R1_d);
		reg_R2	 :  reg PORT MAP (BarramentoData, Clock, R2in, R2_d);
		reg_R3	 :	 reg PORT MAP (BarramentoData, Clock, R3in, R3_d);
		
		reg_A		 :  reg PORT MAP (BarramentoData, Clock, Ain , A_d );
		reg_G		 :  reg PORT MAP (R, Clock, Gin , G_d );
		
		trin_R0	 :  tri_state_buffer PORT MAP (R0_d, R0out, BarramentoData);
		trin_R1	 :  tri_state_buffer PORT MAP (R1_d, R1out, BarramentoData);
		trin_R2	 :  tri_state_buffer PORT MAP (R2_d, R2out, BarramentoData);
		trin_R3	 :  tri_state_buffer PORT MAP (R3_d, R3out, BarramentoData);
		
		trin_G	 :  tri_state_buffer PORT MAP (G_d, Gout, BarramentoData);
		
		trin_data :  tri_state_buffer PORT MAP (Data, Extern, BarramentoData);
		
		ALU_uut	 :  ALU PORT MAP (A_d, BarramentoData, AddSub, R);

		
	Barramento <= BarramentoData;
	
END Behavior;
		