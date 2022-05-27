----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.05.2022 08:39:22
-- Design Name: 
-- Module Name: zaehler_endlicherAutomat - Behavioral
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

entity zaehler_endlicherAutomat is
   
    port( CLK, NOTRESET, SD, EN : in std_logic;
            ZAEHLER_OUTPUT : out std_logic_vector(7 downto 0);
            UPnotDOWN_OUTPUT : out std_logic);
end zaehler_endlicherAutomat;

architecture Behavioral of zaehler_endlicherAutomat is
    component endlicherAutomat is
        port( CLK, NOTRESET, SD, EN : in std_logic;
--                O : out std_logic_vector(7 downto 0);
                UPnotDOWN : out std_logic);
    end component;
    
    component zaehler_8bit is
        Port(CLK,NOTRESET,UPnotDOWN, EN: in std_logic;
        O: out std_logic_vector (7 downto 0));
    end component;
    
    signal UPnotDOWN_INTERMEDIATE: std_logic;

begin

    controller: endlicherAutomat port map (CLK=>CLK, SD=>SD , NOTRESET=>NOTRESET, EN=>EN, UPnotDOWN => UPnotDOWN_INTERMEDIATE);
    counter: zaehler_8bit port map (CLK => CLK, NOTRESET=>NOTRESET, EN=>EN,UPnotDOWN => UPnotDOWN_INTERMEDIATE, O => ZAEHLER_OUTPUT);
    UPnotDOWN_OUTPUT<=UPnotDOWN_INTERMEDIATE;

end Behavioral;
