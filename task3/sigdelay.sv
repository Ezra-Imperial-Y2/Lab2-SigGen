module sigdelay #(
    parameter A_WIDTH = 9,
              D_WIDTH = 8
)(
    input logic             clk, 
    input logic             rst,      
    input logic             wr,
    input logic             rd,     
    input logic [D_WIDTH-1:0] mic_signal, 
    input logic [A_WIDTH-1:0] offset,
    output logic [D_WIDTH-1:0] delayed_signal
);

    
   logic  [A_WIDTH-1:0]      wr_addr;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (1),
    .count (wr_addr)
);

ram2ports Ram (
    .clk (clk),
    .wr_addr (wr_addr),
    .rd_addr (wr_addr - offset),
    .din (mic_signal),
    .dout (delayed_signal),
    .wr_en (wr),
    .rd_en (rd)

);

endmodule



