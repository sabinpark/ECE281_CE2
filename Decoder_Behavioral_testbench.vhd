--------------------------------------------------------------------------------
-- Company:    USAFA - ECE 281
-- Engineer:    C3C Sabin Park
--
-- Create Date:   17:54:26 02/05/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Sabin.Park/Documents/Classes/Semester 4/ECE 281/CE/CE2_ParkSabin/CE2/Decoder_Behavioral_testbench.vhd
-- Project Name:  CE2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder_Behavioral
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Decoder_Behavioral_testbench IS
END Decoder_Behavioral_testbench;
 
ARCHITECTURE behavior OF Decoder_Behavioral_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder_Behavioral
    PORT(
         I0 : IN  std_logic;
         I1 : IN  std_logic;
         EN : IN  std_logic;
         Y0 : OUT  std_logic;
         Y1 : OUT  std_logic;
         Y2 : OUT  std_logic;
         Y3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I0 : std_logic := '0';
   signal I1 : std_logic := '0';
   signal EN : std_logic := '0';

 	--Outputs
   signal Y0 : std_logic;
   signal Y1 : std_logic;
   signal Y2 : std_logic;
   signal Y3 : std_logic;
 
	-- counter
	signal count : std_logic_vector (2 downto 0) :="000";

	-- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder_Behavioral PORT MAP (
          I0 => count(0),
          I1 => count(1),
          EN => count(2),
          Y0 => Y0,
          Y1 => Y1,
          Y2 => Y2,
          Y3 => Y3
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		for i in 0 to 7 loop
			wait for 10 ns;
			report "For [EN  I1  I0] = [" &
			std_logic'image(count(2)) & "  " &
			std_logic'image(count(1)) & "  " &
			std_logic'image(count(0)) & "]   ,   " &
			"[Y0  Y1  Y2  Y3] = [" &
			std_logic'image(Y0) & "  " &
			std_logic'image(Y1) & "  " &
			std_logic'image(Y2) & "  " &
			std_logic'image(Y3) & "]"
			severity note;
			count <= count + "001";
			wait for 10 ns;
		end loop;

		-- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
