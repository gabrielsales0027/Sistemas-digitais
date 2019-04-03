library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity halfadder is
port(a,b: in std_logic;
		P,G: out std_logic);
end halfadder;

architecture arq of halfadder is
begin
P <= a xor b;
G <= a and b;
end arq;
