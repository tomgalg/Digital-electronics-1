library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity traffic is
 port(
	clk: in std_logic;
	reset: in std_logic;
	lights: out std_logic_vector(6-1 downto 0)
	);
	
	end traffic; -- entity
	

architecture traffic of traffic is
	
	 type state_type is (green_red,yellow_red,red_red,red_green,red_yellow,red_red2);
	 signal state: state_type;
    signal count : unsigned(3 downto 0);
    constant SEC5: unsigned(3 downto 0) := "1111"; -- (5x3) 15 Hz
    constant SEC1: unsigned(3 downto 0) := "0011"; -- 3 Hz

    begin process(clk, reset)
	 begin
		if rising_edge(clk) then 
			if reset = '0' then -- active low reset 
				state <= green_red; -- po reseetu pøiøaï 1. state
				count <= (others => '0'); -- vynulování counteru
				
			else -- normální chod
				case state is
	-----------------0 state Green - RED-------------------------			
					when green_red => -- divný zápis pro case...
						if count < SEC5 then -- pokud neubìhlo 5 sec
						state <= green_red; -- state se nemìní
						count <= count + 1;  -- zvednutí counteru
						else
							state <= yellow_red; --po 5 sec další stav
							count <= (others => '0');-- vynulování counteru
						end if;	
-----------------1 state Yellow - RED-------------------------			
					when yellow_red => -- divný zápis pro case...
						if count < SEC1 then -- pokud neubìhlo 1 sec
						state <= yellow_red; -- state se nemìní
						count <= count + 1;  -- zvednutí counteru
						else
							state <= red_red; --po 1 sec další stav
							count <= (others => '0');-- vynulování counteru
						end if;

-----------------2 state red_red-------------------------			
					when red_red => -- divný zápis pro case...
						if count < SEC1 then -- pokud neubìhlo 1 sec
						state <= red_red; -- state se nemìní
						count <= count + 1;  -- zvednutí counteru
						else
							state <= red_green; --po 1 sec další stav
							count <= (others => '0');-- vynulování counteru
						end if;	
						
	-----------------3 state red_green-------------------------			
					when red_green => -- divný zápis pro case...
						if count < SEC5 then -- pokud neubìhlo 5 sec
						state <= red_green; -- state se nemìní
						count <= count + 1;  -- zvednutí counteru
						else
							state <= red_yellow; --po 5 sec další stav
							count <= (others => '0');-- vynulování counteru
						end if;
						
-----------------4 state red_red-------------------------			
					when red_yellow => -- divný zápis pro case...
						if count < SEC1 then -- pokud neubìhlo 1 sec
						state <= red_yellow; -- state se nemìní
						count <= count + 1;  -- zvednutí counteru
						else
							state <= red_red2; --po 1 sec další stav
							count <= (others => '0');-- vynulování counteru
						end if;

-----------------5 state red_red-------------------------			
					when red_red2 => -- divný zápis pro case...
						if count < SEC1 then -- pokud neubìhlo 1 sec
						state <= red_red2; -- state se nemìní
						count <= count + 1;  -- zvednutí counteru
						else
							state <= green_red; --po 1 stav 0
							count <= (others => '0');-- vynulování counteru
						end if;
------------------------others-----------------------
				    when others =>
							state <= green_red; -- stav 0
					end case;
				end if; -- end if reset and else
			end if;	-- end rising edge			
end process;

led_out: process(state)
	begin
	case state is
	--------------------------------S1-S2--- (semafor 1 ,2)
	-------------------------------GYR--GYR (green yellow red)
		when green_red => lights <=  "100001";
		when yellow_red => lights <= "010001";
		when red_red => lights <=    "001001";
		when red_green => lights <=  "001100";
		when red_yellow => lights <= "001010";
		when red_red2 => lights <=   "001001";
		when others => lights <=     "100001";
	end case;
	end process;
end traffic;
