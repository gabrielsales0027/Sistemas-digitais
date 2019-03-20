-- Verificador de Paridade

entity verificador is
port(A,B,C,D: in bit;
P: out bit);
end verificador;


architecture arq of verificador is
begin
P <= A xor B xor C xor D;
end arq;