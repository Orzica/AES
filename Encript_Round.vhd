library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


entity Encript_Round is
--  Generic ( );
--  Port ( );
    port(
        input   : in    std_logic_vector(127 downto 0);  -- Round Input
        key     : in    std_logic_vector(127 downto 0);  -- Key input for RoundKey Generator
        output  : out   std_logic_vector(127 downto 0)   -- Output Round
    );
end Encript_Round;

architecture rtl of Encript_Round is

    -- Declarative zone of VHDL
    
    component AddRoundKey is
        port(
            a   : in  std_logic_vector(127 downto 0);
            key : in  std_logic_vector(127 downto 0);
            b   : out std_logic_vector(127 downto 0)
        );
    end component;
    
    component SubBytes is
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
    
    component MixColumns is
        port(
            a : in  std_logic_vector(127 downto 0);
            b : out std_logic_vector(127 downto 0)
        );
    end component;
    
    signal out_SubBytes, out_ShiftRows, out_MixCoulumns, out_AddRoundKey : std_logic_vector(127 downto 0) := (others => '0');

begin
        
       -- Out signal assigment
       output  <= out_AddRoundKey;
    
       Subbytes_step : SubBytes
        port map(
            a => input,
            b => out_SubBytes
        ); 
        
       ShiftRows_step : ShiftRows
        port map(
            a => out_SubBytes,
            b => out_ShiftRows 
        );
        
       MixColumns_step : MixColumns
        port map(
            a => out_ShiftRows,
            b => out_MixCoulumns
        );
        
        
       AddRoundKey_step : AddRoundKey
        port map(
           a   => out_MixCoulumns,
           key => key,
           b   => out_AddRoundKey
        );
    

end rtl;
