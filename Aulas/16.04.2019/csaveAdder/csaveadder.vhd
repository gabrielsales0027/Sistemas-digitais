library ieee;
use ieee.std_logic_1164.all;

entity csaveadder is
port(a,b: in std_logic_vector(3 downto 0);
cin: in std_logic;
cout,s : out std_logic_vector(3 downto 0));
end csaveadder;

architecture arq of csaveadder is

component addnbits is
generic(n : integer := 4);
port(a,b : in std_logic_vector(n-1 downto 0);
		s : out std_logic_vector(n-1 downto 0);
		cin : in std_logic;
		cout : out std_logic);
end component;

component add1b is
port(a,b,cin : in std_logic;
		s,cout: out std_logic);
end component;

signal c1: std_logic := '0';
signal saida1,cout : std_logic_vector(3 downto 0);

begin

x0 : add1b port map (a(0),b(0),cin,saida1(0),cout(0));
x1 : add1b port map (a(1),b(1),c1,saida1(1),cout(1));
x2 : add1b port map (a(2),b(2),c1,saida1(2),cout(2));
x3 : add1b port map (a(3),b(3),c1,saida1(3),cout(3));

a(0) <= saida1(1);
a(1) <= saida1(2);
a(2) <= saida1(3);
a(3) <= '0';

b(0) <= cout(0);
b(1) <= cout(1);
b(2) <= cout(2);
b(3) <= cout(3);

x4: addnbits port map();

end arq;
