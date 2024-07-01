`timescale 1ns / 1ps

// Verilog project: Verilog testbench code for PWM Generator with variable duty cycle 
module tb_PWM_Generator_Verilog;

    // Inputs
    reg clk;
    reg increase_duty;
    reg decrease_duty;
    
    // Outputs
    wire PWM_OUT;

    // Instantiate the PWM Generator with variable duty cycle in Verilog
    PWM_Generator_Verilog PWM_Generator_Unit(
        .clk(clk), 
        .increase_duty(increase_duty), 
        .decrease_duty(decrease_duty), 
        .PWM_OUT(PWM_OUT)
    );

    // Create 100MHz clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end 

    // Test procedure
    initial begin
        // Open the VCD file for waveform generation
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_PWM_Generator_Verilog);

        // Initialize inputs
        increase_duty = 0;
        decrease_duty = 0;

        // Apply test vectors
        #100;
        increase_duty = 1; 
        #100; // Increase duty cycle by 10%
        increase_duty = 0;

        #100;
        increase_duty = 1;
        #100; // Increase duty cycle by 10%
        increase_duty = 0;

        #100;
        increase_duty = 1;
        #100; // Increase duty cycle by 10%
        increase_duty = 0;

        #100;
        decrease_duty = 1;
        #100; // Decrease duty cycle by 10%
        decrease_duty = 0;

        #100;
        decrease_duty = 1;
        #100; // Decrease duty cycle by 10%
        decrease_duty = 0;

        #100;
        decrease_duty = 1;
        #100; // Decrease duty cycle by 10%
        decrease_duty = 0;

        // Finish simulation
        #500;
        $finish;
    end

endmodule
