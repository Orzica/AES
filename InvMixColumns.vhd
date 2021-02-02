library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity InvMixColumns is
--  Generic ( );
--  Port ( );
    port(
        a : in  std_logic_vector(127 downto 0);
        b : out std_logic_vector(127 downto 0)
    );
end InvMixColumns;

   ---------------------     -----------------            --------------------- 
-- s0  | s4  | s8  | s12     14 | 11 | 13 |  9            p0  | p4  | p8  | p12
   ---------------------     -----------------            ---------------------
-- s1  | s5  | s9  | s13      9 | 14 | 11 | 13            p1  | p5  | p9  | p13
   ---------------------  X  -----------------    ====>   --------------------- 
-- s2  | s6  | s10 | s14     13 |  9 | 14 | 11            p2  | p6  | p10 | p14
   ---------------------     -----------------            ---------------------
-- s3 |  s7  | s11 | s15     11 | 13 |  9 | 14            p3  |  p7 | p11 | p15
   ---------------------     -----------------            ---------------------

architecture rtl of InvMixColumns is

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
    
    function multiply_9(byte : std_logic_vector(7 downto 0)) return std_logic_vector is -- x×9=(((x×2)×2)×2)+x
    begin
        
        return multiply_2(multiply_2(multiply_2(byte))) xor byte;
        
    end function;
    
    function multiply_11(byte : std_logic_vector(7 downto 0)) return std_logic_vector is -- x×11=((((x×2)×2)+x)×2)+x
    begin
        
        return multiply_2((multiply_2(multiply_2(byte)) xor byte)) xor byte;
        
    end function;
    
    function multiply_13(byte : std_logic_vector(7 downto 0)) return std_logic_vector is -- x×13=((((x×2)+x)×2)×2)+x
    begin
        
        return multiply_2(multiply_2(multiply_2(byte) xor byte)) xor byte;
        
    end function;
    
    function multiply_14(byte : std_logic_vector(7 downto 0)) return std_logic_vector is -- x×14=((((x×2)+x)×2)+x)×2
    begin
        
        return multiply_2((multiply_2(multiply_2(byte) xor byte)) xor byte);
        
    end function;
    
begin
    
    -- a <= x"04e0482866cbf8068119d326e59a7a4c";
    -- b <= x"d4e0b81ebfb441275d52119830aef1e5";
    

    InvMix_proc: process(a) is
    begin
    
        b(127 downto 120) <= multiply_14(a(127 downto 120)) xor multiply_11(a(95  downto  88)) xor multiply_13(a(63  downto  56)) xor multiply_9(a(31  downto  24));
        b(95  downto  88) <= multiply_9(a(127 downto 120)) xor multiply_14(a(95  downto  88)) xor multiply_11(a(63  downto  56)) xor multiply_13(a(31  downto  24));
        b(63  downto  56) <= multiply_13(a(127 downto 120)) xor multiply_9(a(95  downto  88)) xor multiply_14(a(63  downto  56)) xor multiply_11(a(31  downto  24));
        b(31  downto  24) <= multiply_11(a(127 downto 120)) xor multiply_13(a(95  downto  88)) xor multiply_9(a(63  downto  56)) xor multiply_14(a(31  downto  24));
        
        b(119 downto 112) <= multiply_14(a(119 downto 112)) xor multiply_11(a(87  downto  80)) xor multiply_13(a(55  downto  48)) xor multiply_9(a(23  downto  16));
        b(87  downto  80) <= multiply_9(a(119 downto 112)) xor multiply_14(a(87  downto  80)) xor multiply_11(a(55  downto  48)) xor multiply_13(a(23  downto  16));
        b(55  downto  48) <= multiply_13(a(119 downto 112)) xor multiply_9(a(87  downto  80)) xor multiply_14(a(55  downto  48)) xor multiply_11(a(23  downto  16));
        b(23  downto  16) <= multiply_11(a(119 downto 112)) xor multiply_13(a(87  downto  80)) xor multiply_9(a(55  downto  48)) xor multiply_14(a(23  downto  16));
        
        b(111 downto 104) <= multiply_14(a(111 downto 104)) xor multiply_11(a(79  downto  72)) xor multiply_13(a(47  downto  40)) xor multiply_9(a(15  downto   8));
        b(79  downto  72) <= multiply_9(a(111 downto 104)) xor multiply_14(a(79  downto  72)) xor multiply_11(a(47  downto  40)) xor multiply_13(a(15  downto   8));
        b(47  downto  40) <= multiply_13(a(111 downto 104)) xor multiply_9(a(79  downto  72)) xor multiply_14(a(47  downto  40)) xor multiply_11(a(15  downto   8));
        b(15  downto   8) <= multiply_11(a(111 downto 104)) xor multiply_13(a(79  downto  72)) xor multiply_9(a(47  downto  40)) xor multiply_14(a(15  downto   8));
        
        b(103 downto  96) <= multiply_14(a(103 downto  96)) xor multiply_11(a(71  downto  64)) xor multiply_13(a(39  downto  32)) xor multiply_9(a(7   downto   0));
        b(71  downto  64) <= multiply_9(a(103 downto  96)) xor multiply_14(a(71  downto  64)) xor multiply_11(a(39  downto  32)) xor multiply_13(a(7   downto   0));
        b(39  downto  32) <= multiply_13(a(103 downto  96)) xor multiply_9(a(71  downto  64)) xor multiply_14(a(39  downto  32)) xor multiply_11(a(7   downto   0));
        b(7   downto   0) <= multiply_11(a(103 downto  96)) xor multiply_13(a(71  downto  64)) xor multiply_9(a(39  downto  32)) xor multiply_14(a(7   downto   0));
    
    end process InvMix_proc;


end rtl;
