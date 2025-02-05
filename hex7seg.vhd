library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex7seg is
    Port (
        A, B, C, D : in STD_LOGIC;  
        Fa, Fb, Fc, Fd, Fe, Ff, Fg : out STD_LOGIC            
    );
end hex7seg;

architecture display of hex7seg is
	begin
		Fa <= not((not A and B and D) or
         (A and not B and not C) or
         (not B and not D) or
         (not A and C) or
         (A and not D) or
         (B and C));
			
		Fb <= not((A and not C and D) or
         (not A and C and D) or
         (not A and not C and not D) or
         (not B and not D) or
         (not A and not B));
			
		Fc <= not((not C and D) or
         (not A and B) or
         (A and not B) or
         (not A and D) or
         (not A and not C));
			
		Fd  <= not((B and not C and D) or
         (A and not C) or
         (not B and C and D) or
         (not A and not B and not D) or
         (B and C and not D));
		
		Fe <= not((not B and not D) or
         (C and not D) or
         (A and B) or
         (A and C));
			
		Ff <= not((not A and B and not C) or
         (A and C) or
         (B and not D) or
         (not C and not D) or
         (A and not B));
			
		 Fg <= not((not B and C) or
         (C and not D) or
         (A and not B) or
         (A and D) or
         (not A and B and not C));
			
		
	end display;