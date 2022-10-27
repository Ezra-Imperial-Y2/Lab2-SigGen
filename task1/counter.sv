module counter#(
    parameter WIDTH = 8
)(
    // interface signal
    input logic     clk, //Clock
    input logic     rst, //Reset
    input logic     en,  //Counter enable
    input logic   [WIDTH-7:0] incr, 
    output logic [WIDTH-1:0] count      // Count output 
);

always_ff @(posedge clk)
    if (rst) count <= {WIDTH{1'b0}};
    else     count <= en ? count + incr : count ;

endmodule

