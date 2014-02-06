----------------------------------------------------------------------------------
-- Company:  USAFA - ECE 281
-- Engineer:  C3C Sabin Park
-- 
-- Create Date:    17:34:14 02/05/2014 
-- Design Name: 
-- Module Name:    Decoder_Behavioral - Behavioral 
-- Project Name:   CE 2
-- Target Devices:  FPGA
-- Tool versions:  N/A
-- Description:   the decoder_behavioral
--
-- Dependencies:   N/A
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

entity Decoder_Behavioral is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           Y0 : out  STD_LOGIC;
           Y1 : out  STD_LOGIC;
           Y2 : out  STD_LOGIC;
           Y3 : out  STD_LOGIC);
end Decoder_Behavioral;

architecture Behavioral of Decoder_Behavioral is
	signal I0_NOT, I1_NOT : std_logic;
	
begin
	I0_NOT <= not I0;
	I1_NOT <= not I1;
	Y0 <= I0_NOT and I1_NOT and EN;
	Y1 <= I0 and I1_NOT and EN;
	Y2 <= I0_NOT and I1 and EN;
	Y3 <= I0 and I1 and EN;
end Behavioral;

