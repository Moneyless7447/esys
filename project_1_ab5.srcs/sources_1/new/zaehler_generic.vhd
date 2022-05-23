----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2022 15:35:56
-- Design Name: 
-- Module Name: zaehler_generic - Behavioral
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

entity zaehler_generic is
--  Port ( );
generic(BITS : natural := 4);
port( CLK, NOTRESET, UPnotDOWN, CLK_E : in std_logic;
        O : out std_logic_vector(BITS-1 downto 0));
end zaehler_generic;

architecture Behavioral of zaehler_generic is
signal B : std_logic_vector(BITS-1 downto 0):=(others=>'0');

begin
    process(CLK)
    begin   
        if NOTRESET = '0' then
            B<=(others=>'0');--signal
        
        else
            if rising_edge(CLK) and CLK_E='1' then
                if UPnotDOWN ='1' then
                    B<=B+1;--Signal
                else
                    B<=B-1;-- Signal
                end if;
            end if;
        end if;
        
    end process;
    
    O<=B; --signal
end Behavioral;


