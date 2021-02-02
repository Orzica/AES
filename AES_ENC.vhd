library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


entity AES_ENC is
--  Generic ( );
--  Port ( );
    port(
        plain_text  : in  std_logic_vector(127 downto 0);
        key         : in  std_logic_vector(127 downto 0);
        cipher_text : out std_logic_vector(127 downto 0)
    );
end AES_ENC;

architecture rtl of AES_ENC is

    -- Declarative zone of VHDL
    
    -- Components declaration
    
    type byte is array(0 to 9) of std_logic_vector(7 downto 0);
    signal rcon : byte := (x"01", x"02", x"04", x"08", x"10", x"20", x"40", x"80", x"1b", x"36");
    
    type out_k is array(0 to 9) of std_logic_vector(127 downto 0);
    signal out_key : out_k := (others => (others => '0'));
    
    component AddRoundKey is
        port(
            a   : in  std_logic_vector(127 downto 0);
            key : in  std_logic_vector(127 downto 0);
            b   : out std_logic_vector(127 downto 0)
        );
    end component;
    
    component Encript_Round is
        port(
            input   : in    std_logic_vector(127 downto 0);  -- Round Input
            key     : in    std_logic_vector(127 downto 0);  -- Key input for RoundKey Generator
            output  : out   std_logic_vector(127 downto 0)   -- Output Round
        );
    end component;
    
    component Encript_Last_Round is
        port(
            input   : in    std_logic_vector(127 downto 0);  -- Round Input
            key     : in    std_logic_vector(127 downto 0);  -- Key input for RoundKey Generator
            output  : out   std_logic_vector(127 downto 0)   -- Output Round
        );    
    end component;
    
    signal out_initial_round : std_logic_vector(127 downto 0) := (others => '0'); -- Out round one
           
    type out_rounds is array(0 to 8) of std_logic_vector(127 downto 0); -- 
    signal out_r : out_rounds := (others => (others => '0')); -- Out of 9 main rounds out_r(8)
    
   component KeySchedule is
        port(
            cipher_key : in  std_logic_vector(127 downto 0);
            rcon       : in  std_logic_vector(  7 downto 0);
            round_key  : out std_logic_vector(127 downto 0)
        );
    end component;
            
begin

    -- plain_text => x"328831e0435a3137f6309807a88da234";
    -- key        => x"2b28ab097eaef7cf15d2154f16a6883c";

   r1_key: KeySchedule
        port map(
            cipher_key => key,
            rcon       => rcon(0),
            round_key  => out_key(0)
        );
        
    r2_key: KeySchedule
        port map(
            cipher_key => out_key(0),
            rcon       => rcon(1),
            round_key  => out_key(1)
        );
        
    r3_key: KeySchedule
        port map(
            cipher_key => out_key(1),
            rcon       => rcon(2),
            round_key  => out_key(2)
        );
        
    r4_key: KeySchedule
        port map(
            cipher_key => out_key(2),
            rcon       => rcon(3),
            round_key  => out_key(3)
        );
        
    r5_key: KeySchedule
        port map(
            cipher_key => out_key(3),
            rcon       => rcon(4),
            round_key  => out_key(4)
        );
        
    r6_key: KeySchedule
        port map(
            cipher_key => out_key(4),
            rcon       => rcon(5),
            round_key  => out_key(5)
        );
        
    r7_key: KeySchedule
        port map(
            cipher_key => out_key(5),
            rcon       => rcon(6),
            round_key  => out_key(6)
        );
        
    r8_key: KeySchedule
        port map(
            cipher_key => out_key(6),
            rcon       => rcon(7),
            round_key  => out_key(7)
        );
        
    r9_key: KeySchedule
        port map(
            cipher_key => out_key(7),
            rcon       => rcon(8),
            round_key  => out_key(8)
        );
        
    r10_key: KeySchedule
        port map(
            cipher_key => out_key(8),
            rcon       => rcon(9),
            round_key  => out_key(9)
        );
            
    Encript_Initial_Round : AddRoundKey
        port map(a => plain_text, key => key, b => out_initial_round);
               
      ----------Round 1------------
    r1 : Encript_Round
        port map(
            input   => out_initial_round,
            key     => out_key(0), -- Based on key_in, we generate the round key for next round
            output  => out_r(0)
        ); 
        
      ----------Round 2------------
    r2 : Encript_Round
        port map(
            input   => out_r(0),
            key     => out_key(1),
            output  => out_r(1)
        ); 
        
      ----------Round 3------------
    r3 : Encript_Round
        port map(
            input   => out_r(1),
            key     => out_key(2),
            output  => out_r(2)
        ); 
        
      ----------Round 4------------
    r4 : Encript_Round
        port map(
            input   => out_r(2),
            key     => out_key(3),
            output  => out_r(3)
        );
        
      ----------Round 5------------
    r5 : Encript_Round
        port map(
            input   => out_r(3),
            key     => out_key(4),
            output  => out_r(4)
        );
        
      ----------Round 6------------
    r6 : Encript_Round
        port map(
            input   => out_r(4),
            key     => out_key(5),
            output  => out_r(5)
        );
        
      ----------Round 7------------
    r7 : Encript_Round
        port map(
            input   => out_r(5),
            key     => out_key(6),
            output  => out_r(6)
        );
        
      ----------Round 8------------
    r8 : Encript_Round
        port map(
            input   => out_r(6),
            key     => out_key(7),
            output  => out_r(7)
        );
        
      ----------Round 9------------
    r9 : Encript_Round
        port map(
            input   => out_r(7),
            key     => out_key(8),
            output  => out_r(8)
        );
        
     ----------Round 10-----------   
    r10 : Encript_Last_Round
        port map(
            input   => out_r(8),
            key     => out_key(9),
            output  => cipher_text
        );

end rtl;
