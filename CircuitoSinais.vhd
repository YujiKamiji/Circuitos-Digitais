library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CircuitoSinais is
    Port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        sinal_PISO  : out std_logic;
        sinal_MEMO  : out std_logic;
        sinal_LOAD  : out std_logic
    );
end CircuitoSinais;

architecture Behavioral of CircuitoSinais is
    signal contador_s1 : integer range 0 to 20 := 0;
    signal estado_s1   : std_logic := '0';
    signal clk_old     : std_logic := '0';

    signal pulso_s2 : std_logic := '0';
    signal estado_s3 : std_logic := '1';
    signal contador_s3 : integer range 0 to 2 := 0;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            contador_s1 <= 0;
            estado_s1 <= '0';
            clk_old <= '0';
        elsif falling_edge(clk) then
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

    sinal_PISO <= estado_s1;

    process(clk, reset)
    begin
        if reset = '1' then
            pulso_s2 <= '0';
        elsif falling_edge(clk) then
            if contador_s1 = 18 then
                pulso_s2 <= '1';
            else
                pulso_s2 <= '0';
            end if;
        end if;
    end process;

    sinal_MEMO <= pulso_s2;

    process(clk, reset)
    begin
        if reset = '1' then
            estado_s3 <= '1';
            contador_s3 <= 0;
        elsif falling_edge(clk) then
            if estado_s3 = '1' and contador_s3 < 2 then
                contador_s3 <= contador_s3 + 1;
            elsif pulso_s2 = '1' then
                estado_s3 <= '1';
                contador_s3 <= 0;
            elsif contador_s3 = 2 then
                estado_s3 <= '0';
            end if;
        end if;
    end process;

    sinal_LOAD <= estado_s3;

end Behavioral;
