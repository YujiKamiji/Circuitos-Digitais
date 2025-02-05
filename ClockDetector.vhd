library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ClockDetector is
    Port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        Sinal_Detector  : out std_logic
    );
end ClockDetector;

architecture Behavioral of ClockDetector is
    signal contador_s1 : integer range 2 to 20 := 0;
	 signal estado_s1   : std_logic := '0';
    signal clk_old     : std_logic := '0';
begin

	process(clk, reset)
     begin
        if reset = '1' then
            contador_s1 <= 0;
            estado_s1 <= '0';
            clk_old <= '0';
        elsif rising_edge(clk) then
            if contador_s1 < 15 then
                estado_s1 <= not estado_s1;
                contador_s1 <= contador_s1 + 1;
            elsif contador_s1 < 20 then
                estado_s1 <= '0';
                contador_s1 <= contador_s1 + 1;
            else
                contador_s1 <= 0;
            end if;
        end if;
     end process;

    Sinal_Detector <= estado_s1;
	 
end Behavioral;