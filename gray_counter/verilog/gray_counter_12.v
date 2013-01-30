// File: gray_counter_12.v
// Generated by MyHDL 0.8dev
// Date: Wed Jan 30 17:30:32 2013


`timescale 1ns/10ps

module gray_counter_12 (
    gray_count,
    enable,
    clock,
    reset
);


output [11:0] gray_count;
wire [11:0] gray_count;
input enable;
input clock;
input reset;

reg even;
reg [11:0] gray;





always @(posedge clock, posedge reset) begin: GRAY_COUNTER_12_SEQ
    integer i;
    reg [12-1:0] word;
    reg toggled;
    if (reset == 1) begin
        even <= 1;
        gray <= 0;
    end
    else begin
        word = {1'b1, gray[(12 - 2)-1:0], even};
        if (enable) begin
            toggled = 1'b0;
            for (i=0; i<12; i=i+1) begin
                if (((word[i] == 1) && (!toggled))) begin
                    gray[i] <= (!gray[i]);
                    toggled = 1'b1;
                end
            end
            even <= (!even);
        end
    end
end



assign gray_count = gray;

endmodule
