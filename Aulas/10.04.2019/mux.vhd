--IFPB
--Data: 27.03.19
--multiplexador 2 (versao com when)
--Aula5

library ieee;
use ieee.std_logic_1164.all;

entity mux is
port(a,b,c: in std_logic;
		s:out std_logic);
end mux;

architecture arq of mux is
begin

s <= a when c = '0' else
		b;

end arq;
