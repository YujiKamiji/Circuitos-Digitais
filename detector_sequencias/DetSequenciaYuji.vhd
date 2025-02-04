Library ieee; 
use ieee.std_logic_1164.all; 

ENTITY DetSequenciaYuji IS
   PORT(
      clk     : IN   STD_LOGIC;
      entrada : IN   STD_LOGIC;
      saida   : OUT  STD_LOGIC_VECTOR(3 downto 0));
END DetSequenciaYuji;


ARCHITECTURE funcionamento OF DetSequenciaYuji IS
   TYPE STATE_TYPE IS (s0, s1, s2, s3, s4, s5, s6, s7);
   SIGNAL estado   : STATE_TYPE;
   
BEGIN
   PROCESS (clk)
   BEGIN
      IF (clk'EVENT AND clk = '0') THEN -- falling edge
         CASE estado IS
            WHEN s0=>
               IF entrada = '1' THEN
                  estado <= s1;
               ELSE
                  estado <= s0;
               END IF;
           WHEN s1=>
               IF entrada = '1' THEN
                  estado <= s2;
               ELSE
                  estado <= s0;
               END IF;
            WHEN s2=>
               IF entrada = '1' THEN
                  estado <= s3;
               ELSE
                  estado <= s0;
               END IF;
			WHEN s3=>
               IF entrada = '1' THEN
                  estado <= s3;
               ELSE
                  estado <= s4;
               END IF;
			WHEN s4=>
               IF entrada = '1' THEN
                  estado <= s1;
               ELSE
                  estado <= s5;
               END IF;
            WHEN s5=>
               IF entrada = '1' THEN
                  estado <= s1;
               ELSE
                  estado <= s6;
               END IF;
            WHEN s6=>
               IF entrada = '1' THEN
                  estado <= s1;
               ELSE
                  estado <= s7;
               END IF;
			WHEN s7=>
               IF entrada = '1' THEN
                  estado <= s1;
               ELSE
                  estado <= s0;
               END IF;
         END CASE;
      END IF;
   END PROCESS;
   
   PROCESS (estado)
   BEGIN
      CASE estado IS
         WHEN s0 =>
            saida <= "0000";
         WHEN s1 =>
            saida <= "0001";
         WHEN s2 =>
            saida <= "0010";
		 WHEN s3 =>
            saida <= "0011";	
		 WHEN s4 =>
            saida <= "0100";
         WHEN s5 =>
            saida <= "0101";
         WHEN s6 =>
            saida <= "0110";
		 WHEN s7 =>
            saida <= "0111";
      END CASE;
   END PROCESS;
   
END funcionamento;