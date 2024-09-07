module alu(input[7:0] A,B,
input[3:0] ALU_Sel,
output[8:0] ALU_Result);

reg[8:0] ALU_Result;
always @(*) begin
    case(ALU_Sel)
    4'b0000: ALU_Result = A+B;
    4'b0001: ALU_Result = A-B;
    4'b0011: ALU_Result = A/B;
    4'b0100: ALU_Result = A<<1;
    4'b0101: ALU_Result = A>>1;
    4'b0110: ALU_Result = {A[6:0],A[7]};
    4'b0001: ALU_Result = {A[0],A[7:1]};
    4'b1000: ALU_Result = A & B; // Logical and 
    4'b1001: ALU_Result = A | B;// Logical or  
    4'b1010: ALU_Result = A ^ B;// Logical xor  
    4'b1011: ALU_Result = ~(A | B);// Logical nor  
    4'b1100: ALU_Result = ~(A & B); // Logical nand 
    4'b1101: ALU_Result = ~(A ^ B); // Logical xnor 
    4'b1110: ALU_Result = (A>B)?8'd1:8'd0 ; // Greater comparison 
    4'b1111: ALU_Result = (A==B)?8'd1:8'd0 ;// Equal comparison
    default: ALU_Result = 0;
endcase 
end 
endmodule