class input_adder;
  rand logic a, b, cin;


// set a constraint
constraint inputs {
a != b;
}
endclass
  
  module full_adder_tb;
  
// declare the signals 
logic a, b, cin, sum, cout;


// declare a class object 
input_adder inp;

// connect the port
full_adder DUT (
  .a(a), 
  .b(b), 
  .cin(cin), 
  .sum(sum),
  .cout(cout) 
);

initial begin
  // create an obect
  inp = new();
  
  repeat(10)begin
    inp.randomize();
    a=inp.a; b=inp.b; cin=inp.cin; #10;
    
    assert (sum == (a ^ b ^ cin) )
      else $error("FAIL: a=%b, b=%b, cin=%b, | sum=%b, cout=%b", a, b, cin, sum, cout);
    
    assert (cout ==  ( (a & b) | (a & cin) | (cin & b) ) )
      else $error("Fail cout: a=%b, b=%b, cin=%b, | sum=%b, cout=%b", a, b, cin, sum, cout);
   end // close repeat
 $finish;
  end  // close initial 
 endmodule
