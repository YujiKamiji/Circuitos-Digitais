library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D3_logic is
	port
	(
		A3: in STD_LOGIC;
		A2: in STD_LOGIC;
		A1: in STD_LOGIC;
		A0: in STD_LOGIC;
		D3: out STD_LOGIC
	);
end D3_logic;

architecture behavioural of D3_logic is
begin
	D3 <= (A2 AND NOT A1 AND NOT A0) OR (A3 AND NOT A0) OR (A3 AND NOT A1) OR (A3 AND NOT A2);
end behavioural;