library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_clk_counter is
-- Empty
end entity tb_clk_counter; 

architecture tb of tb_clk_counter is

    -- DUT (Device Under Test) component declaration
    component clk_counter is
    port (
        clk_count_i    : in  std_logic;
		send_button : in  std_logic;
        num_of_pulses : out unsigned(4-1 downto 0)
    );
    end component;

	--Inputs
	signal clk_9600baud : std_logic := '0';
	signal send_button : std_logic := '0';
	--Outputs
	signal num_of_pulses  : unsigned(4-1 downto 0);

begin
	-- Connect Device Under Test
   	DUT : clk_counter
	port map (
		clk_count_i    => clk_9600baud,
		send_button => send_button,
		num_of_pulses => num_of_pulses
    );

	-- Generate clock signal with freq. of 1MHz
	clk_gen : process
    begin
		while now < 9000 us loop
      		clk_9600baud <= '0'; wait for 104 us;
      		clk_9600baud <= '1'; wait for 104 us;
    	end loop;
    	wait;
	end process clk_gen;

    -- Activate reset
    reset_gen : process
    begin
        send_button <= '0';
        wait for 20*104 us;
		send_button <= '1';
        wait for 2*104 us;
        send_button <= '0';
        wait for 2*130 us;
        send_button <= '1';
        wait for 20*104 us;
        send_button<= '0';
        wait for 11*104 us;
        send_button<= '1';
        wait;
    end process reset_gen;

    -- Stimulus process
    stim_proc : process
    begin
		wait;
    end process stim_proc;

end architecture tb;
