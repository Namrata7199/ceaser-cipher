/*
Title of the mini-project:	ENCRYPTION AND DECRYPTION USING CAESER CIPHER  	(TESTBENCH FILE)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Reg. No.:			Namrata Ladda (16CO121), Aditi Gupta (16CO202)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Abstract:			The Caeser Shift Cipher is a monoalphabetic substitution cipher wherein each letter of a given text is replaced by a
				letter some fixed number of positions down the alphabet. To cipher a given text we need an integer value, known as shift
				which indicates the number of position each letter of the text has been moved down. The method is apparently named
				after Julius Caesar, who apparently used it to communicate with his officials.

				Input and Output: A string of lower case letters, called Text is taken as input using 26 buttons available for each alphabet.
				An integer between 0-25 denoting the required shift is also inputted. The output is obtained in form of respective LED
				being lit up corresponding to the input character (encryption and decryption are done one character at a time).

				Procedure: Traverse the given text one character at a time. For each character, transform the given character as per the
				rule, depending on whether we’re encrypting or decrypting the text. Return the new string generated. An example is shown below:
				Text : ATTACKATONCE
				Shift: 4
				Cipher: EXXEGOEXSRGI
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Functionalities:		The encryption can be represented using modular arithmetic by first transforming the letters into numbers, according to the scheme, 
				A = 0, B = 1,..., Z = 25. Encryption of a letter by a shift n can be described mathematically as
				E n (x) = (x+n) mod 26 [Encryption Phase with shift n]
				D n (x) = (x-n) mod 26 [Decryption Phase with shift n]

				The proposed mini-project implements encryption and decryption of capital/small alphabet by taking shift amount as an input from the user.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Brief Description on code: 	
				STEP-1: Each alphabet (a-z) is assigned a number corresponding to it (a-0,b-1,c-2.....z-25). The number associated with the alphabet goes to a binary encoder 
					and gets converted to its equivalent binary form. Similarly, the shift amount is also binary encoded.

				STEP-2: Depending upon whether encryption or decryption has to occur, the two binary numbers get either added(encryption) or subtracted(decryption).

				STEP-3: A comparator circuit is used to check if the sum exceeds 26 or the difference is negative.

				STEP-4: If any of the conditions in Step-3 hold true, 26 is added or subtracted from the number accordingly.

				STEP-4: Next, depending upon Caps On/Off, a constant is added up to the resultant, so as to convert the number into an ASCII code for the corresponding 
					character to be displayed.

				STEP-5: The ASCII code is sent to the TTY Display where the character gets displayed. This continues till the end of the string.

				Here, in the testbench, all the inputs have been first initialised to 0, and then for different testcases, the desired alphabet along with the shift amount is changed
				to 1, after making the previous inputs as 0 again.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/


`timescale 1ns/100ps

module t_caesercipher;

        //Output in form of ASCII Code of Encrypted/Decrypted symbol
	wire [0:7] out;		

        //Input (1) Alphabet (2) Shift Amount (3) Caps On/Off (4) Encryption/Decryption (0/1)
         reg a, b, c, d, e, f, g ,h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23,
	     i24, i25, i26, cap, en;	

	VerilogDM_121_202 uut (.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i),.j(j),.k(k),.l(l),.m(m),.n(n),.o(o),.p(p),.q(q),.r(r),.s(s),.t(t),.u(u),.v(v),.w(w),.x(x),.y(y),.z(z), .i1(i1),  
	.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7),.i8(i8),.i9(i9),.i10(i10),.i11(i11),.i12(i12),.i13(i13),.i14(i14),.i15(i15),.i16(i16),.i17(i17),.i18(i18),.i19(i19),.i20(i20),.i21(i21),
	.i22(i22),.i23(i23),.i24(i24),.i25(i25),.i26(i36),.cap(cap),.en(en),.out(out));

	initial 
	begin

	//Following 3 lines are for the wave form output, uncomment and comment alternatively to run the GTKWave for Data-Modelling and Behavioural Modelling respectively.

	$dumpfile("VerilogDM-121-202.vcd");				
	//$dumpfile("VerilogBM-121-202.vcd");
	$dumpvars(0,t_caesercipher);

        //Initialising all the alphabet keys to 0 and shift amounts to 0 

	a=1'b0;
	b=1'b0;
	c=1'b0;
	d=1'b0;
	e=1'b0;
	f=1'b0;
	g=1'b0;
	h=1'b0;
	i=1'b0;
	j=1'b0;
	k=1'b0;
	l=1'b0;
	m=1'b0;
	n=1'b0;
	o=1'b0;
	p=1'b0;
	q=1'b0;
	r=1'b0;
	s=1'b0;
	t=1'b0;
	u=1'b0;
	v=1'b0;
	x=1'b0;
	y=1'b0;
	z=1'b0;

	i1=1'b0;
	i2=1'b0;
	i3=1'b0;
	i4=1'b0;
	i5=1'b0;
	i6=1'b0;
	i7=1'b0;
	i8=1'b0;
	i9=1'b0;
	i10=1'b0;
	i11=1'b0;
	i12=1'b0;
	i13=1'b0;
	i14=1'b0;
	i15=1'b0;
	i16=1'b0;
	i17=1'b0;
	i18=1'b0;
	i19=1'b0;
	i20=1'b0;
	i21=1'b0;
	i22=1'b0;
	i23=1'b0;
	i24=1'b0;
	i25=1'b0;
	i26=1'b0;
	  
	$monitor("Time = %1d Alphabet Key = a Shift Amount = 6 Caps(On/Off 0/1) = %d En(0-En 1-De) = %d Output = %8b",$time, cap, en, out);	//'a' shifted by 6; encrypted
	  
	a = 1'b1;
	i6 = 1'b1;
	cap = 1'b0;
	en = 1'b0;
#10 
	$monitor("Time = %1d Alphabet Key = c Shift Amount = 10 Caps(On/Off 0/1) = %d En(0-En 1-De) = %d Output = %8b",$time, cap, en, out);	//'c' shifted by 10; encrypted
	a = 1'b0;
	i6 = 1'b0;
	c = 1'b1;
	i10 = 1'b1;
	cap = 1'b0;
	en = 1'b0;
#10
	$monitor("Time = %1d Alphabet Key = z Shift Amount = 26 Caps(On/Off 0/1) = %d En(0-En 1-De) = %d Output = %8b",$time, cap, en, out);	//'z' shifted by 26; encrypted
	c = 1'b0;
	i10 = 1'b0;
	z = 1'b1;
	i26 = 1'b1;
	cap = 1'b1;
	en = 1'b0;
#10
	$monitor("Time = %1d Alphabet Key = k Shift Amount = 8 Caps(On/Off 0/1) = %d En(0-En 1-De) = %d Output = %8b",$time, cap, en, out);	//'k' shifted by 8; decrypted
	z = 1'b0;
	i26 = 1'b0;
	k = 1'b1;
	i8 = 1'b1;
	cap = 1'b0;
	en = 1'b1;
#10
	$monitor("Time = %1d Alphabet Key = a Shift Amount = 26 Caps(On/Off 0/1) = %d En(0-En 1-De) = %d Output = %8b",$time, cap, en, out);	//'a' shifted by 26; decrypted
	k = 1'b0;
	i8 = 1'b0;
	a = 1'b1;
	i26 = 1'b1;
	cap = 1'b0;
	en = 1'b1;
#10
	$monitor("Time = %1d Alphabet Key = w Shift Amount = 4 Caps(On/Off 0/1) = %d En(0-En 1-De) = %d Output = %8b",$time, cap, en, out);	//'w' shifted by 4; decrypted
	a = 1'b0;
	i26 = 1'b0;
	w = 1'b1;
	i4 = 1'b1;
	cap = 1'b1;
	en = 1'b1;
#10
	
	w = 1'b0;
	i4 = 1'b0;
	d = 1'b1;
	i9 = 1'b1;
	cap = 1'b1;
	en = 1'b1;
	$monitor("Time = %1d Alphabet Key = d Shift Amount = 9 Caps(On/Off 0/1) = %d En(0-En 1-De) = %d Output = %8b",$time, cap, en, out);	//'d' shifted by 9; decrypted
#10

#70 $finish;
	end	

	

endmodule

