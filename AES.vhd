library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity AES is
--  Generic ( );
--  Port ( );
    port(
        clk         : in  std_logic;
        reset       : in  std_logic;
        cipher_text : out std_logic_vector(127 downto 0);
        done        : out std_logic -- If encryption is done
    );
end AES;

architecture rtl of AES is

    -- Declarative zone of VHDL
    
    signal key         : std_logic_vector(127 downto 0) := x"2b28ab097eaef7cf15d2154f16a6883c";
    signal plain_text  : std_logic_vector(127 downto 0) := x"328831e0435a3137f6309807a88da234";
    -- Encryption Component
    component AES_ENC is
        port(
            plain_text  : in  std_logic_vector(127 downto 0);
            key         : in  std_logic_vector(127 downto 0);
            cipher_text : out std_logic_vector(127 downto 0)
        );    
    end component;
    
    signal plain_text_reg  : std_logic_vector(127 downto 0) := (others => '0');
    signal key_reg         : std_logic_vector(127 downto 0) := (others => '0');
    signal cipher_text_reg : std_logic_vector(127 downto 0) := (others => '0');
    signal done_reg        : std_logic := '0';
    signal start           : std_logic := '0';
    
    -- Edge detection
    signal enable             : std_logic := '0';
    signal start_count_lead   : std_logic := '0';
    signal start_count_follow : std_logic := '0';
    
    
begin

    Encript : AES_ENC
        port map(
            plain_text  => plain_text_reg,
            key         => key_reg,
            cipher_text => cipher_text_reg
        );
        
    -- Out signal assigment
    cipher_text <= cipher_text_reg;
    done        <= done_reg;

    main_proc : process(clk) is
    begin
        if rising_edge(clk) then
            if (enable = '1') then
                plain_text_reg <= plain_text;
                key_reg        <= key;
                done_reg       <= '1';
            else
                done_reg       <= '0';
            end if;
        end if;
    end process main_proc;
    
    -- Helping signal assigment
    enable     <= start_count_lead and (not start_count_follow);
    
    start_proc : process(clk) is -- Start to encrypt new data block process
    begin
        if rising_edge(clk) then
            if (plain_text_reg /= plain_text) then
                start <= '1';
            else
                start <= '0';
            end if;
        end if;
    end process start_proc;
    
    edge_detect_proc : process(clk) is
    begin
        if rising_edge(clk) then
            if (reset = '0') then
                start_count_lead   <= '0';
                start_count_follow <= '0';
            else
                start_count_lead   <= start;
                start_count_follow <= start_count_lead;
            end if;
        end if;
    end process edge_detect_proc;

end rtl;
