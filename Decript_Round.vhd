library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Decript_Round is
--  Generic ( );
--  Port ( );
    port(
        input   : in    std_logic_vector(127 downto 0);  -- Round Input
        key     : in    std_logic_vector(127 downto 0);  -- Key input for RoundKey Generator
        output  : out   std_logic_vector(127 downto 0)   -- Output Round
    );
end Decript_Round;

architecture rtl of Decript_Round is

    -- Declarative zone of VHDL
    
    component AddRoundKey is
        port(
            a   : in  std_logic_vector(127 downto 0);
            key : in  std_logic_vector(127 downto 0);
            b   : out std_logic_vector(127 downto 0)
        );
    end component;
    
    component InvSubBytes is
        port(
            input   : in  std_logic_vector(127 downto 0); -- In
            output  : out std_logic_vector(127 downto 0)  -- Out
        );
    end component;
    
    component InvShiftRows is
        port(
            a : in  std_logic_vector(127 downto 0);
            b : out std_logic_vector(127 downto 0)
        );
    end component;
    
    component InvMixColumns is
        port(
            a : in  std_logic_vector(127 downto 0);
            b : out std_logic_vector(127 downto 0)
        );
    end component;
    
    signal out_InvSubBytes, out_InvShiftRows, out_InvMixCoulumns, out_AddRoundKey : std_logic_vector(127 downto 0) := (others => '0');

begin

       -- Out signal assigment
       output  <= out_InvMixCoulumns;

       InvShiftRows_step : InvShiftRows
        port map(
            a => input,
            b => out_InvShiftRows 
        );
        
       InvSubbytes_step : InvSubBytes
        port map(
            input  => out_InvShiftRows,
            output => out_InvSubBytes
        );
        
       AddRoundKey_step : AddRoundKey
        port map(
           a   => out_InvSubBytes,
           key => key,
           b   => out_AddRoundKey
        );
        
       InvMixColums_step : InvMixColumns
        port map(
            a => out_AddRoundKey,
            b => out_InvMixCoulumns
        );
       
end rtl;
