library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	-- Provides unsigned numerical computation


entity mux is
port (
    adress_selection    : in unsigned(4-1 downto 0); --input from clk_counter 
    start_bit  			: in  std_logic; 			-- input from star_stop_bit button
    data     			: in  unsigned(8-1 downto 0);-- data to send
  	parity_bit 		 	: in  std_logic; --input from parity_bit
    stop_bit 			: in  std_logic;			-- inv of start_bit
    Tx					: out std_logic				-- output transmitted data

    
    

);
end entity mux;

architecture Behavioral of mux is

begin

    adress_mux : process (adress_selection, start_bit, data  , parity_bit)
    begin
        case adress_selection is -- seting mux adresses
        when "0000" => 
			 Tx  <= start_bit;
        when "0001" => 
			 Tx  <= data(0);-- MSB
        when "0010" =>  
			 Tx  <= data(1);
        when "0011"=> --3
			 Tx  <= data(2);
        when "0100" =>  --4
			 Tx  <= data(3);  
        when "0101" => --5
			 Tx  <= data(4);
        when "0110" =>  --6
			 Tx  <= data(5);             
        when "0111" => --7
			 Tx  <= data(6);
        when "1000" =>  --8
			 Tx  <= data(7);--LSB
        when "1001" =>  --9
			 Tx  <= parity_bit;               
        when "1010" =>  --10
			 Tx  <= stop_bit;               
        when others =>
 			 Tx  <= stop_bit;
        end case;
    end process adress_mux;

end architecture Behavioral;