library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity InvShiftRows is
--  Generic ( );
--  Port ( );
    port(
        a : in  std_logic_vector(127 downto 0);
        b : out std_logic_vector(127 downto 0)
    );
end InvShiftRows;

   ---------------------                --------------------- 
-- s0  | s4  | s8  | s12             -- s0  | s4  | s8  | s12
   ---------------------                ---------------------
-- s5  | s9  | s13 | s1              -- s1  | s5  | s9  | s13
   --------------------- ==========>    --------------------- 
-- s10 | s14 | s2  | s6              -- s2  | s6  | s10 | s14
   ---------------------                ---------------------
-- s15 | s3  | s7  | s11             -- s3  | s7  | s11 | s15
   ---------------------                ---------------------



architecture rtl of InvShiftRows is

begin

    InvShift_proc: process(a) is
    begin
    
        b(127 downto 0) <= a(127 downto 120) & a(119 downto 112) & a(111 downto 104) & a(103 downto 96) &
                           a(71  downto  64) & a(95  downto  88) & a(87  downto  80) & a(79  downto 72) &
                           a(47  downto  40) & a(39  downto  32) & a(63  downto  56) & a(55  downto 48) &
                           a(23   downto 16) & a(15  downto   8) & a(7   downto   0) & a(31  downto  24);
                           
    end process InvShift_proc;
    
end rtl;
