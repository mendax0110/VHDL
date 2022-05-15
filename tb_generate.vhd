-------------------------------------------------------------
-------------------testbench tests generate------------------
-------------------------------------------------------------
library vunit_lib;
use std.textio.all;
context vunit_lin.vunit_context;

--entity declarations--
entity tb_gen is
    generic(
        runner_cfg      : string;
        output_path     : string;
        data_width      : natural;
        sign            : boolean;
        message         : string 
    );
end entity tb_gen;

--architecure definitions--
architecture tb_gen_arch of tb_gen is

    begin
        main : process
            procedure dump_generic is
                file fwrite : text;
                variable    : line;
                begin
                    file_open(fwrite, output_path & "/" & "generics.txt", write_mode);
                    write(l, to_string(data_width) & ", " & to_string(sign));
                    writeline(fwrite, l);
                    file_close(fwrite);
            end procedure;

            begin
                test_runner_setup(runner, runner_cfg);
                while test_suite loop
                    if run("Test 1") then
                        assert message = "set-for-enitiy";
                        dump_generics;
                    elsif run("Test 2") then
                        assert message = "set-for-test";
                        dump_generic;
                    end if;
                end loop;
                test_runner_cleanup(runner);
                wait;
        end process;

        test_runner_watchdog(runner, 10 ms);
    
end architecture tb_gen_arch;
        
