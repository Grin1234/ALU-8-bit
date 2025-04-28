module CLU(
    input clk,
    input rst,
    input wire Q0,
    input wire Q1,
    input wire Asign,
    input start,
    input [1:0] opcode,
    input count7,
    output reg [7:0] cs,
    output reg stop
    );
  
  // op code sa zicem: 
  // 00 - adaugare
  // 01 - scadere
  // 10 - inmultire
  // 11 - impartire
    
// 000000 - INIT
// 000010 - LOAD
// 000100 - ADD
// 001000 - SUBTRACT
// 010000 - RSHIFT / INCR
// 100000 - END/OUTPUT

parameter INIT = 8'b00000000;
parameter LOAD = 8'b00000010;
parameter ADD = 8'b00000100;
parameter SUBSTRACT = 8'b00001000;
parameter RSHIFT = 8'b00010000;
parameter OUTPUT = 8'b00100000;
parameter WAIT_AFTER_LOAD= 8'b01000000;
parameter WAIT_AFTER_OP  = 8'b10000000;

reg [7:0] state, next_state;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= INIT;
        stop <= 0;
    end else if (start) begin
        state <= next_state;
    end 
end

always @(*) begin
    cs = INIT;
    next_state = INIT;

    case (state)
        INIT: begin
            cs = INIT;
            if (!stop)
                next_state = LOAD;
            else
                next_state = INIT;
        end

        LOAD: begin
            cs = LOAD;
            next_state = WAIT_AFTER_LOAD;
        end

        WAIT_AFTER_LOAD: begin
            cs = WAIT_AFTER_LOAD;
            if (opcode == 2'b00)
                next_state = ADD;
            else if (opcode == 2'b01)
                next_state = SUBSTRACT;
            else if (opcode == 2'b10) begin
                if ({Q0, Q1} == 2'b01)
                    next_state = ADD;
                else if ({Q0, Q1} == 2'b10)
                    next_state = SUBSTRACT;
                else
                    next_state = RSHIFT;
            end 
            else if (opcode == 2'b11) begin  
        if (Asign == 1'b1) 
            next_state = RSHIFT;
        else 
            next_state = RSHIFT;
        end
        else
            next_state = INIT;
            end

       ADD: begin
            cs = ADD;
            if (opcode == 2'b10) 
                next_state = RSHIFT;
            else if (opcode == 2'b11 && !count7) 
                next_state = RSHIFT;
    
            else
                next_state = OUTPUT; 
        end

       SUBSTRACT: begin
            cs = SUBSTRACT;
            if (opcode == 2'b10)
                next_state = RSHIFT;
            else if (opcode == 2'b11 && !count7)
                next_state = RSHIFT;
            else
                next_state = OUTPUT;
        end

        RSHIFT: begin
            cs = RSHIFT;
            next_state = WAIT_AFTER_OP;
        end

        WAIT_AFTER_OP: begin
            cs = WAIT_AFTER_OP;
            if (opcode == 2'b00 || opcode == 2'b01)
                next_state = OUTPUT;
            else if (opcode == 2'b10) begin
                if (count7 == 1)
                    next_state = OUTPUT;
                else if ({Q0, Q1} == 2'b01)
                    next_state = ADD;
                else if ({Q0, Q1} == 2'b10)
                    next_state = SUBSTRACT;
                else
                    next_state = RSHIFT;
            end else if (opcode == 2'b11) begin
         if (count7 == 1) begin           
                next_state = OUTPUT; 
        end
        else begin
            if (Asign == 1'b1)
                next_state = ADD; 
            else
                next_state = SUBSTRACT; 
        end
    end 
            else
                next_state = INIT;
        end

        OUTPUT: begin
            cs = OUTPUT;
            stop = 1;
            next_state = INIT;
        end

        default: begin
            cs = INIT;
            next_state = INIT;
        end
    endcase
end
endmodule
