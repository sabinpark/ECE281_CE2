----------------------------------------------------------------------------------
-- Company:  USAFA - ECE 281
-- Engineer:  C3C Sabin Park
-- 
-- Create Date:   16:54:17 02/04/2014 
-- Design Name: 
-- Module Name:   Decoder_Structural - Structural 
-- Project Name:   CE 2
-- Target Devices:  FPGA
-- Tool versions:  N/A
-- Description:   the decoder_structural
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

entity Decoder_Structural is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           Y0 : out  STD_LOGIC;
           Y1 : out  STD_LOGIC;
           Y2 : out  STD_LOGIC;
           Y3 : out  STD_LOGIC);
end Decoder_Structural;

architecture Structural of Decoder_Structural is
	
	COMPONENT inverter
	PORT(
		I : IN std_logic;
		O : OUT std_logic);
	END COMPONENT;
	
	COMPONENT and3
	PORT(
		I0 : IN std_logic;
		I1 : IN std_logic;
		I2 : IN std_logic;
		O : OUT std_logic);
	END COMPONENT;
	
	SIGNAL I0_NOT, I1_NOT : std_logic;
	
begin

	I0_inverter: inverter PORT MAP(
		I => I0,
		O => I0_NOT);
		
	I1_inverter: inverter PORT MAP(
		I => I1,
		O => I1_NOT);

	Y0_and3: and3 PORT MAP(
		I0 => I0_NOT,
		I1 => I1_NOT,
		I2 => EN,
		O => Y0);
		
	Y1_and3: and3 PORT MAP(
		I0 => I0,
		I1 => I1_NOT,
		I2 => EN,
		O => Y1);
		
	Y2_and3: and3 PORT MAP(
		I0 => I0_NOT,
		I1 => I1,
		I2 => EN,
		O => Y2);
	
	Y3_and3: and3 PORT MAP(
		I0 => I0,
		I1 => I1,
		I2 => EN,
		O => Y3);

end Structural;

