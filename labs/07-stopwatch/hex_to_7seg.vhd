
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity hex_to_7seg is
	port(
	hex_to_7seg_input: in std_logic_vector(4-1 downto 0);
	hex_to_7seg_Lout: out std_logic_vector(7-1 downto 0);
	hex_to_7seg_Hout: out std_logic_vector(7-1 downto 0)
	);
--											----------------
--											|			    	|
--	hex_to_7seg_input(4bit)-------| hexx_to_7seg |-- hex_to_7seg_Lout(4 bit)
--											|				   |-- hex_to_7seg_Hout (4bit)
--											---------------
--	
end hex_to_7seg;


architecture Behavioral of hex_to_7seg is
signal output: std_logic_vector (7-1 downto 0);
	
begin
output <= "0000001" when (hex_to_7seg_input = "0000") else   -- 0
						 "1001111" when (hex_to_7seg_input = "0001") else   -- 1
						 "0010010" when (hex_to_7seg_input = "0010") else   -- 2
						 "0000110" when (hex_to_7seg_input = "0011") else   -- 3
						 "1101100" when (hex_to_7seg_input = "0100") else   -- 4
						 "0100100" when (hex_to_7seg_input = "0101") else   -- 5
						 "0100000" when (hex_to_7seg_input = "0110") else   -- 6
						 "0001111" when (hex_to_7seg_input = "0111") else   -- 7
						 "0000000" when (hex_to_7seg_input = "1000") else   -- 8
						 "0001100" when (hex_to_7seg_input = "1001") else   -- 9
						 "0001000" when (hex_to_7seg_input = "1010") else   -- A
						 "1100000" when (hex_to_7seg_input = "1011") else   -- B
						 "0110001" when (hex_to_7seg_input = "1100") else   -- C
						 "1000010" when (hex_to_7seg_input = "1101") else   -- D
						 "0110000" when (hex_to_7seg_input = "1110") else   -- E
						 "0111000" ;   -- pro hex_i = 1111 --F
						 
hex_to_7seg_Lout <= output;						 
hex_to_7seg_Hout <= not output;


end Behavioral;

