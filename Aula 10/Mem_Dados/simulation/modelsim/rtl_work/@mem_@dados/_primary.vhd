library verilog;
use verilog.vl_types.all;
entity Mem_Dados is
    port(
        clock           : in     vl_logic;
        endereco        : in     vl_logic_vector(7 downto 0);
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        dado_in         : in     vl_logic_vector(7 downto 0);
        dado_out        : out    vl_logic_vector(7 downto 0)
    );
end Mem_Dados;
