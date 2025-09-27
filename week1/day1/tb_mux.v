module tb_mux;
    reg a, b, sel;
    wire y;

    mux uut (.a(a), .b(b), .sel(sel), .y(y));

    initial begin
        $dumpfile("mux.vcd");
        $dumpvars(0, tb_mux);

        a=0; b=0; sel=0; #10;
        a=1; b=0; sel=0; #10;
        a=0; b=1; sel=1; #10;
        a=1; b=1; sel=1; #10;
        $finish;
    end
endmodule
