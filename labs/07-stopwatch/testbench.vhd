--------------------------------------------------------------------------------
 
-- 
-- VHDL Test Bench Created by ISE for module: top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY testbench IS
--
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         CLK : IN  std_logic;
         srst_n_i : IN  std_logic;
         CLK_en : IN  std_logic;
         seg_outH : OUT  std_logic_vector(6 downto 0);
         seg_outL : OUT  std_logic_vector(6 downto 0);
         dig_o : OUT  std_logic_vector(3 downto 0);
         dp_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal srst_n_i : std_logic := '0';
   signal CLK_en : std_logic := '0';

 	--Outputs
   signal seg_outH : std_logic_vector(6 downto 0);
   signal seg_outL : std_logic_vector(6 downto 0);
   signal dig_o : std_logic_vector(3 downto 0);
   signal dp_o : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
   constant CLK_en_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          CLK => CLK,
          srst_n_i => srst_n_i,
          CLK_en => CLK_en,
          seg_outH => seg_outH,
          seg_outL => seg_outL,
          dig_o => dig_o,
          dp_o => dp_o
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   CLK_en_process :process
   begin
		CLK_en <= '0';
		wait for CLK_en_period/2;
		CLK_en <= '1';
		wait for CLK_en_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
