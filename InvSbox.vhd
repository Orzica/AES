library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity InvSbox is
--  Generic ( );
--  Port ( );
    port(
        a  : in  std_logic_vector(7 downto 0); -- In
        b  : out std_logic_vector(7 downto 0)  -- Out
        );
end InvSbox;

architecture rtl of InvSbox is

begin

   sbox_InvSub : process(a) is
    begin
    
        case (a) is
        
            when x"63" => b <= x"00";
            when x"7c" => b <= x"01";
            when x"77" => b <= x"02";
            when x"7b" => b <= x"03";
            when x"f2" => b <= x"04";
            when x"6b" => b <= x"05";
            when x"6f" => b <= x"06";
            when x"c5" => b <= x"07";
            when x"30" => b <= x"08";
            when x"01" => b <= x"09";
            when x"67" => b <= x"0a";
            when x"2b" => b <= x"0b";
            when x"fe" => b <= x"0c";
            when x"d7" => b <= x"0d";
            when x"ab" => b <= x"0e";
            when x"76" => b <= x"0f";
            
            when x"ca" => b <= x"10";
            when x"82" => b <= x"11";
            when x"c9" => b <= x"12";
            when x"7d" => b <= x"13";
            when x"fa" => b <= x"14";
            when x"59" => b <= x"15";
            when x"47" => b <= x"16";
            when x"f0" => b <= x"17";
            when x"ad" => b <= x"18";
            when x"d4" => b <= x"19";
            when x"a2" => b <= x"1a";
            when x"af" => b <= x"1b";
            when x"9c" => b <= x"1c";
            when x"a4" => b <= x"1d";
            when x"72" => b <= x"1e";
            when x"c0" => b <= x"1f";
            
            when x"b7" => b <= x"20";
            when x"fd" => b <= x"21";
            when x"93" => b <= x"22";
            when x"26" => b <= x"23";
            when x"36" => b <= x"24";
            when x"3f" => b <= x"25";
            when x"f7" => b <= x"26";
            when x"cc" => b <= x"27";
            when x"34" => b <= x"28";
            when x"a5" => b <= x"29";
            when x"e5" => b <= x"2a";
            when x"f1" => b <= x"2b";
            when x"71" => b <= x"2c";
            when x"d8" => b <= x"2d";
            when x"31" => b <= x"2e";
            when x"15" => b <= x"2f";
            
            when x"04" => b <= x"30";
            when x"c7" => b <= x"31";
            when x"23" => b <= x"32";
            when x"c3" => b <= x"33";
            when x"18" => b <= x"34";
            when x"96" => b <= x"35";
            when x"05" => b <= x"36";
            when x"9a" => b <= x"37";
            when x"07" => b <= x"38";
            when x"12" => b <= x"39";
            when x"80" => b <= x"3a";
            when x"e2" => b <= x"3b";
            when x"eb" => b <= x"3c";
            when x"27" => b <= x"3d";
            when x"b2" => b <= x"3e";
            when x"75" => b <= x"3f";
            
            when x"09" => b <= x"40";
            when x"83" => b <= x"41";
            when x"2c" => b <= x"42";
            when x"1a" => b <= x"43";
            when x"1b" => b <= x"44";
            when x"6e" => b <= x"45";
            when x"5a" => b <= x"46";
            when x"a0" => b <= x"47";
            when x"52" => b <= x"48";
            when x"3b" => b <= x"49";
            when x"d6" => b <= x"4a";
            when x"b3" => b <= x"4b";
            when x"29" => b <= x"4c";
            when x"e3" => b <= x"4d";
            when x"2f" => b <= x"4e";
            when x"84" => b <= x"4f";
            
            when x"53" => b <= x"50";
            when x"d1" => b <= x"51";
            when x"00" => b <= x"52";
            when x"ed" => b <= x"53";
            when x"20" => b <= x"54";
            when x"fc" => b <= x"55";
            when x"b1" => b <= x"56";
            when x"5b" => b <= x"57";
            when x"6a" => b <= x"58";
            when x"cb" => b <= x"59";
            when x"be" => b <= x"5a";
            when x"39" => b <= x"5b";
            when x"4a" => b <= x"5c";
            when x"4c" => b <= x"5d";
            when x"58" => b <= x"5e";
            when x"cf" => b <= x"5f";
            
            when x"d0" => b <= x"60";
            when x"ef" => b <= x"61";
            when x"aa" => b <= x"62";
            when x"fb" => b <= x"63";
            when x"43" => b <= x"64";
            when x"4d" => b <= x"65";
            when x"33" => b <= x"66";
            when x"85" => b <= x"67";
            when x"45" => b <= x"68";
            when x"f9" => b <= x"69";
            when x"02" => b <= x"6a";
            when x"7f" => b <= x"6b";
            when x"50" => b <= x"6c";
            when x"3c" => b <= x"6d";
            when x"9f" => b <= x"6e";
            when x"a8" => b <= x"6f";
            
            when x"51" => b <= x"70";
            when x"a3" => b <= x"71";
            when x"40" => b <= x"72";
            when x"8f" => b <= x"73";
            when x"92" => b <= x"74";
            when x"9d" => b <= x"75";
            when x"38" => b <= x"76";
            when x"f5" => b <= x"77";
            when x"bc" => b <= x"78";
            when x"b6" => b <= x"79";
            when x"da" => b <= x"7a";
            when x"21" => b <= x"7b";
            when x"10" => b <= x"7c";
            when x"ff" => b <= x"7d";
            when x"f3" => b <= x"7e";
            when x"d2" => b <= x"7f";
            
            when x"cd" => b <= x"80";
            when x"0c" => b <= x"81";
            when x"13" => b <= x"82";
            when x"ec" => b <= x"83";
            when x"5f" => b <= x"84";
            when x"97" => b <= x"85";
            when x"44" => b <= x"86";
            when x"17" => b <= x"87";
            when x"c4" => b <= x"88";
            when x"a7" => b <= x"89";
            when x"7e" => b <= x"8a";
            when x"3d" => b <= x"8b";
            when x"64" => b <= x"8c";
            when x"5d" => b <= x"8d";
            when x"19" => b <= x"8e";
            when x"73" => b <= x"8f";
            
            when x"60" => b <= x"90";
            when x"81" => b <= x"91";
            when x"4f" => b <= x"92";
            when x"dc" => b <= x"93";
            when x"22" => b <= x"94";
            when x"2a" => b <= x"95";
            when x"90" => b <= x"96";
            when x"88" => b <= x"97";
            when x"46" => b <= x"98";
            when x"ee" => b <= x"99";
            when x"b8" => b <= x"9a";
            when x"14" => b <= x"9b";
            when x"de" => b <= x"9c";
            when x"5e" => b <= x"9d";
            when x"0b" => b <= x"9e";
            when x"db" => b <= x"9f";
            
            when x"e0" => b <= x"a0";
            when x"32" => b <= x"a1";
            when x"3a" => b <= x"a2";
            when x"0a" => b <= x"a3";
            when x"49" => b <= x"a4";
            when x"06" => b <= x"a5";
            when x"24" => b <= x"a6";
            when x"5c" => b <= x"a7";
            when x"c2" => b <= x"a8";
            when x"d3" => b <= x"a9";
            when x"ac" => b <= x"aa";
            when x"62" => b <= x"ab";
            when x"91" => b <= x"ac";
            when x"95" => b <= x"ad";
            when x"e4" => b <= x"ae";
            when x"79" => b <= x"af";
            
            when x"e7" => b <= x"b0";
            when x"c8" => b <= x"b1";
            when x"37" => b <= x"b2";
            when x"6d" => b <= x"b3";
            when x"8d" => b <= x"b4";
            when x"d5" => b <= x"b5";
            when x"4e" => b <= x"b6";
            when x"a9" => b <= x"b7";
            when x"6c" => b <= x"b8";
            when x"56" => b <= x"b9";
            when x"f4" => b <= x"ba";
            when x"ea" => b <= x"bb";
            when x"65" => b <= x"bc";
            when x"7a" => b <= x"bd";
            when x"ae" => b <= x"be";
            when x"08" => b <= x"bf";
            
            when x"ba" => b <= x"c0";
            when x"78" => b <= x"c1";
            when x"25" => b <= x"c2";
            when x"2e" => b <= x"c3";
            when x"1c" => b <= x"c4";
            when x"a6" => b <= x"c5";
            when x"b4" => b <= x"c6";
            when x"c6" => b <= x"c7";
            when x"e8" => b <= x"c8";
            when x"dd" => b <= x"c9";
            when x"74" => b <= x"ca";
            when x"1f" => b <= x"cb";
            when x"4b" => b <= x"cc";
            when x"bd" => b <= x"cd";
            when x"8b" => b <= x"ce";
            when x"8a" => b <= x"cf";
            
            when x"70" => b <= x"d0";
            when x"3e" => b <= x"d1";
            when x"b5" => b <= x"d2";
            when x"66" => b <= x"d3";
            when x"48" => b <= x"d4";
            when x"03" => b <= x"d5";
            when x"f6" => b <= x"d6";
            when x"0e" => b <= x"d7";
            when x"61" => b <= x"d8";
            when x"35" => b <= x"d9";
            when x"57" => b <= x"da";
            when x"b9" => b <= x"db";
            when x"86" => b <= x"dc";
            when x"c1" => b <= x"dd";
            when x"1d" => b <= x"de";
            when x"9e" => b <= x"df";
            
            when x"e1" => b <= x"e0";
            when x"f8" => b <= x"e1";
            when x"98" => b <= x"e2";
            when x"11" => b <= x"e3";
            when x"69" => b <= x"e4";
            when x"d9" => b <= x"e5";
            when x"8e" => b <= x"e6";
            when x"94" => b <= x"e7";
            when x"9b" => b <= x"e8";
            when x"1e" => b <= x"e9";
            when x"87" => b <= x"ea";
            when x"e9" => b <= x"eb";
            when x"ce" => b <= x"ec";
            when x"55" => b <= x"ed";
            when x"28" => b <= x"ee";
            when x"df" => b <= x"ef";
            
            when x"8c" => b <= x"f0";
            when x"a1" => b <= x"f1";
            when x"89" => b <= x"f2";
            when x"0d" => b <= x"f3";
            when x"bf" => b <= x"f4";
            when x"e6" => b <= x"f5";
            when x"42" => b <= x"f6";
            when x"68" => b <= x"f7";
            when x"41" => b <= x"f8";
            when x"99" => b <= x"f9";
            when x"2d" => b <= x"fa";
            when x"0f" => b <= x"fb";
            when x"b0" => b <= x"fc";
            when x"54" => b <= x"fd";
            when x"bb" => b <= x"fe";
            when x"16" => b <= x"ff"; 
            
            when others => b <= x"00";
        
        end case;
    
    end process sbox_InvSub;

end rtl;
