`timescale 1ns / 1ps

module single_cycle_top_tb;

    reg clk = 1'b0;
    reg rst;

    // Instantiate the single_cycle CPU
    single_cycle DUT (
        .clk(clk),
        .rst(rst)
    );

    // Clock generation: 50ns half period → 100ns full period (10 MHz)
    always #50 clk = ~clk;

    // Reset sequence
    initial begin
        rst = 1'b0;      // Assert reset
        #100;
        rst = 1'b1;      // Deassert reset after 100ns
    end

    // Monitor signals for debugging
    initial begin
        $dumpfile("single_cycle.vcd");
        $dumpvars(0, DUT);

        $display("Time | PC       | Instruction | ALUResult | RegWrite | MemWrite");
        $monitor("%4t | %h | %h | %h | %b | %b",
                 $time,
                 DUT.PC_TOP,
                 DUT.instr,
                 DUT.aluresult,
                 DUT.regwrite,
                 DUT.memwrite);
    end
    

    // Run simulation for 2000ns then finish
    initial begin
        #2000;
        $display("Simulation Complete");
        $finish;
    end

endmodule
