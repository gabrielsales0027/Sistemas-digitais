library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity somador is
generic(n: integer := 8);
port(a,b: in std_logic_vector(n-1 downto 0);
		s: out std_logic_vector(n-1 downto 0));
end somador;

architecture arq of somador is
begin

s <= std_logic_vector(signed(a)+signed(b));

end arq;
