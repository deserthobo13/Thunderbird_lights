module FSM (La, Lb, Lc, Ra, Rb, Rc, reset_b, clock, InL, InR, InH);
   
   output logic La, Lb, Lc, Ra, Rb, Rc;
   
   input logic  reset_b;
   input logic 	clock, InL, InR, InH;
   
   // State definitions as an enumerated type
   typedef enum logic [5:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9} statetype;
   statetype CURRENT_STATE, NEXT_STATE;

   
   // State Register
   always_ff @(posedge clock, posedge reset_b) 
     begin
	if (reset_b)
	  CURRENT_STATE <= S0;
	else
	  CURRENT_STATE <= NEXT_STATE;
     end   

   // Next State Logic
   always_comb
     begin
	case (CURRENT_STATE)
	  S0: begin
		  La=1'b0; 
		  Lb=1'b0;
		  Lc=1'b0;
	      Ra=1'b0; 
		  Rb=1'b0;
		  Rc=1'b0;  
	     if (InL ) NEXT_STATE = S1;	     
	     else if (InR ) NEXT_STATE = S4;
		 else if (InH ) NEXT_STATE = S7;
		 else NEXT_STATE = S0;   
	  end
	  S1: begin
	     NEXT_STATE = S2;	     
		  La=1'b1; 
		  Lb=1'b0;
		  Lc=1'b0;
	      Ra=1'b0; 
		  Rb=1'b0;
		  Rc =1'b0;    
	  end
	  S2: begin
	     NEXT_STATE = S3;
		  La=1'b1; 
		  Lb=1'b1;
		  Lc=1'b0;
	      Ra=1'b0; 
		  Rb=1'b0;
		  Rc =1'b0;  
	  end
	   S3: begin
		  NEXT_STATE = S0;
		  La=1'b1; 
		  Lb=1'b1;
		  Lc=1'b1;
	      Ra=1'b0; 
		  Rb=1'b0;
		  Rc =1'b0;  
	  end
	   S4: begin
		  NEXT_STATE = S5;
		  La=1'b0; 
		  Lb=1'b0;
		  Lc=1'b0;
	      Ra=1'b1; 
		  Rb=1'b0;
		  Rc =1'b0;  
	  end
	   S5: begin
		  NEXT_STATE = S6;
		  La=1'b0; 
		  Lb=1'b0;
		  Lc=1'b0;
	      Ra=1'b1; 
		  Rb=1'b1;
		  Rc =1'b0;  
	  end
	   S6: begin
		  NEXT_STATE = S0;
		  La=1'b0; 
		  Lb=1'b0;
		  Lc=1'b0;
	      Ra=1'b1; 
		  Rb=1'b1;
		  Rc =1'b1;  
	  end
	   S7: begin
		  NEXT_STATE = S8;
		  La=1'b0; 
		  Lb=1'b0;
		  Lc=1'b1;
	      Ra=1'b1; 
		  Rb=1'b0;
		  Rc =1'b0;  
	  end
	   S8: begin
		  NEXT_STATE = S9;
		  La=1'b0; 
		  Lb=1'b1;
		  Lc=1'b1;
	      Ra=1'b1; 
		  Rb=1'b1;
		  Rc =1'b0;  
	  end
	   S9: begin
		  NEXT_STATE = S0;
		  La=1'b1; 
		  Lb=1'b1;
		  Lc=1'b1;
	      Ra=1'b1; 
		  Rb=1'b1;
		  Rc =1'b1;  
	  end
	  default: begin
	     NEXT_STATE = S0;
		  La =1'b0; 
		  Lb =1'b0;
		  Lc =1'b0;
	      Ra =1'b0; 
		  Rb =1'b0;
		  Rc =1'b0;   
	  end
	endcase
	  end
  
endmodule // FSM

