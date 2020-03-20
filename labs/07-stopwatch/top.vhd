----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
port (
		CLK:in  std_logic;
		srst_n_i: in std_logic;
		CLK_en: in std_logic;
		seg_outH: out std_logic_vector(7-1 downto 0);
		seg_outL: out std_logic_vector(7-1 downto 0);
		dig_o: out std_logic_vector(4-1 downto 0);
		dp_o: out std_logic 
);
end entity top;
architecture Behavioral of top is
signal mux_disp_out: std_logic_vector(4-1 downto 0);
signal desetiny: std_logic_vector(4-1 downto 0);
signal setiny: std_logic_vector(4-1 downto 0);
signal sec: std_logic_vector(4-1 downto 0);
signal desitky: std_logic_vector(4-1 downto 0);




begin

MUX : entity work.mux_7seg
	port map(
	clk_i => CLK,
	srst_n_i => srst_n_i,
	en_i => CLK_en,
	data0_i => setiny,
	data1_i => desetiny,
	data2_i => sec,
	data3_i => desitky,
	data_o => mux_disp_out,
	dp_o => dp_o,
	dig_o => dig_o,
	dp_i => "1101" -- active low input for decimal point
	);

	 
HEX2SSEG : entity work.hex_to_7seg -- načtení library vytvořené v hex_to_7seg.vhd
    port map(
	 hex_to_7seg_input => mux_disp_out, -- 
	 hex_to_7seg_Lout => seg_outL, -- acrive LOW output
	 hex_to_7seg_Hout => seg_outH  -- active HIGH output
	 ); -- výstup z 7 seg modulu do outputu topu

    
StopWatch: entity work.stop_watch
	port map(
	CLK => CLK,
	srst_n_i => srst_n_i,
	disp_digit_setiny => setiny,
	disp_digit_desetiny => desetiny,
	disp_digit_sec => sec,
	disp_digit_desitky => desitky
	);
clock_enable: entity work.clock_enable
	port map();
end Behavioral;

