library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	-- Provides unsigned numerical computation


ENTITY tb_MUX IS
END tb_MUX;

ARCHITECTURE behavior OF tb_MUX IS 

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT mux
    PORT(
    adress_selection    : in unsigned(4-1 downto 0); --input from clk_counter 
   	start_bit  			: in  std_logic; 			-- input from star_stop_bit button
    data     			: in  unsigned(8-1 downto 0);-- data to send
  	parity_bit 		 	: in  std_logic; --input from parity_bit
    stop_bit 			: in  std_logic;			-- inv of start_bit
    Tx					: out std_logic				-- output transmitted data

        );
    END COMPONENT;

   --Inputs
   signal start_bit : std_logic := '0';
   signal parity_bit : std_logic := '0';
   signal data  : unsigned(8-1 downto 0);
   signal stop_bit  : std_logic := '1';
   signal adress_selection  : unsigned(4-1 downto 0);


 	--Outputs
   signal Tx : std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   DUT: mux PORT MAP (
          start_bit => start_bit,
          data => data,
          parity_bit => parity_bit,
          stop_bit => stop_bit,
          adress_selection => adress_selection,
          Tx => Tx
        );

   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      	
		
	start_bit <= '0';
    parity_bit <= '0';
    data <= "11010010";
    stop_bit <= '1';

    
    wait for 500 us;
	adress_selection <= "0000"; wait for 104 us;
    adress_selection <= "0001"; wait for 104 us;
    adress_selection <= "0010"; wait for 104 us;
    adress_selection <= "0011"; wait for 104 us;
    adress_selection <= "0100"; wait for 104 us;
    adress_selection <= "0101"; wait for 104 us;
    adress_selection <= "0110"; wait for 104 us;
    adress_selection <= "0111"; wait for 104 us;
    adress_selection <= "1000"; wait for 104 us;
    adress_selection <= "1001"; wait for 104 us;
    adress_selection <= "1010"; wait for 2 ms ;   
    adress_selection <= "1011"; 

	wait;
	end process;

END;