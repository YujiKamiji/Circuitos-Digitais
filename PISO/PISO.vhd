-- Arquivo top_level.vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PISO is
	port
	(
		Pin : in std_logic_vector(7 downto 0);
		Sout : out std_logic;
		CLK : in std_logic;
		LS : in std_logic
	);
end PISO;

architecture Behavioural of PISO is
	signal d : std_logic_vector(7 downto 0) ;

begin
	Sout <= d(0);
	
	process(CLK, LS, Pin, d)
	begin
		if rising_edge(CLK) then
			if LS = '1' then
				d(0) <= Pin(7);
				d(1) <= Pin(6);
				d(2) <= Pin(5);
				d(3) <= Pin(4);
				d(4) <= Pin(3);
				d(5) <= Pin(2);
				d(6) <= Pin(1);
				d(7) <= Pin(0);
			else
				d(0) <= d(1);
				d(1) <= d(2);
				d(2) <= d(3);
				d(3) <= d(4);
				d(4) <= d(5);
				d(5) <= d(6);
				d(6) <= d(7);
				d(7) <= '0';
			end if;
		end if;
	end process;
end Behavioural;		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  