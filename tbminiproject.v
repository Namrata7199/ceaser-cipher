`timescale 1ns/100ps

module t_caesercipher;

	wire [0:7] out;	//outputs
	reg a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,cap,en;	//inputs

	VerilogGM_121_202 uut (.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i),.j(j),.k(k),.l(l),.m(m),.n(n),.o(o),.p(p),.q(q),.r(r),.s(s),.t(t),.u(u),.v(v),.w(w),.x(x),.y(y),.z(z),
			       .i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7),.i8(i8),.i9(i9),.i10(i10),.i11(i11),.i12(i12),.i13(i13),.i14(i14),.i15(i15),.i16(i16),.i17(i17),.i18(i18),
			       .i19(i19),.i20(i20),.i21(i21),.i22(i22),.i23(i23),.i24(i24),.i25(i25),.i26(i36),.cap(cap),.en(en),.out(out));
	initial 
	begin
	$dumpfile("caeser_cipher_vcddump.vcd");
	$dumpvars(0,t_caesercipher);
	  
	$monitor("Time = %1d key = a shift = 6 caps = %d en/de = %d out = %c",$time, cap, en, out);
	  
	a = 1'b1;
	i6 = 1'b1;
	cap = 1'b0;
	en = 1'b0;
#10 
	$monitor("Time = %1d key = c shift = 10 caps = %d en/de = %d out = %c",$time, cap, en, out);
	a = 1'b0;
	i6 = 1'b0;
	c = 1'b1;
	i10 = 1'b1;
	cap = 1'b0;
	en = 1'b0;
#10
	$monitor("Time = %1d key = z shift = 26 caps = %d en/de = %d out = %c",$time, cap, en, out);
	c = 1'b0;
	i10 = 1'b0;
	z = 1'b1;
	i26 = 1'b1;
	cap = 1'b1;
	en = 1'b0;
#10
	$monitor("Time = %1d key = k shift = 8 caps = %d en/de = %d out = %c",$time, cap, en, out);
	z = 1'b0;
	i26 = 1'b0;
	k = 1'b1;
	i8 = 1'b1;
	cap = 1'b0;
	en = 1'b1;
#10
	$monitor("Time = %1d key = a shift = 26 caps = %d en/de = %d out = %c",$time, cap, en, out);
	k = 1'b0;
	i8 = 1'b0;
	a = 1'b1;
	i26 = 1'b1;
	cap = 1'b0;
	en = 1'b1;
#10
	$monitor("Time = %1d key = w shift = 4 caps = %d en/de = %d out = %c",$time, cap, en, out);
	a = 1'b0;
	i26 = 1'b0;
	w = 1'b1;
	i4 = 1'b1;
	cap = 1'b1;
	en = 1'b1;
#10
	$monitor("Time = %1d key = d shift = 9 caps = %d en/de = %d out = %c",$time, cap, en, out);
	w = 1'b0;
	i4 = 1'b0;
	d = 1'b1;
	i9 = 1'b1;
	cap = 1'b1;
	en = 1'b1;
#10


	end	

	

endmodule
