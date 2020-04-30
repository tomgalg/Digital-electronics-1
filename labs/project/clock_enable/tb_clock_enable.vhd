library ieee;
use ieee.std_logic_1164.all;

entity tb_clock_enable is
-- Empty
end entity tb_clock_enable; 

architecture tb of tb_clock_enable is

    -- DUT (Device Under Test) component declaration
    component clock_enable is
    port (
        clk_i    : in  std_logic;
		baud_switch : in  std_logic;
        clk_en_o : out std_logic
    );
    end component;

	--Inputs
	signal clk_1MHz : std_logic := '0';
	signal baud_switch : std_logic := '0';
	--Outputs
	signal clk_en_o  : std_logic;

begin
	-- Connect Device Under Test
   	DUT : clock_enable
	port map (
		clk_i    => clk_1MHz,
		baud_switch => baud_switch,
		clk_en_o => clk_en_o
    );

	-- Generate clock signal with freq. of 1MHz
	clk_gen : process
    begin
		while now < 900 us loop
      		clk_1MHz <= '0'; wait for 500 ns;
      		clk_1MHz <= '1'; wait for 500 ns;
    	end loop;
    	wait;
	end process clk_gen;

    -- Activate reset
    reset_gen : process
    begin
        baud_switch <= '1';
        wait for 312 us;
		baud_switch <= '0';
        wait for 312 us;
        baud_switch <= '1';
        wait;
    end process reset_gen;

    -- Stimulus process
    stim_proc : process
    begin
		wait;
    end process stim_proc;

end architecture tb;
