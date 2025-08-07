module top_module ( input clk, input d, output q );
    
    //---> Internal Wires
    wire y1,y2,y3;
    
    //---> Instantiating modules [connecting by name]
    my_dff inst1(.clk(clk),.d(d),.q(y1));	// First d-ff
    my_dff inst2(.clk(clk),.d(y1),.q(y2));	// Second d-ff
    my_dff inst3(.clk(clk),.d(y2),.q(q));	// Third d-ff
    
    //---> Instantiating modules [connecting by position]
    // my_dff inst1( clk, d, a );
 	// my_dff inst2( clk, a, b );
 	// my_dff inst3( clk, b, q );
        
endmodule
