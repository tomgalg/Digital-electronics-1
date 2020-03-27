--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:10:34 03/27/2020
-- Design Name:   
-- Module Name:   D:/../BDE1/PC/cv8/Cv8-08-Traffic/traffic_lights_tb01.vhd
-- Project Name:  Cv8-08-Traffic
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: traffic
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
 
ENTITY traffic_lights_tb01 IS
END traffic_lights_tb01;
 
ARCHITECTURE behavior OF traffic_lights_tb01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT traffic
    PORT(
         clk : IN  std_logic;
			reset : IN  std_logic;
--			LD12_CPLD : OUT  std_logic; -- n
--         LD8_CPLD : OUT  std_logic; -- n
--         LD5_CPLD : OUT  std_logic; -- n
--         LD4_CPLD : OUT  std_logic; -- n
--         LD1_CPLD : OUT  std_logic; -- n
--         LD0_CPLD : OUT  std_logic; -- n
         
         lights : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal lights : std_logic_vector(5 downto 0);
--	signal LD12_CPLD : std_logic;
--   signal LD8_CPLD : std_logic;
--   signal LD5_CPLD : std_logic;
--   signal LD4_CPLD : std_logic;
--   signal LD1_CPLD : std_logic;
--   signal LD0_CPLD : std_logic;

   -- Clock period definitions
   constant clk_period : time := 333 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: traffic PORT MAP (
          clk => clk,
--			 LD12_CPLD => LD12_CPLD,
--          LD8_CPLD => LD8_CPLD,
--          LD5_CPLD => LD5_CPLD,
--          LD4_CPLD => LD4_CPLD,
--          LD1_CPLD => LD1_CPLD,
--          LD0_CPLD => LD0_CPLD,
			 lights => lights,
          reset => reset
          );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 1000 ms.
		reset<='0';
      wait for 1000 ms;	-- 1 s
		reset<='1';
      wait for clk_period*10;

      -- insert stimulus here 
		--wait for ms;
      wait;
   end process;

END;
