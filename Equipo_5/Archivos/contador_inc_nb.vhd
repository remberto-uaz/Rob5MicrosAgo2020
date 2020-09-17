Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_inc_nb is
generic(n:integer:= 8);
port(
	clk: in std_logic;
	rst: in std_logic;
	inc: in std_logic;
	cta: out std_logic_vector(n-1 downto 0));
end contador_inc_nb;

architecture comportamiento of contador_inc_nb is

signal cta_i: std_logic_vector(n-1 downto 0);

begin

cta <= cta_i;

sec: process(clk,rst)
begin
	if rst='1' then
		cta_i <= (others => '0');
	elsif rising_edge(clk) then
	   if inc='1' then
		  cta_i <= std_logic_vector(unsigned(cta_i)+1);
       end if;
	end if;
end process;

end comportamiento;