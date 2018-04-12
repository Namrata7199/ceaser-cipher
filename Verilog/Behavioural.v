//Converts letters into 5b binary
module alphain(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,c0);
input a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
output [0:4]c0;
assign c0[0]=q|r|s|t|u|v|w|x|y|z,
	c0[1]=i|j|k|l|m|n|o|p|y|z,
	c0[2]=e|f|g|h|m|n|o|p|u|v|w|x,
	c0[3]=c|d|g|h|k|l|o|p|s|t|w|x,
	c0[4]=b|d|f|h|j|l|n|p|r|t|v|x|z;
endmodule

//Coverts shift amount into 5b binary
module shiftin(b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,a,c0);
input b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,a;
output [0:4]c0;
assign c0[0]=q|r|s|t|u|v|w|x|y|z|a,
	c0[1]=i|j|k|l|m|n|o|p|y|z|a,
	c0[2]=e|f|g|h|m|n|o|p|u|v|w|x,
	c0[3]=c|d|g|h|k|l|o|p|s|t|w|x|a,
	c0[4]=b|d|f|h|j|l|n|p|r|t|v|x|z;
endmodule

//1b binary full adder
module full_adder(a,b,c,carry,sum);
input a,b,c;
output carry,sum;
assign
	sum=a^b^c,
	carry=(a&b)|(b&c)|(c&a);
endmodule

//5b adder/subtractor
module bit5_adder(a,b,c,s);
input [0:4]a;
input [0:4]b;
input c;
output [0:5]s;
wire c0,c1,c2,c3,c4;
full_adder fa1(a[0],b[0],c,c0,s[0]);
full_adder fa2(a[1],b[1],c0,c1,s[1]);
full_adder fa3(a[2],b[2],c1,c2,s[2]);
full_adder fa4(a[3],b[3],c2,c3,s[3]);
full_adder fa5(a[4],b[4],c3,c4,s[4]);
assign s[5]=c4;
endmodule

//6b binary adder/subtractor
module bit6_adder(a,b,c,s);
input [0:5]a;
input [0:5]b;
input c;
output [0:6]s;
wire c0,c1,c2,c3,c4,c5;
full_adder fa1(a[0],b[0],c,c0,s[0]);
full_adder fa2(a[1],b[1],c0,c1,s[1]);
full_adder fa3(a[2],b[2],c1,c2,s[2]);
full_adder fa4(a[3],b[3],c2,c3,s[3]);
full_adder fa5(a[4],b[4],c3,c4,s[4]);
full_adder fa6(a[5],b[5],c4,c5,s[5]);
assign s[6]=c5;
endmodule

//7b binary adder/subtractor
module bit7_adder(a,b,c,s);
input [0:6]a;
input [0:6]b;
input c;
output [0:7]s;
wire c0,c1,c2,c3,c4,c5,c6,c7;
full_adder fa1(a[0],b[0],c,c0,s[0]);
full_adder fa2(a[1],b[1],c0,c1,s[1]);
full_adder fa3(a[2],b[2],c1,c2,s[2]);
full_adder fa4(a[3],b[3],c2,c3,s[3]);
full_adder fa5(a[4],b[4],c3,c4,s[4]);
full_adder fa6(a[5],b[5],c4,c5,s[5]);
full_adder fa7(a[6],b[6],c5,c6,s[6]);
assign s[7]=c6;
endmodule

//main module
module VerilogGM_121_202(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,cap,en,out);
input a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,cap,en;
output [0:7]out;
wire [0:4]w1;
wire [0:4]w2;
wire [0:5]w3;
wire w4;
wire [0:5]w5;
wire [0:6]w6;
wire [0:6]w7;
wire [0:4]w8;
wire [0:4]w9;
wire [0:5]w10;
alphain alpha(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,w1);
shiftin shift(i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,w2);
bit5_adder b5add(w1,w2,en,w3);
assign w4=((~en&w3[2]&w3[3]&w3[4])|(w3[5]^en)|(~en&w3[1]&w3[3]&w3[4]))^en;
assign w5[0]=en,
	w5[1]=w4,
	w5[2]=w4,
	w5[3]=en,
	w5[4]=en,
	w5[5]=en;
bit6_adder b6add(w5,w3,1'b0,w6);
assign w7[0]=1'b1,
	w7[1]=1'b0,
	w7[2]=1'b0,
	w7[3]=1'b0,
	w7[4]=1'b0,
	w7[5]=~cap,
	w7[6]=1'b1,
	w6[5]=1'b0,
	w6[6]=1'b0,
	w8[0]=w6[0],
	w8[1]=w6[1],
	w8[2]=w6[2],
	w8[3]=w6[3],
	w8[4]=w6[4],
	w9[0]=en,
	w9[1]=1'b0,
	w9[2]=1'b0,
	w9[3]=1'b0,
	w9[4]=1'b0;
bit5_adder b5add1(w8,w9,1'b0,w10);
assign w6[0]=w10[0],
	w6[1]=w10[1],
	w6[2]=w10[2],
	w6[3]=w10[3],
	w6[4]=w10[4];
bit7_adder b7add(w7,w6,en,out);
endmodule
