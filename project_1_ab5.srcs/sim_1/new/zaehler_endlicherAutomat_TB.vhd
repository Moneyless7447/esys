----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.05.2022 14:24:59
-- Design Name: 
-- Module Name: zaehler_endlicherAutomat_TB - Behavioral
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

entity zaehler_endlicherAutomat_TB is
--  Port ( );
end zaehler_endlicherAutomat_TB;

architecture Behavioral of zaehler_endlicherAutomat_TB is
    component zaehler_endlicherAutomat
        port( CLK, NOTRESET, SD, EN : in std_logic;
            ZAEHLER_OUTPUT : out std_logic_vector(7 downto 0);
            UPnotDOWN_OUTPUT : out std_logic);
    end component;
    
    --Inputs
    signal CLK_TB:std_logic:='0';
    signal EN_TB:std_logic:='1';
    signal SD_TB:std_logic:='0';
    signal NOTRESET_TB:std_logic:='0';
    
    --Outputs
    signal ZAEHLER_OUTPUT_TB:std_logic_VECTOR (7 downto 0);
    signal UPnotDOWN_OUTPUT_TB:std_logic;
begin
    uut:zaehler_endlicherAutomat port map(CLK => CLK_TB, EN => EN_TB, SD => SD_TB, NOTRESET => NOTRESET_TB, ZAEHLER_OUTPUT => ZAEHLER_OUTPUT_TB, UPnotDOWN_OUTPUT => UPnotDOWN_OUTPUT_TB);
    sim_proc: process
    begin
        EN_TB<='1';
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
