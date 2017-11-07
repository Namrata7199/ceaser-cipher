/*
Title of the mini-project:	ENCRYPTION AND DECRYPTION USING CAESER CIPHER  	(BEHAVIOURAL MODELLING)
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

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

//Converts letters into 5b binary------------------------------------------------------------------------------------------------------------------------------------------------------------------------
module alphain(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,c0);		//decalaration of module

		input a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;			//inputs
		output reg[0:4]c0;									//output

		always@ (*)
		begin
		        c0[0]=q|r|s|t|u|v|w|x|y|z;					        //encode bits
			c0[1]=i|j|k|l|m|n|o|p|y|z;						//encode bits
			c0[2]=e|f|g|h|m|n|o|p|u|v|w|x;						//encode bits
			c0[3]=c|d|g|h|k|l|o|p|s|t|w|x;						//encode bits
			c0[4]=b|d|f|h|j|l|n|p|r|t|v|x|z;					//encode bits
		end

endmodule

//Coverts shift amount into 5b binary--------------------------------------------------------------------------------------------------------------------------------------------------------------------
module shiftin(b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,a,c0);		//declaration of module


		input b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,a;			//inputs
		output reg [0:4]c0;									//output

		always@ (*)
		begin
			c0[0]=q|r|s|t|u|v|w|x|y|z|a;						//encode bits
			c0[1]=i|j|k|l|m|n|o|p|y|z|a;						//encode bits
			c0[2]=e|f|g|h|m|n|o|p|u|v|w|x;						//encode bits
			c0[3]=c|d|g|h|k|l|o|p|s|t|w|x|a;					//encode bits
			c0[4]=b|d|f|h|j|l|n|p|r|t|v|x|z;					//encode bits
		end

endmodule

//1b binary full adder-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
module full_adder(a,b,c,carry,sum);						//declaration of module


		input a,b,c;									//inputs
		output reg carry,sum;								//outputs
		always@ (a or b or c)
		begin
			sum=a^b^c;								//sum
			carry=(a&b)|(b&c)|(c&a);						//carry
		end

endmodule

//5b adder/subtractor------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
module bit5_adder(a,b,c,s);							//declaration of module


		input [0:4]a;									//input to add
		input [0:4]b;									//input to add
		input c;									//input to control add(0) or subtract(1)
		output reg [0:5]s;									//output
		wire c0,c1,c2,c3,c4;								//wires to store carry

		always@ (*) begin
			full_adder fa1(a[0],b[0],c,c0,s[0]);						//add single bits and send generated carry to the next adder
			full_adder fa2(a[1],b[1],c0,c1,s[1]);
			full_adder fa3(a[2],b[2],c1,c2,s[2]);
			full_adder fa4(a[3],b[3],c2,c3,s[3]);
			full_adder fa5(a[4],b[4],c3,c4,s[4]);
		end

		always@ (*)
		begin
		 s[5]=c4;									//assign msb
		end

endmodule

//6b binary adder/subtractor----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
module bit6_adder(a,b,c,s);							//declaration of module


		input [0:5]a;									//input to add
		input [0:5]b;									//input to add
		input c;									//input to control add(0) or subtract(1)
		output reg [0:6]s;									//output
		wire c0,c1,c2,c3,c4,c5;								//wires to store carry

		always@ (*) begin
			full_adder fa1(a[0],b[0],c,c0,s[0]);						//add single bits and send generated carry to the next adder
			full_adder fa2(a[1],b[1],c0,c1,s[1]);
			full_adder fa3(a[2],b[2],c1,c2,s[2]);
			full_adder fa4(a[3],b[3],c2,c3,s[3]);
			full_adder fa5(a[4],b[4],c3,c4,s[4]);
			full_adder fa6(a[5],b[5],c4,c5,s[5]);
		end

		always@ (*) begin 
		s[6]=c5;									//assign msb
		end

endmodule

//7b binary adder/subtractor----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
module bit7_adder(a,b,c,s);							//declaration of module


		input [0:6]a;									//input to add
		input [0:6]b;									//input to add
		input c;									//input to control add(0) or subtract(1)
		output reg [0:7]s;									//output
		wire c0,c1,c2,c3,c4,c5,c6;							//wires to store carry


		
		always@ (*) begin
			full_adder fa1(a[0],b[0],c,c0,s[0]);						//add single bits and send generated carry to the next adder
			full_adder fa2(a[1],b[1],c0,c1,s[1]);
			full_adder fa3(a[2],b[2],c1,c2,s[2]);
			full_adder fa4(a[3],b[3],c2,c3,s[3]);
			full_adder fa5(a[4],b[4],c3,c4,s[4]);
			full_adder fa6(a[5],b[5],c4,c5,s[5]);
			full_adder fa7(a[6],b[6],c5,c6,s[6]);
		end

		always@ (*) begin 
		s[7]=c6;									//assign msb
		end

endmodule

//---------------------------MAIN MODULE--------------------------------------------------------------------------------------------------------------------------------------------------------------
module VerilogBM_121_202(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,cap,en,out);//MAIN MODULE	
		

		input a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,cap,en;	//inputs
		output reg [0:7]out;																			//output
		wire [0:4]w1;																			     //wires declaration
		wire [0:4]w2;
		wire [0:5]w3;
		wire w4;
		wire [0:5]w5;
		wire [0:6]w6;
		wire [0:6]w7;
		wire [0:4]w8;
		wire [0:4]w9;
		wire [0:5]w10;

		alphain alpha(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,w1);		//encode input letter to 5b binary equivalent and store in wire w1

		shiftin shift(i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,w2);	//encode shift amount and store in w2

		always@ (*)
		begin
			w2[0]=w2[0]^en;								//w2 kept as it is for encryption and complemnted for decryption
			w2[1]=w2[1]^en;
			w2[2]=w2[2]^en;
			w2[3]=w2[3]^en;
			w2[4]=w2[4]^en;
		end

		bit5_adder b5add(w1,w2,en,w3);						//add w1,w2 and en for respective encryption or decryption
		
		always@ (*)
		begin					
		 w4=((~en&w3[2]&w3[3]&w3[4])|(w3[5]^en)|(~en&w3[1]&w3[3]&w3[4]))^en;	//checking whether output exceeds 25 or is negative
		end

		always@ (*)
		begin
			w5[0]=en;								//if w4 is high in encryption w5 is given 2's complement of 26
			w5[1]=w4;								//if w4 is low in encryption w5 is 00000
			w5[2]=w4;								//if w4 is high for decryption w5 is 11111
			w5[3]=en;								//if w4 is low for decryption w5 is 25
			w5[4]=en;
			w5[5]=en;
		end

		bit6_adder b6add(w5,w3,1'b0,w6);						//6b adder adds w5 and w3 and generates output in w6

		always@ (*)
		begin
			w7[0]=1'b1;							//w7 is 65 if caps is off and is 97 if caps is on
			w7[1]=1'b0;
			w7[2]=1'b0;
			w7[3]=1'b0;
			w7[4]=1'b0;
			w7[5]=~cap;
			w7[6]=1'b1;
			w6[5]=1'b0;								//last two bits of w6 are to be ignored
			w6[6]=1'b0;
			w8[0]=w6[0];								//w8 is assigned 5 bit value in w6
			w8[1]=w6[1];
			w8[2]=w6[2];
			w8[3]=w6[3];
			w8[4]=w6[4];
			w9[0]=en;								//w9 is 1 for encryption and 0 for decryption
			w9[1]=1'b0;
			w9[2]=1'b0;
			w9[3]=1'b0;
			w9[4]=1'b0;
		end

		bit5_adder b5add1(w8,w9,1'b0,w10);				//w8 and w9 is added as in the above adder during decryption when w4 is low 25 is added whereas 26 is to be added

		always@ (*)
		begin
			w6[0]=w10[0];								//w6=w10
			w6[1]=w10[1];
			w6[2]=w10[2];
			w6[3]=w10[3];
			w6[4]=w10[4];
		end	

		bit7_adder b7add(w7,w6,1'b0,out);						//corresponding ascii value is added to generate the output
endmodule
