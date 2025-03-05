
module single_port_ram_tb;

reg clk; reg we;
reg [7:0] addr;
reg [7:0] din;
wire [7:0] dout;

single_port_ram uut (
.clk(clk),
.we(we),
.addr(addr),
.din(din),
.dout(dout));

always begin
#5 clk = ~clk; end
initial begin
clk = 0;
we = 0;
addr = 0;
din = 0;

#10 we = 1; addr = 5; din = 8'hAA; #10 we = 0; addr = 5;
#10 $display("Data at address 5: %h", dout);

#10 we = 1; addr = 10; din = 8'h55;
#10 we = 0; addr = 10;
#10 $display("Data at address 10: %h", dout);
#10 addr = 5;
#10 $display("Data at address 5: %h", dout);
#10 addr = 10;
#10 $display("Data at address 10: %h", dout);

#10 $finish; 
end
endmodule
