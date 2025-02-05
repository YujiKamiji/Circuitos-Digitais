library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SinalGerador is
    Port (
        clk         : in  std_logic;
        reset       : in  std_logic;
        sinal_9     : out std_logic;
        sinal_toggle: out std_logic;
        sinal_zero  : out std_logic
    );
end SinalGerador;

architecture Behavioral of SinalGerador is
    signal contador : integer range 0 to 9 := 0;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            contador <= 0;
        elsif rising_edge(clk) then
            if contador = 9 then
                contador <= 0;
            else
                contador <= contador + 1;
            end if;
        end if;
    end process;

    -- Ativa a cada 9 clocks
    sinal_9 <= '1' when contador = 9 else '0';

    -- Oscila entre o ciclo 0 e 9 (toggle)
    sinal_toggle <= '1' when contador < 5 else '0';

    -- Ativa apenas no ciclo 0
    sinal_zero <= '1' when contador = 0 else '0';

end Behavioral;
