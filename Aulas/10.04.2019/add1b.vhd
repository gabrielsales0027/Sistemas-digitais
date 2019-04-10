library ieee;
use ieee.std_logic_1164.all;

entity add1b is
port(a,b,cin : in std_logic;
		s,cout: out std_logic);
end add1b;

architecture arq of add1b is
signal temp: std_logic;
begin
temp <= a xor b;
s <= temp xor cin;
cout <= (a and b) or (temp and cin);
end arq;
