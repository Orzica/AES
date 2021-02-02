library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity InvSubBytes is
--  Generic ( );
--  Port ( );
    port(
        input   : in  std_logic_vector(127 downto 0); -- In
        output  : out std_logic_vector(127 downto 0)  -- Out
    );
end InvSubBytes;

--  00 | 12 | 0C | 08   SubByte     63 | C9 | FE | 30
    -----------------               -----------------
--  04 | 04 | 00 | 23  =========>   F2 | F2 | 63 | 26
    -----------------               -----------------
--  12 | 12 | 13 | 19               C9 | C9 | 7D | D4
    -----------------               -----------------
--  14 | 00 | 11 | 19               FA | 63 | 82 | D4

architecture rtl of InvSubBytes is

    -- Declarative zone of VHDL
    component InvSbox is
        port(
            a  : in  std_logic_vector(7 downto 0); -- In
            b  : out std_logic_vector(7 downto 0)  -- Out
            );    
    end component;
    
                      
begin
    
q1  : InvSbox 
    port map(
        a  => input(127 downto 120),
        b  => output(127 downto 120)
        );
q2  : InvSbox 
    port map(
        a  => input(119 downto 112),
        b  => output(119 downto 112)
        );
q3 : InvSbox 
    port map(
        a  => input(111 downto 104),
        b  => output(111 downto 104)
        );
q4  : InvSbox 
    port map(
        a  => input(103 downto 96),
        b  => output(103 downto 96)
        );


q5  : InvSbox 
    port map(
        a  => input(95 downto 88),
        b  => output(95 downto 88)
        );


q6  : InvSbox 
    port map(
        a  => input(87 downto 80),
        b  => output(87 downto 80)
        );
 
q7  : InvSbox 
    port map(
        a  => input(79 downto 72),
        b  => output(79 downto 72)
        );
        
q8  : InvSbox 
    port map(
        a  => input(71 downto 64),
        b  => output(71 downto 64)
        );
        
q9  : InvSbox 
    port map(
        a  => input(63 downto 56),
        b  => output(63 downto 56)
        );
     
q10 : InvSbox 
    port map(
        a  => input(55 downto 48),
        b  => output(55 downto 48)
        );
        
q11 : InvSbox 
    port map(
        a  => input(47 downto 40),
        b  => output(47 downto 40)
        );
        
q12 : InvSbox 
    port map(
        a  => input(39 downto 32),
        b  => output(39 downto 32)
        );
        
q13 : InvSbox 
    port map(
        a  => input(31 downto 24),
        b  => output(31 downto 24)
        );
        
q14 : InvSbox 
    port map(
        a  => input(23 downto 16),
        b  => output(23 downto 16)
        );
        
q15 : InvSbox 
    port map(
        a  => input(15 downto 8),
        b  => output(15 downto 8)
        );
        
q16 : InvSbox 
    port map(
        a  => input(7 downto 0),
        b  => output(7 downto 0)
        );   
    


end rtl;
