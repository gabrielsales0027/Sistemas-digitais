library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cla is
	port(a,b:in std_logic_vector(3 downto 0);
	     s:out std_logic_vector(3 downto 0);
	     cin : in std_logic;
	     cout: out std_logic);
end cla;

architecture arq of cla is

component halfadder is
port(a,b: in std_logic;
	  P,G: out std_logic);
end component;

signal P,G: std_logic_vector(3 downto 0);
signal carry: std_logic_vector(4 downto 0);

begin


end arq;
