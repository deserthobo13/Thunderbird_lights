`timescale 1ns / 1ps
module stimulus ();

   logic  clock;
   logic  InL;
   logic  InR;
   logic  InH;
   logic  reset_b;
   
   logic  Ra;
   logic  Rb;
   logic  Rc;
   logic  La;
   logic  Lb;
   logic  Lc;
   
   integer handle3;
   integer desc3;
   
   // Instantiate DUT
   FSM dut (La, Lb, Lc, Ra, Rb, Rc, reset_b, clock, InL, InR, InH);
   
   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clock = 1'b1;
	forever #2 clock = ~clock;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("fsm.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#4 $fdisplay(desc3, "reset: %b | left_b: %b right_b: %b || LcLbLa: %b%b%b || RaRbRc: %b%b%b", 
		     reset_b, InL, InR, Lc, Lb, La, Ra, Rb, Rc);
     end   

   initial 
     begin     
	#0   reset_b = 1'b0;
	#10  InH = 1'b1;
	#30  reset_b = 1'b1;
	#0   InH = 1'b0;
	#10  reset_b = 1'b0;
	#5   InR = 1'b1;
		
	
     end

endmodule // FSM_tb

