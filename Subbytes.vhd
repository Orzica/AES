library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Subbytes is
--  Generic ( );
--  Port ( );
    port(
        a : in  std_logic_vector(127 downto 0); -- In
        b : out std_logic_vector(127 downto 0)  -- Out
    );
end Subbytes;

--  00 | 12 | 0C | 08   SubByte     63 | C9 | FE | 30
    -----------------               -----------------
--  04 | 04 | 00 | 23  =========>   F2 | F2 | 63 | 26
    -----------------               -----------------
--  12 | 12 | 13 | 19               C9 | C9 | 7D | D4
    -----------------               -----------------
--  14 | 00 | 11 | 19               FA | 63 | 82 | D4

architecture rtl of Subbytes is

    -- Declarative zone of VHDL
    type byte is array (0 to 255) of std_logic_vector(7 downto 0);
    constant sbox : byte := (x"63", x"7c", x"77", x"7b", x"f2", x"6b", x"6f", x"c5", x"30", x"01", x"67", x"2b", x"fe", x"d7", x"ab", x"76",
                             x"ca", x"82", x"c9", x"7d", x"fa", x"59", x"47", x"f0", x"ad", x"d4", x"a2", x"af", x"9c", x"a4", x"72", x"c0",
                             x"b7", x"fd", x"93", x"26", x"36", x"3f", x"f7", x"cc", x"34", x"a5", x"e5", x"f1", x"71", x"d8", x"31", x"15",
                             x"04", x"c7", x"23", x"c3", x"18", x"96", x"05", x"9a", x"07", x"12", x"80", x"e2", x"eb", x"27", x"b2", x"75",
                             x"09", x"83", x"2c", x"1a", x"1b", x"6e", x"5a", x"a0", x"52", x"3b", x"d6", x"b3", x"29", x"e3", x"2f", x"84",
                             x"53", x"d1", x"00", x"ed", x"20", x"fc", x"b1", x"5b", x"6a", x"cb", x"be", x"39", x"4a", x"4c", x"58", x"cf",
                             x"d0", x"ef", x"aa", x"fb", x"43", x"4d", x"33", x"85", x"45", x"f9", x"02", x"7f", x"50", x"3c", x"9f", x"a8",
                             x"51", x"a3", x"40", x"8f", x"92", x"9d", x"38", x"f5", x"bc", x"b6", x"da", x"21", x"10", x"ff", x"f3", x"d2",
                             x"cd", x"0c", x"13", x"ec", x"5f", x"97", x"44", x"17", x"c4", x"a7", x"7e", x"3d", x"64", x"5d", x"19", x"73",
                             x"60", x"81", x"4f", x"dc", x"22", x"2a", x"90", x"88", x"46", x"ee", x"b8", x"14", x"de", x"5e", x"0b", x"db",
                             x"e0", x"32", x"3a", x"0a", x"49", x"06", x"24", x"5c", x"c2", x"d3", x"ac", x"62", x"91", x"95", x"e4", x"79",
                             x"e7", x"c8", x"37", x"6d", x"8d", x"d5", x"4e", x"a9", x"6c", x"56", x"f4", x"ea", x"65", x"7a", x"ae", x"08",
                             x"ba", x"78", x"25", x"2e", x"1c", x"a6", x"b4", x"c6", x"e8", x"dd", x"74", x"1f", x"4b", x"bd", x"8b", x"8a",
                             x"70", x"3e", x"b5", x"66", x"48", x"03", x"f6", x"0e", x"61", x"35", x"57", x"b9", x"86", x"c1", x"1d", x"9e",
                             x"e1", x"f8", x"98", x"11", x"69", x"d9", x"8e", x"94", x"9b", x"1e", x"87", x"e9", x"ce", x"55", x"28", x"df",
                             x"8c", x"a1", x"89", x"0d", x"bf", x"e6", x"42", x"68", x"41", x"99", x"2d", x"0f", x"b0", x"54", x"bb", x"16"
                             );
   
   constant line_number : integer := 16; 
      
begin
    
    --  Out signal assigments
    
    sbox_sub : process(a) is
    begin
    
        b(127 downto 120) <= sbox(TO_INTEGER(unsigned(a(127 downto 124))) * line_number + TO_INTEGER(unsigned(a(123 downto 120))));
        b(119 downto 112) <= sbox(TO_INTEGER(unsigned(a(119 downto 116))) * line_number + TO_INTEGER(unsigned(a(115 downto 112))));
        b(111 downto 104) <= sbox(TO_INTEGER(unsigned(a(111 downto 108))) * line_number + TO_INTEGER(unsigned(a(107 downto 104))));
        b(103 downto  96) <= sbox(TO_INTEGER(unsigned(a(103 downto 100))) * line_number + TO_INTEGER(unsigned(a(99  downto  96))));
        b(95  downto  88) <= sbox(TO_INTEGER(unsigned(a(95  downto  92))) * line_number + TO_INTEGER(unsigned(a(91  downto  88))));
        b(87  downto  80) <= sbox(TO_INTEGER(unsigned(a(87  downto  84))) * line_number + TO_INTEGER(unsigned(a(83  downto  80))));
        b(79  downto  72) <= sbox(TO_INTEGER(unsigned(a(79  downto  76))) * line_number + TO_INTEGER(unsigned(a(75  downto  72))));
        b(71  downto  64) <= sbox(TO_INTEGER(unsigned(a(71  downto  68))) * line_number + TO_INTEGER(unsigned(a(67  downto  64))));
        b(63  downto  56) <= sbox(TO_INTEGER(unsigned(a(63  downto  60))) * line_number + TO_INTEGER(unsigned(a(59  downto  56))));
        b(55  downto  48) <= sbox(TO_INTEGER(unsigned(a(55  downto  52))) * line_number + TO_INTEGER(unsigned(a(51  downto  48))));
        b(47  downto  40) <= sbox(TO_INTEGER(unsigned(a(47  downto  44))) * line_number + TO_INTEGER(unsigned(a(43  downto  40))));
        b(39  downto  32) <= sbox(TO_INTEGER(unsigned(a(39  downto  36))) * line_number + TO_INTEGER(unsigned(a(35  downto  32))));
        b(31  downto  24) <= sbox(TO_INTEGER(unsigned(a(31  downto  28))) * line_number + TO_INTEGER(unsigned(a(27  downto  24))));
        b(23  downto  16) <= sbox(TO_INTEGER(unsigned(a(23  downto  20))) * line_number + TO_INTEGER(unsigned(a(19  downto  16))));
        b(15  downto   8) <= sbox(TO_INTEGER(unsigned(a(15  downto  12))) * line_number + TO_INTEGER(unsigned(a(11  downto   8))));
        b(7   downto   0) <= sbox(TO_INTEGER(unsigned(a(7   downto   4))) * line_number + TO_INTEGER(unsigned(a(3   downto   0))));
    
    end process sbox_sub;
end rtl;