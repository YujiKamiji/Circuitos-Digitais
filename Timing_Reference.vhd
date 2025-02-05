library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Timing_Reference is
    port ( 
        clk: in std_logic;  -- Pin connected to P11 (N14)
        clk_2s: out std_logic -- Can check it using PIN A8 - LEDR0
    );
end Timing_Reference;

architecture freq_div of Timing_Reference is

    signal count: integer := 0;
    signal tmp : std_logic := '0';

begin

    process(clk)
    begin
        if(clk'event and clk='1') then
            count <= count + 1;
            if (count = 6250000) then  -- Divide 50 MHz by 12500000 to get 0.25 s 6250000
                tmp <= NOT tmp;       -- Toggle the signal
                count <= 0;           -- Reset counter
            end if;
        end if;
        clk_2s <= tmp;                -- Output the toggled signal
    end process;

end freq_div;
