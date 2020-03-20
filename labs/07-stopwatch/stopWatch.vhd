library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--------------------------------------------------------------------
entity stop_watch is --Port definition
	port(
		CLK: in std_logic; --creating CLK as input of standat logic (1,0)
		srst_n_i: in std_logic; -- reset input (1,0)
		disp_digit_setiny : out std_logic_vector(4-1 downto 0); -- display digit select
		disp_digit_desetiny : out std_logic_vector(4-1 downto 0);-- display digit select
		disp_digit_sec : out std_logic_vector(4-1 downto 0); -- display digit select
		disp_digit_desitky : out std_logic_vector(4-1 downto 0) -- display digit select
		);
		
							
--							-------------
--		CLK -----------|           |----- disp_digit_setiny(3:0)
--		srst_n_i-------|stop_watch |----- disp_digit_desetiny(3:0)
--		               |           |------ disp_digit_sec(3:0)
--		               |           |------ disp_digit_sec(3:0)							
--		               |           |
--							-------------
end stop_watch;
-----------------------------------------------------------------------
architecture Behavioral of stop_watch is 
	signal PRESCALER: std_logic_vector(7-1 downto 0); --10 ms = 100pulzù pøi 10kHz --> 110 0100 (7bit)
	signal digit_setiny: std_logic_vector(4-1 downto 0);-- každých 10ms -->  100 pulsu -- 0110 0100
	signal digit_desetiny: std_logic_vector(4-1 downto 0); -- každých 100ms -->  1000 pulsu -- 
	signal digit_sec: std_logic_vector(4-1 downto 0);		 -- každou s -->  10 000 pulsu -- 
	signal digit_desitky: std_logic_vector(4-1 downto 0); -- každých 10 s --> 100 000 pulsu -- 
	
begin


	CounterProcess: process(srst_n_i,CLK) -- do závorky se píšou "TRIGER VALUES"
	begin
		if rising_edge(CLK) then -- pokud je reset
			if srst_n_i = '0' then
				PRESCALER <= (others => '0');
				digit_desitky <= (others => '0');
				digit_sec <= (others => '0');
				digit_desetiny <= (others => '0');
				digit_setiny <= (others => '0');
				else
					if PRESCALER < "1100100" then --100 pulsu v BIN (10ms)					
						PRESCALER <= PRESCALER + 1; -- pokud je PRESCLAER pod 60 sec pøi každém CLK mu pøidej + 1(ekvivalent 10 ms)
					else 
					PRESCALER <= (others => '0'); --- vynuluj vektor pozor píšou se jednoduché uvozovky
					digit_setiny <= digit_setiny + 1; --- jinak øeèeno zvedne to COUNTER jednou za 50 mil impulsù o 1
					end if;
					
			if digit_setiny > 9 then -- pokud setiny pøechází z 9 na 10 
				digit_setiny <= (others => '0');
				digit_desetiny <= digit_desetiny + 1;
				end if;
			
			if digit_desetiny > 9 then 
				digit_desetiny <= (others => '0');
				digit_sec <= digit_sec + 1;
				end if;

			if digit_sec > 9 then 
				digit_sec <= (others => '0');
				digit_desitky <= digit_desitky + 1;
				end if;
				
			if digit_desitky > 9 then 
				digit_desitky <= (others => '0');
				digit_sec <= (others => '0');
				digit_desetiny <= (others => '0');
				digit_setiny <= (others => '0');
				end if;	

			
			end if;
		end if;	
	end process;
	
	disp_digit_setiny <= digit_setiny;
	disp_digit_desetiny <= digit_desetiny;
	disp_digit_sec <= digit_sec;
	disp_digit_desitky <= digit_desitky;
			
end Behavioral;