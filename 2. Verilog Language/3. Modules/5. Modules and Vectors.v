module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    wire [7:0] y1,y2,y3;
    
    //---> Instantiating modules [connecting by name]
    my_dff8 inst1(.clk(clk),.d(d),.q(y1));	// First d-ff
    my_dff8 inst2(.clk(clk),.d(y1),.q(y2));	// Second d-ff
    my_dff8 inst3(.clk(clk),.d(y2),.q(y3));	// Third d-ff
    
    //---> Data Selector [Mux]
    assign q = (sel == 2'b00)? d: (sel == 2'b01)? y1: (sel == 2'b10)? y2: y3;
           
endmodule


