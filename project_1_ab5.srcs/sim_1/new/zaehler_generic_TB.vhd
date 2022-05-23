----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2022 15:42:54
-- Design Name: 
-- Module Name: zaehler_generic_TB - Behavioral
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

entity zaehler_generic_TB is
--  Port ( );
end zaehler_generic_TB;

architecture Behavioral of zaehler_generic_TB is
component
zaehler_generic
generic(BITS : natural := 4);
port( CLK, NOTRESET, UPnotDOWN, CLK_E : in std_logic;
        O : out std_logic_vector(BITS-1 downto 0));
end component;

    --inputs
    signal CLK_TB : std_logic := '0';
    signal NOTRESET_TB : std_logic := '0';
    signal UPnotDOWN_TB : std_logic := '0';
    signal CLK_E_TB : std_logic := '0';

    
    --output
    signal O_TB : std_logic_vector(3 downto 0);

begin

    --uut: unit under test instance
    uut:zaehler_generic generic map (BITS => 4) port map(
    CLK => CLK_TB,
    NOTRESET => NOTRESET_TB,
    UPnotDOWN => UPnotDOWN_TB,
    CLK_E => CLK_E_TB,
    O=> O_TB
    );
    
    --stimulus
stimproc:process
begin
    CLK_E_TB <= '1';
    NOTRESET_TB <= '1';
    UPnotDOWN_TB <= '1';--hochzählen
    
    
    CLK_TB <= '1';      -- 1
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    CLK_TB <= '1';      -- 2
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    CLK_TB <= '1';      -- 3
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    CLK_TB <= '1';      -- 4
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    CLK_TB <= '1';      -- 5
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    UPnotDOWN_TB <= '0'; --runterzählen
    
    CLK_TB <= '1';      -- 4
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    CLK_TB <= '1';      -- 3
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    CLK_TB <= '1';      -- 2
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    NOTRESET_TB <= '0'; --reset
    
    
    CLK_TB <= '1';      -- 0
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    NOTRESET_TB <= '1'; -- kein reset
    UPnotDOWN_TB <= '1';--hochzählen
    
    CLK_TB <= '1';      -- 1
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    CLK_TB <= '1';      -- 2
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    CLK_E_TB <= '0';   --Clock Enable aus
    
    CLK_TB <= '1';      -- 2
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    CLK_TB <= '1';      -- 2
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    UPnotDOWN_TB <= '0';--runterzählen
    CLK_E_TB <= '1';   --Clock Enable an
    
    CLK_TB <= '1';      -- 1
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    CLK_TB <= '1';      -- 0
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    CLK_TB <= '1';      -- f bei 4 bit
    wait for 10 ns;
    CLK_TB <= '0';
    wait for 10 ns;
    
    
    
    
    wait;



end process;

end Behavioral;

