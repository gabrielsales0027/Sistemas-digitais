
entity Casca is 
port(
a,b,c: in bit;
s:out bit);
end Casca;

architecture miolo of Casca is 
signal d:bit;
begin

d <=a and b;
s <= c xor d;
end miolo;

