`timescale 1ns/1ps

module tb_minimal;





   // DAC signals
   reg  [9:0] dac_input;
   real vrefh, vrefl;
   wire dac_out;

   // PLL signals
   reg vco_in;
   reg enb_cp;
   reg enb_vco;
   reg ref_clk;
   wire pll_clk;

   // Clock gate signals
   reg func_en, pwr_en, gating_override;
   wire gated_clk;

   // ---------------- DUT Instantiations ----------------

   // DAC
   avsddac u_dac (
      .OUT(dac_out),
      .D(dac_input),
      .VREFH(vrefh),
      .VREFL(vrefl)
   );

   // PLL
   avsdpll u_pll (
      .CLK(pll_clk),
      .VCO_IN(vco_in),
      .ENb_CP(enb_cp),
      .ENb_VCO(enb_vco),
      .REF(ref_clk)
   );

   // Clock gate
   clk_gate u_clk_gate (
      .gated_clk(gated_clk),
      .free_clk(pll_clk),
      .func_en(func_en),
      .pwr_en(pwr_en),
      .gating_override(gating_override)
   );

initial begin
    $dumpfile("tb_minimal.vcd");   // creates the VCD file
    $dumpvars(0, tb_minimal);      // dump all signals in the testbench
end


   // ---------------- Stimulus ----------------
   initial begin
      // Init values
      dac_input = 10'd0;
      vrefh = 1.2;
      vrefl = 0.0;

      vco_in = 0;
      enb_cp = 0;
      enb_vco = 1;
      ref_clk = 0;

      func_en = 0;
      pwr_en = 1;
      gating_override = 0;

      // Apply stimulus
      #50 func_en = 1;
      #100 dac_input = 10'd512;
      #200 dac_input = 10'd768;
      #300 dac_input = 10'd1023;

      #500 $finish;
   end

   // Reference clock generator (20ns period = 50MHz)
   always #10 ref_clk = ~ref_clk;
endmodule
