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
    
    component Rounds is
        port(
            input   : in    std_logic_vector(127 downto 0);  -- Round Input
            key_in  : in    std_logic_vector(127 downto 0);  -- Key input for RoundKey Generator
            key_out : out   std_logic_vector(127 downto 0);  -- Round Key for a specific round
            rcon    : in    std_logic_vector(7 downto 0);    -- Rcon for Key Schedule
            output  : out   std_logic_vector(127 downto 0)   -- Output Round
        );
    end component;
    
    component last_round is
        port(
            input   : in    std_logic_vector(127 downto 0);  -- Round Input
            key_in  : in    std_logic_vector(127 downto 0);  -- Key input for RoundKey Generator
            key_out : out   std_logic_vector(127 downto 0);  -- Round Key for a specific round
            rcon    : in    std_logic_vector(7   downto 0);    -- Rcon for Key Schedule
            output  : out   std_logic_vector(127 downto 0)   -- Output Round
        );    
    end component;
    
    signal out_initial_round : std_logic_vector(127 downto 0) := (others => '0'); -- Out round one
           
    type out_rounds is array(0 to 8) of std_logic_vector(127 downto 0); -- 
    signal out_r : out_rounds := (others => (others => '0')); -- Out of 9 main rounds out_r(8)
    

begin

    -- plain_text => x"328831e0435a3137f6309807a88da234";
    -- key        => x"2b28ab097eaef7cf15d2154f16a6883c";
    
    initial_round : AddRoundKey
        port map(a => plain_text, key => key, b => out_initial_round);
               
      ----------Round 1------------
    r1 : Rounds
        port map(
            input => out_initial_round,
            key_in => key,
            key_out => out_key(0), 
            rcon => rcon(0),
            output => out_r(0)
        ); 
        
      ----------Round 2------------
    r2 : Rounds
        port map(
            input => out_r(0),
            key_in => out_key(0),
            key_out => out_key(1), 
            rcon => rcon(1),
            output => out_r(1)
        ); 
        
      ----------Round 3------------
    r3 : Rounds
        port map(
            input => out_r(1),
            key_in => out_key(1),
            key_out => out_key(2), 
            rcon => rcon(2),
            output => out_r(2)
        ); 
        
      ----------Round 4------------
    r4 : Rounds
        port map(
            input => out_r(2),
            key_in => out_key(2),
            key_out => out_key(3), 
            rcon => rcon(3),
            output => out_r(3)
        );
        
      ----------Round 5------------
    r5 : Rounds
        port map(
            input => out_r(3),
            key_in => out_key(3),
            key_out => out_key(4), 
            rcon => rcon(4),
            output => out_r(4)
        );
        
      ----------Round 6------------
    r6 : Rounds
        port map(
            input => out_r(4),
            key_in => out_key(4),
            key_out => out_key(5), 
            rcon => rcon(5),
            output => out_r(5)
        );
        
      ----------Round 7------------
    r7 : Rounds
        port map(
            input => out_r(5),
            key_in => out_key(5),
            key_out => out_key(6), 
            rcon => rcon(6),
            output => out_r(6)
        );
        
      ----------Round 8------------
    r8 : Rounds
        port map(
            input => out_r(6),
            key_in => out_key(6),
            key_out => out_key(7), 
            rcon => rcon(7),
            output => out_r(7)
        );
        
      ----------Round 9------------
    r9 : Rounds
        port map(
            input => out_r(7),
            key_in => out_key(7),
            key_out => out_key(8), 
            rcon => rcon(8),
            output => out_r(8)
        );
        
     ----------Round 10-----------   
    r10 : last_round
        port map(
            input => out_r(8),
            key_in => out_key(8),
            key_out => out_key(9), 
            rcon => rcon(9),
            output => cipher_text
        );

end rtl;
