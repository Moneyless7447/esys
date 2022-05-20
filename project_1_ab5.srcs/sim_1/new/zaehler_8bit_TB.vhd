----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2022 09:48:02
-- Design Name: 
-- Module Name: zaehler_8bit_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity zaehler_8bit_TB is
--  Port ( );
end zaehler_8bit_TB;

architecture Behavioral of zaehler_8bit_TB is
component
zaehler_8bit
--port(CLK,NOTRESET,UPnotDown,CLK_E : in std_logic;
--    O:out std_logic_vector(7 downto 0)
--);

port( CLK : in std_logic;
O : out std_logic_vector(7 downto 0));
end component;

    --inputs
    signal CLK_TB : std_logic := '0';
--    signal UPnotDown_TB : std_logic := '0';
--    signal NOTRESET_TB : std_logic := '0';
--    signal CLK_E_TB : std_logic := '0';
    
    --output
    signal O_TB : std_logic_vector(7 downto 0) := "00000000";
begin
--uut: unit under test instance
uut:zaehler_8bit port map(
--CLK => CLK_TB,
--UPnotDown =>UPnotDown_TB,
--NOTRESET=>NOTRESET_TB,
--CLK_E => CLK_E_TB);
CLK => CLK_TB);
--stimulus
stimproc:process
begin
--NOTRESET_TB<='1';
--CLK_E_TB<='1';
--UPnotDown_TB<='1';

CLK_TB <='1';
wait for 100 ns;
CLK_TB <='0';
wait for 100 ns;
CLK_TB <='1';
wait for 100 ns;
CLK_TB <='0';
wait for 100 ns;
CLK_TB <='1';
wait for 100 ns;
CLK_TB <='1';
wait for 100 ns;
wait;


end process;

end Behavioral;
