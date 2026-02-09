//  Module: rca
//
module rca
    (
        input logic [2:0] a,
        input logic [2:0] b,
        input logic cin,
        output logic [2:0] sum,
        output logic cout
    );

    // Internals
    logic [3:0] carry;
    assign carry[o]=cin;
    genvar i;
    generate;
        for(i=0; i<3; i=i+1) 
            begin: fa_gen fa_module_u fa_inst(
                .A(a[i]),
                .B(b[i]),
                .Cin(carry[i]),
                .S(sum[i]),
                .Cout(carry[i+1]),
            );
        end
    endgenerate

    assign cout = carry[3];
endmodule: rca
