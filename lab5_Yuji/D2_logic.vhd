library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D2_logic is
	port
	(
		A3: in STD_LOGIC;
		A2: in STD_LOGIC;
		A1: in STD_LOGIC;
		A0: in STD_LOGIC;
		D2: out STD_LOGIC
	);
end D2_logic;

architecture behavioural of D2_logic is
begin
	D2 <= (A3 AND A2 AND NOT A1) OR (NOT A3 AND NOT A2) OR (NOT A2 AND A1);
end behavioural;