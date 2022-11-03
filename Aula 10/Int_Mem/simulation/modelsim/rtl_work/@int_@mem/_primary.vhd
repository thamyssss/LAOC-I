library verilog;
use verilog.vl_types.all;
entity Int_Mem is
    port(
        PC              : in     vl_logic_vector(7 downto 0);
        code            : out    vl_logic_vector(7 downto 0);
        clock           : in     vl_logic
    );
end Int_Mem;
