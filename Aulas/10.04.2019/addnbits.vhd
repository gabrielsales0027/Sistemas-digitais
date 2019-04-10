 -- Somador de inteiros
library ieee;
use ieee.std_logic_1164.all;

entity addnbits is
generic(n : integer := 8);
port(a,b : in std_logic_vector(n-1 downto 0);
		s : out std_logic_vector(n-1 downto 0);
		cin : in std_logic;
		cout : out std_logic);
end addnbits;
architecture arq of addnbits is

component add1b is
port(a,b,cin : in std_logic;
		s,cout: out std_logic);
end component;

signal carry : std_logic_vector(n downto 0);

begin

laco: for i in 0 to n-1 generate
adds: add1b port map(a(i),b(i),carry(i),s(i),carry(i+1));
end generate;

carry(0) <= cin;
cout <= carry(n);

end arq;
