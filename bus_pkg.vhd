library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package bus_pkg is

		  -- iepriekš nedefinētiem izmēriem
		  -- PIEZĪME - šādu tipu izmantošanu atbalsta tikai VHDL-2008 valoda
        type bus_array is array(natural range <>) of std_logic_vector;
		  


end bus_pkg;