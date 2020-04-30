library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	-- Provides unsigned numerical computation

------------------------------------------------------------------------
-- Entity declaration for clock enable
------------------------------------------------------------------------
entity clk_counter is
generic (
    g_MAX : unsigned(4-1 downto 0) := x"a"	-- Default value
);

port (
    clk_count_i    : in  std_logic; --output from clock enable (speed of baud)
    send_button : in  std_logic; -- send button
    num_of_pulses : out unsigned(4-1 downto 0) := (others => '0')	-- number of clock (input for MUX) ->start, stop, parity and 8 data bits --> max '1011'
);
end entity clk_counter;

architecture Behavioral of clk_counter is

	signal s_cnt : unsigned(4-1 downto 0) := x"a"; -- counter of input clocks, start condition:a -> output of stop bit from mux
	
    signal pre_but_state : std_logic := '0'; -- signal for detecting rising edge of button

begin

    pulses_counting : process (clk_count_i,send_button)
    begin

		if rising_edge(clk_count_i) then		    -- Rising clock edge
			if ((send_button = '1') and (pre_but_state ='0')) then -- if rising edge of button:
                 if s_cnt >= (g_MAX) then			--if all bits has been sent
         			s_cnt <= (others => '0');	   -- reset counter
         			num_of_pulses <= (others => '0');
                    pre_but_state <= send_button;
                  else
                    pre_but_state <= send_button; --if button is sent again and all bits has been not sent
                    s_cnt <= s_cnt+1;
                  end if;

                  
           	else -- if rising edge is not detected:
 
             if  s_cnt >= (g_MAX) then		   -- if counter is in max(all bits sent, stay in stop_bit untill rising edge of button)
                   s_cnt <= s_cnt;
				   num_of_pulses <= s_cnt;
                   pre_but_state <= send_button;
             else
                s_cnt <= s_cnt + 1;	  		 	   -- if counter is lower than max ad + 1
                num_of_pulses <= s_cnt+1;
                pre_but_state <= send_button;
            end if;
            end if;

		end if;	-- Rising edge	

	end process pulses_counting;
    
    

end architecture Behavioral;

