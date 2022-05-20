----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2022 08:24:39
-- Design Name: 
-- Module Name: Schieberegister_transparent - Behavioral
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

entity Schieberegister_transparent is
--  Port ( );
    Port(I,CLK : in std_logic;
        O: out std_logic_vector(7 downto 0)
        );
end Schieberegister_transparent;

architecture Behavioral of Schieberegister_transparent is


begin
    Schieberegister:process(CLK)
    variable B_var : std_logic_vector(7 downto 0):="00000000";
        begin
            
            if CLK ='1' and CLK'event then
            B_var := I & B_var(7 downto 1); -- zu Variable zuweisen := // nicht <=
            end if;
            O <=B_var;
        end process;
        


end Behavioral;
