library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	-- Provides unsigned numerical computation

------------------------------------------------------------------------
-- Entity declaration for clock enable
------------------------------------------------------------------------
entity clock_enable is


port (
    clk_i    : in  std_logic;-- 1MHZ clock
    baud_switch : in  std_logic; -- switch for switching baud rates (0 --> 9600; 1--> 19200)
    clk_en_o : out std_logic	-- output of slower clk
);
end entity clock_enable;

architecture Behavioral of clock_enable is

	signal s_cnt : unsigned(16-1 downto 0) := (others => '0');	   -- counter of 1MHz clock -- it can be only 8 bit, but for option to add more bauds-->16 bit
    signal baud_rate : unsigned(16-1 downto 0) := (others => '0'); -- signal for defining speed of baud

begin

    p_clk_enable : process (clk_i)
    begin
    
    	if baud_switch = '0' then         
           baud_rate <= x"0068"; -- baud of 9600
        else
           baud_rate <= x"0034";-- baud of 19200
        end if;
        
		if rising_edge(clk_i) then			-- Rising clock edge


			if s_cnt >= (baud_rate-1) then	-- Enable pulse
                s_cnt <= (others => '0');	-- restart counter
                clk_en_o <= '1';			-- set output "1"

            else
                s_cnt <= s_cnt + 1;			-- if counter is lower than baud
                clk_en_o <= '0';
            end if;

		end if;	-- Rising edge
	end process p_clk_enable;

end architecture Behavioral;
