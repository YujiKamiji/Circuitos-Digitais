library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D0_logic is
	port
	(
		A3: in STD_LOGIC;
		A2: in STD_LOGIC;
		A1: in STD_LOGIC;
		A0: in STD_LOGIC;
		D0: out STD_LOGIC
	);
end D0_logic;

architecture behavioural of D0_logic is
begin
	D0 <= (NOT A3 AND NOT A2 AND A1) OR (A2 AND A1 AND NOT A0) OR (A3 AND NOT A2 AND A0) OR (A2 AND NOT A1 AND A0);
end behavioural;