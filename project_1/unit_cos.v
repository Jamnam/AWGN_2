`timescale 1ns / 1ps
module unit_cos(
	input clk,
	input rst,
	input [15:0] u1,
	output reg [15:0] g0 ,
	output reg sign
);

wire [1:0] quad;
wire [13:0] x_g_a, x_g_b;
wire [18:0] prod_a, prod_b; //The product of c1 and x_e_B
wire [18:0] comp_a, comp_b; //The complementary form of product
wire [18:0] y_g_a, y_g_b;
wire [6:0] x_g_a_A,x_g_a_B;
wire [6:0] x_g_b_A,x_g_b_B;

wire [11:0] c1_a, c1_b;
wire [18:0] c0_a, c0_b;

reg [18:0] c0_ar,c0_br;
reg [18:0] prod_ar,prod_br;
reg [18:0] ygar,ygbr;
reg [1:0] quadr;

always @(posedge clk or negedge rst)begin
    if(~rst)begin
    c0_ar <= 0;
    c0_br <= 0;
    prod_ar <= 0;
    prod_br <= 0;
    ygar <= 0;
    ygbr <= 0;
    quadr <= 0;
    end
    else begin
    c0_ar <= c0_a;
    c0_br <= c0_b;
    prod_ar <= prod_a;
    prod_br <= prod_b;
    ygar <= y_g_a;
    ygbr <= y_g_b;
    quadr <= quad;
    end
end
//DUT mapping
rom_c1g rom1(
	.addr_a(x_g_a_A),
	.addr_b(x_g_b_A),
	.c1g_a(c1_a),
	.c1g_b(c1_b)
);

rom_c0g rom0(
	.addr_a(x_g_a_A),
	.addr_b(x_g_b_A),
	.c0g_a(c0_a),
	.c0g_b(c0_b)
);

assign quad = u1[15:14];
assign x_g_a = u1[13:0];
assign x_g_b = 14'b11_1111_1111_1111 - x_g_a;
assign x_g_a_A = x_g_a[13:7];
assign x_g_a_B = x_g_a[6:0];
assign x_g_b_A = x_g_b[13:7];
assign x_g_b_B = x_g_b[6:0];

assign prod_a = c1_a*x_g_a_B;
assign comp_a = ~{6'b00_0000,prod_ar[18:7]}+19'b000_0000_0000_0000_0001;
assign y_g_a = comp_a+c0_ar;

assign prod_b = c1_b*x_g_b_B;
assign comp_b = ~{6'b00_0000,prod_br[18:7]}+19'b000_0000_0000_0000_0001;
assign y_g_b = comp_b+c0_br;

//There are two output parameters: the absolute value of g0 and its sign
//And they are output at the falling edge of clock;
always @(posedge clk or negedge rst) begin
	if (~rst) begin
		g0 <= 0;
		sign <= 0;
	end
	else begin
		case(quadr) 
			0: begin
				g0 <= y_g_b[18:3];
				sign <= 0 ;
			end
			1: begin
				g0 <= y_g_a[18:3];
				sign <= 0 ;
			end
			2: begin
				g0 <= y_g_b[18:3];
				sign <= 1;
			end
			3: begin
				g0 <= y_g_a[18:3];
				sign <= 1;
			end
		endcase
	end

end


endmodule
