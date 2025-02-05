-- Arquivo top_level.vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SIPO is
	port
	(
		Sin : in std_logic;
		Pout : out std_logic_vector(7 downto 0);
		CLK : in std_logic;
		OE : in std_logic
	);
end SIPO;

architecture Behavioural of SIPO is
	signal d : std_logic_vector(7 downto 0);

begin
	process(CLK, OE, Sin, d)
	begin
		if rising_edge(CLK) then
			d <= Sin & d(7 downto 1);
		end if;
	end process;
	
	Pout(7) <= d(7) and OE;
	Pout(6) <= d(6) and OE;
	Pout(5) <= d(5) and OE;
	Pout(4) <= d(4) and OE;
	Pout(3) <= d(3) and OE;
	Pout(2) <= d(2) and OE;
	Pout(1) <= d(1) and OE;
	Pout(0) <= d(0) and OE;
end Behavioural;		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  