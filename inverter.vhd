----------------------------------------------------------------------------------
-- Company:  USAFA - ECE 281
-- Engineer:  C3C Sabin Park 
-- 
-- Create Date:  16:49:26 02/04/2014 
-- Design Name:  CE 2
-- Module Name:  inverter - Behavioral 
-- Project Name:  CE 2
-- Target Devices:  FPGA
-- Tool versions:  N/A
-- Description:  inverts the input
--
-- Dependencies:  N/A
--
-- Revision:  0.01
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inverter is
    Port ( I : in  STD_LOGIC;
           O : out  STD_LOGIC);
end inverter;

architecture Behavioral of inverter is

begin

	O <= not I;

end Behavioral;

