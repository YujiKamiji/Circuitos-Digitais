library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contador_0_a_511 is
    Port (
        clk     : in  STD_LOGIC;  -- Clock de entrada
        reset   : in  STD_LOGIC;  -- Reset do contador
        A, B, C, D, E, F, G, H, I : out STD_LOGIC;  -- Bits do número em binário (A mais significativo, I menos significativo)
        pulso   : out STD_LOGIC   -- Pulso na transição de 511 para 0
    );
end contador_0_a_511;

architecture Behavioral of contador_0_a_511 is
    signal contador : STD_LOGIC_VECTOR(8 downto 0) := (others => '0');  -- Contador de 9 bits
    signal pulso_reg : STD_LOGIC := '0';  -- Registro para gerar o pulso
begin
    process(clk, reset)
    begin
        if reset = '1' then
            contador <= (others => '0');
            pulso_reg <= '0';
        elsif rising_edge(clk) then
            if contador = "111111111" then  -- Verifica se o contador chegou a 511
                contador <= (others => '0');  -- Reinicia o contador para 0
                pulso_reg <= '1';            -- Gera o pulso
            else
                contador <= contador + 1;  -- Incrementa o contador
                pulso_reg <= '0';          -- Garante que o pulso seja apenas 1 ciclo
            end if;
        end if;
    end process;

    -- Atribui os bits do contador às saídas A, B, C, ..., I
    A <= contador(8);
    B <= contador(7);
    C <= contador(6);
    D <= contador(5);
    E <= contador(4);
    F <= contador(3);
    G <= contador(2);
    H <= contador(1);
    I <= contador(0);

    -- Pulso de saída
    pulso <= pulso_reg;

end Behavioral;
