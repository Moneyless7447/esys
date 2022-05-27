----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2022 08:57:31
-- Design Name: 
-- Module Name: zaehler_8bit - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity zaehler_8bit is

port( CLK, NOTRESET, UPnotDOWN, EN : in std_logic;
        O : out std_logic_vector(7 downto 0));
end zaehler_8bit;

architecture Behavioral of zaehler_8bit is
signal B : std_logic_vector(7 downto 0):=(others=>'0');
begin
    process(CLK)
--    variable B : std_logic_vecor(7 downto 0):=(others=>'0');
    begin   
        if NOTRESET = '0' then
            B<="00000000";--signal
--            B:="00000000";--variable
        
        else
            if rising_edge(CLK) and EN='1' then
                if UPnotDOWN ='1' then
                    B<=B+1;--Signal
--                    B:=B+1;--variable
                else
                    B<=B-1;-- Signal
--                    B:=B-1;--variable
                end if;
            end if;
        end if;
        O<=B; --variable
--        O<=B; --Signal um 1 verschoben
    end process;
    
--    O<=B; --signal
end Behavioral;
