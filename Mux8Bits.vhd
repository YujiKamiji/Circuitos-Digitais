library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux8Bits is
    Port (
        D0 : in STD_LOGIC_VECTOR(7 downto 0);  -- Entrada 0 de 8 bits
        D1 : in STD_LOGIC_VECTOR(7 downto 0);  -- Entrada 1 de 8 bits
        Sel : in STD_LOGIC;                    -- Seletor de 1 bit
        Y : out STD_LOGIC_VECTOR(7 downto 0)   -- Saída de 8 bits
    );
end Mux8Bits;

architecture Behavioral of Mux8Bits is
begin
    process (D0, D1, Sel)
    begin
        if Sel = '0' then
            Y <= D0;
        else
            Y <= D1;
        end if;
    end process;
end Behavioral;