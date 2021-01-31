library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity last_round is
--  Generic ( );
--  Port ( );
    port(
        input   : in    std_logic_vector(127 downto 0);  -- Round Input
        key_in  : in    std_logic_vector(127 downto 0);  -- Key input for RoundKey Generator
        key_out : out   std_logic_vector(127 downto 0);  -- Round Key for a specific round
        rcon    : in    std_logic_vector(7   downto 0);    -- Rcon for Key Schedule
        output  : out   std_logic_vector(127 downto 0)   -- Output Round
    );
end last_round;

architecture rtl of last_round is

    -- Declarative zone of VHDL
    
    signal key : std_logic_vector(127 downto 0) := (others => '0');
    
    component KeySchedule is
        port(
            cipher_key : in  std_logic_vector(127 downto 0);
            rcon       : in  std_logic_vector(  7 downto 0);
            round_key  : out std_logic_vector(127 downto 0)
        );
    end component;
    
    component AddRoundKey is
        port(
            a   : in  std_logic_vector(127 downto 0);
            key : in  std_logic_vector(127 downto 0);
            b   : out std_logic_vector(127 downto 0)
        );
    end component;
    
    component Subbytes is
        port(
            a : in  std_logic_vector(127 downto 0); -- In
            b : out std_logic_vector(127 downto 0)  -- Out
        );
    end component;
    
    component ShiftRows is
        port(
            a : in  std_logic_vector(127 downto 0);
            b : out std_logic_vector(127 downto 0)
        );
    end component;
    
    signal out_SubBytes, out_ShiftRows, out_AddRoundKey : std_logic_vector(127 downto 0) := (others => '0');

begin
    
       key_out <= key;
       output  <= out_AddRoundKey;

       Subbytes_step : Subbytes
        port map(
            a => input,
            b => out_SubBytes
        ); 
        
       ShiftRows_step : ShiftRows
        port map(
            a => out_SubBytes,
            b => out_ShiftRows 
        );
        
       KeySchedule_step : KeySchedule
        port map(
           cipher_key => key_in,
           rcon       => rcon,
           round_key  => key
        );
        
       AddRoundKey_step : AddRoundKey
        port map(
           a => out_ShiftRows,
           key => key,
           b => out_AddRoundKey
        );

end rtl;
