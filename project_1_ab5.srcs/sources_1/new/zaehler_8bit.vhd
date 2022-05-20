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
--  Port ( );
--port(CLK,NOTRESET,UPnotDown,CLK_E : in std_logic;
--    O:out std_logic_vector(7 downto 0)
--);
port( CLK : in std_logic;
O : out std_logic_vector(7 downto 0));
end zaehler_8bit;

architecture Behavioral of zaehler_8bit is
signal counter : std_logic_vector(7 downto 0);--:="00000000";
begin
--    process(CLK,NOTRESET)
    process(CLK)
    --variable counter : std_logic_vector(7 downto 0):="00000000";
    begin   
        --if NOTRESET='0' then -- wenn nicht nicht reset -> wenn reset
        --    counter := "00000000";
        --else
            --if CLK='1' and CLK'event and CLK_E='1'then
            if CLK='1' and CLK'event then
               -- if UPnotDown ='1' then
                 counter<= counter +1;-- hochzählen
                --else
                 -- counter:= counter -1;-- runter zählen
               -- end if;
            end if;
        --end if;
--        O<=counter;
    end process;
    O<=counter;
end Behavioral;
