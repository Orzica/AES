library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity AES is
--  Generic ( );
--  Port ( );
    port(
        clk         : in  std_logic;
        plain_text  : in  std_logic_vector(127 downto 0);
        cipher_text : out std_logic_vector(127 downto 0)
    );
end AES;

architecture rtl of AES is -- plain_text and cipher_text ports should be identical

    -- Declarative zone of VHDL
    
    signal key         : std_logic_vector(127 downto 0) := x"2b28ab097eaef7cf15d2154f16a6883c";
    
    -- Encryption Component
    component AES_ENC is
        port(
            plain_text  : in  std_logic_vector(127 downto 0);
            key         : in  std_logic_vector(127 downto 0);
            cipher_text : out std_logic_vector(127 downto 0)
        );    
    end component;
    
    -- Decryption Component
    component AES_DEC is
        port(
            cipher_text : in  std_logic_vector(127 downto 0);
            key         : in  std_logic_vector(127 downto 0);
            plain_text  : out std_logic_vector(127 downto 0)
        );    
    end component;
    
    signal cipher_text_reg : std_logic_vector(127 downto 0) := (others => '0');
    
begin

    Encript : AES_ENC
        port map(
            plain_text  => plain_text,
            key         => key,
            cipher_text => cipher_text_reg
        );
        
    Decript : AES_DEC
        port map(
            cipher_text => cipher_text_reg,
            key         => key,
            plain_text  => cipher_text
        );
        
    -- Out signal assigment


end rtl;
