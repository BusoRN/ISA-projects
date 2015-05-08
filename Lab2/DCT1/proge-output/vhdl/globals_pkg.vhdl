package globals is
  -- instruction width
  constant INSTRUCTIONWIDTH : positive := 42;
  -- address width of the instruction memory
  constant IMEMADDRWIDTH : positive := 15;
  -- width of the instruction memory in MAUs
  constant IMEMWIDTHINMAUS : positive := 1;
  -- clock period
  constant PERIOD : time := 10 ns;
end globals;
