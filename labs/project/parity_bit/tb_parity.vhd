library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	-- Provides unsigned numerical computation


entity tb_parity is
-- Empty
end entity tb_parity; 

architecture behavior of tb_parity is

    -- DUT (Device Under Test) component declaration
    component parity_bit is
	PORT(
    	parity_sw   :in std_logic; 
		input_data	:in unsigned(8-1 downto 0);	--input data
		parity		:out std_logic;				-- output of parity
        clk_1MHz			:in std_logic
        );	
    end component;

	--Inputs
	signal parity_sw : std_logic;
    signal clk_1MHz : std_logic;
	signal input_data: unsigned(8-1 downto 0);
	--Outputs
	signal parity : std_logic;

begin
	-- Connect Device Under Test
   	DUT : parity_bit
	port map (
		parity_sw    => parity_sw,
		input_data => input_data,
		parity => parity,
        clk_1MHz => clk_1MHz
    );
    
    -- Generate clock signal with freq. of 1MHz
	clk_gen : process
    begin
		while now < 10*5 us loop
      		clk_1MHz <= '0'; wait for 500 ns;
      		clk_1MHz <= '1'; wait for 500 ns;
    	end loop;
    	wait;
	end process clk_gen;

    -- Stimulus process
    stim_proc : process
        begin

   input_data <= "11100011"; -- odd  
      parity_sw <= '0'; -- expecting output 1 
       wait for 11 us;
		parity_sw <= '1'; -- expecting output 0 

        wait for 11 us;
    input_data <= "11100111"; -- even  
        parity_sw <= '0'; -- expecting output 0 
        wait for 11 us;
		parity_sw <= '1'; -- expecting output 1 
        wait for 20 ms;
       wait;
    end process stim_proc;

end architecture behavior;
