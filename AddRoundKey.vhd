library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity AddRoundKey is
--  Generic ( );
--  Port ( );
    port(
        a   : in  std_logic_vector(127 downto 0);
        key : in  std_logic_vector(127 downto 0);
        b   : out std_logic_vector(127 downto 0)
    );
end AddRoundKey;

   ---------------------       -------------------            --------------------- 
-- a0  | a4  | a8  | a12       k0 | k4 | k8 | k12             b0  | b4  | b8  | b12
   ---------------------       -------------------            ---------------------
-- a1  | a5  | a9  | a13       k1 | k5 | k9 | k13             b1  | b5  | b9  | b13
   ---------------------  xor  -------------------   ====>    --------------------- 
-- a2  | a6  | a10 | a14       k2 | k6 | k10 | k14            b2  | b6  | b10 | b14
   ---------------------       -------------------            ---------------------
-- a3 |  a7  | a11 | a15       k3 | k7 | k11 | k15            b3  | b7  | b11 | b15
   ---------------------       -------------------            ---------------------

architecture rtl of AddRoundKey is

    -- Declarative zone of VHDL
    
begin

    add_key_proc: process(a, key) is
    begin
    
        b <= a xor key;
    
    end process add_key_proc;

end rtl;
