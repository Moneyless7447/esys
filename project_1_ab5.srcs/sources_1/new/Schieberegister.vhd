----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2022 07:52:24
-- Design Name: 
-- Module Name: Schieberegister - Behavioral
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

entity Schieberegister is
--  Port ( );
    Port(I,CLK : in std_logic;
        O: out std_logic_vector(7 downto 0)
        );
end Schieberegister;

architecture Behavioral of Schieberegister is
signal B: std_logic_vector(7 downto 0):="00000000";
begin
    process(CLK)
        begin
            O <=B;
            if CLK ='1' and CLK'event then
            B <= I & B(7 downto 1);
            end if;
    end process;


end Behavioral;
