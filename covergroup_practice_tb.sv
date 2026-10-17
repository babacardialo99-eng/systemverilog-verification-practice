module coverGroup_Practice_tb;
  //Declare the signal 
  logic [7:0] addr; 

 covergroup cg;
  cp_addr: coverpoint addr {
  bins low  = {[0:7]}; 
  bins high = {[8:15]};
  }
endgroup
  
  // instantiation
  cg cg_inst = new();
  
  initial begin
    cg_inst.start();
    
    repeat(20)begin
      addr = $urandom_range(15, 0);
      cg_inst.sample();
      #10;
    end 
    
    // print the coverage report
    $display("Coverage = %0.2f%%", cg_inst.get_coverage());
    $finish;
  end
endmodule
