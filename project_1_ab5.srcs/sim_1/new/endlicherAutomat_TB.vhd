----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2022 17:03:52
-- Design Name: 
-- Module Name: endlicherAutomat_TB - Behavioral
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

entity endlicherAutomat_TB is
--  Port ( );
end endlicherAutomat_TB;

architecture Behavioral of endlicherAutomat_TB is
    component endlicherAutomat
        port(
        CLK, SD, NOTRESET, EN : in std_logic;
        UPnotDOWN : out std_logic
        );
    end component;
    
    -- inputs

    signal CLK_TB : std_logic := '0';
    signal SD_TB : std_logic := '0';
    signal NOTRESET_TB : std_logic := '0';
    signal EN_TB : std_logic := '0';

    
    --output
    signal UPnotDOWN_TB : std_logic := '0';


begin
    --uut: unit under test instance
    uut:endlicherAutomat port map( CLK => CLK_TB, SD => SD_TB, NOTRESET => NOTRESET_TB, EN => EN_TB,UPnotDOWN=>UPnotDOWN_TB);
    
    --stimulus
    stimulus:process
        begin
        
        EN_TB <= '1';
        NOTRESET_TB <= '1';
        
        CLK_TB <= '0';      
        wait for 10 ns;
        CLK_TB <= '1';
        wait for 10 ns;
        
        SD_TB <= '0';      --UP
        wait for 10 ns;
        
        CLK_TB <= '0';      
        wait for 10 ns;
        CLK_TB <= '1';
        wait for 10 ns;
        
        SD_TB <= '1';      -- zu DOWNPREP
        wait for 10 ns;
        
        CLK_TB <= '0';      
        wait for 10 ns;
        CLK_TB <= '1';
        wait for 10 ns;
        
        SD_TB <= '0';      -- zu Down
        wait for 10 ns;
        
        CLK_TB <= '0';      
        wait for 10 ns;
        CLK_TB <= '1';
        wait for 10 ns;
        
        SD_TB <= '1';      -- zu UPPREP
        wait for 10 ns;
        
        CLK_TB <= '0';      
        wait for 10 ns;
        CLK_TB <= '1';
        wait for 10 ns;
        
        SD_TB <= '0';      -- zu UP
        wait for 10 ns;
        
        CLK_TB <= '0';      
        wait for 10 ns;
        CLK_TB <= '1';
        wait for 10 ns;
        
        
        wait;
        end process;


end Behavioral;
