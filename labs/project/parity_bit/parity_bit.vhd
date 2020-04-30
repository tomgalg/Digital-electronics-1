library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	-- Provides unsigned numerical computation


    
ENTITY parity_bit IS
	PORT(
    	parity_sw   :in std_logic; -- if 0 -> output for even number is 1, if 1-> output for even number is 0
		input_data	:in unsigned(8-1 downto 0);	--input data
		parity		:out std_logic;				-- output of parity
        clk_1MHz			: in std_logic
        );										
END parity_bit;

ARCHITECTURE Behavioral OF parity_bit is

	signal	parity_calc	:unsigned(9-1 downto 0);
   -- signal  pre_data  : unsigned(8-1 downto 0):="00000000" ;
    
begin
	parity_generating : process(parity_sw, input_data,clk_1MHz)
	begin

if rising_edge(clk_1MHz) then
    
    for i in 0 to 7 loop -- take xor for each bit with result of xor operation from previous
    	if i = 0 then

           parity_calc(0) <= parity_sw; -- settings parity calc for 1st xor operation with LSB,also set even or odd parity gen   
		end if;
    parity_calc(i+1) <= parity_calc(i) XOR input_data(i);--"shifting bits"
	parity <= parity_calc(8); -- last cycle

    end loop;	

    
	end if;
	end process parity_generating;
end architecture Behavioral;