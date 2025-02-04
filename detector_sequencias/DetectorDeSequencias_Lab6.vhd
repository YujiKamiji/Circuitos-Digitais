Library ieee; 
use ieee.std_logic_1164.all;

ENTITY DetectorDeSequencias_Lab6 IS
	PORT(
		clk_hl 	 : IN STD_LOGIC;
	 	entradaIn : IN STD_LOGIC;
		saidaOut  : OUT  STD_LOGIC_VECTOR(6 downto 0)
	);
END DetectorDeSequencias_Lab6;
	
ARCHITECTURE estrutural OF DetectorDeSequencias_Lab6 IS
SIGNAL BIN : STD_LOGIC_VECTOR(3 DOWNTO 0);

component DetSequenciaYuji
	port (
	   clk      : IN   STD_LOGIC;
      entrada  : IN   STD_LOGIC;
      saida    : OUT  STD_LOGIC_VECTOR(3 downto 0)
		);
end component;

component DetSequenciaLucas
	port (
	   clk      : IN   STD_LOGIC;
      entrada  : IN   STD_LOGIC;
      saida    : OUT  STD_LOGIC_VECTOR(3 downto 0)
		);
end component;


component decodificador_bin_hex_7seg
	PORT
	(
		input 	:  IN  STD_LOGIC_VECTOR(3 downto 0);
		hex_out  :	OUT STD_LOGIC_VECTOR(6 downto 0)
	);
end component;

begin

detectorYuji: DetSequenciaYuji
PORT MAP
(
	clk => clk_hl,
	entrada => entradaIn,
	saida => BIN(3 downto 0)
);
	
decoder : decodificador_bin_hex_7seg
PORT MAP
(
	input => BIN(3 downto 0),
	hex_out => saidaOut
);

end estrutural;
	