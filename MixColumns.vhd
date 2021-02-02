library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity MixColumns is
--  Generic ( );
--  Port ( );
    port(
        a : in  std_logic_vector(127 downto 0);
        b : out std_logic_vector(127 downto 0)
    );
end MixColumns;

   ---------------------     -------------            --------------------- 
-- s0  | s4  | s8  | s12     2 | 3 | 1 | 1            p0  | p4  | p8  | p12
   ---------------------     -------------            ---------------------
-- s1  | s5  | s9  | s13     1 | 2 | 3 | 1            p1  | p5  | p9  | p13
   ---------------------  X  -------------    ====>   --------------------- 
-- s2  | s6  | s10 | s14     1 | 1 | 2 | 3            p2  | p6  | p10 | p14
   ---------------------     -------------            ---------------------
-- s3 |  s7  | s11 | s15     3 | 1 | 1 | 2            p3  |  p7 | p11 | p15
   ---------------------     -------------            ---------------------

architecture rtl of MixColumns is

    -- Declarative zone of VHDL
    
    function multiply_2(byte : std_logic_vector(7 downto 0)) return std_logic_vector is
        
        variable result : std_logic_vector(7 downto 0);
        
    begin
        
        result := byte(6 downto 0) & '0'; -- x 2
        if (byte(7) = '1') then
            return result xor x"1b";
        else
            return result;
        end if;
        
    end function;
    
    function multiply_3(byte : std_logic_vector(7 downto 0)) return std_logic_vector is
        
        variable result : std_logic_vector(7 downto 0);
        
    begin
        
        result := byte(6 downto 0) & '0'; -- x 2
        if (byte(7) = '1') then
            return result xor x"1b" xor byte;
        else
            return result xor byte;
        end if;
        
    end function;

begin
    
    -- a(127 downto 0) <= x"d4e0b81ebfb441275d52119830aef1e5"

    mix_proc: process(a) is
    begin
    
          b(127 downto 120) <= multiply_2(a(127 downto 120)) xor multiply_3(a(95  downto  88)) xor a(63  downto  56) xor a(31  downto  24);
          b(95  downto  88) <= a(127 downto 120) xor multiply_2(a(95  downto  88)) xor multiply_3(a(63  downto  56)) xor a(31  downto  24);
          b(63  downto  56) <= a(127 downto 120) xor a(95  downto  88) xor multiply_2(a(63  downto  56)) xor multiply_3(a(31  downto  24));
          b(31  downto  24) <= multiply_3(a(127 downto 120)) xor a(95  downto  88) xor a(63  downto  56) xor multiply_2(a(31  downto  24));
          
          b(119 downto 112) <= multiply_2(a(119 downto 112)) xor multiply_3(a(87  downto  80)) xor a(55  downto  48) xor a(23  downto  16);
          b(87  downto  80) <= a(119 downto 112) xor multiply_2(a(87  downto  80)) xor multiply_3(a(55  downto  48)) xor a(23  downto  16);
          b(55  downto  48) <= a(119 downto 112) xor a(87  downto  80) xor multiply_2(a(55  downto  48)) xor multiply_3(a(23  downto  16));
          b(23  downto  16) <= multiply_3(a(119 downto 112)) xor a(87  downto  80) xor a(55  downto  48) xor multiply_2(a(23  downto  16)); 
          
          b(111 downto 104) <= multiply_2(a(111 downto 104)) xor multiply_3(a(79  downto  72)) xor a(47  downto  40) xor a(15  downto   8);
          b(79  downto  72) <= a(111 downto 104) xor multiply_2(a(79  downto  72)) xor multiply_3(a(47  downto  40)) xor a(15  downto   8);
          b(47  downto  40) <= a(111 downto 104) xor a(79  downto  72) xor multiply_2(a(47  downto  40)) xor multiply_3(a(15  downto   8));
          b(15  downto   8) <= multiply_3(a(111 downto 104)) xor a(79  downto  72) xor a(47  downto  40) xor multiply_2(a(15  downto   8)); 
          
          b(103 downto  96) <= multiply_2(a(103 downto  96)) xor multiply_3(a(71  downto  64)) xor a(39  downto  32) xor a(7   downto   0);
          b(71  downto  64) <= a(103 downto  96) xor multiply_2(a(71  downto  64)) xor multiply_3(a(39  downto  32)) xor a(7   downto   0);
          b(39  downto  32) <= a(103 downto  96) xor a(71  downto  64) xor multiply_2(a(39  downto  32)) xor multiply_3(a(7   downto   0));
          b(7   downto   0) <= multiply_3(a(103 downto  96)) xor a(71  downto  64) xor a(39  downto  32) xor multiply_2(a(7   downto   0));
        
    end process mix_proc;

end rtl;
