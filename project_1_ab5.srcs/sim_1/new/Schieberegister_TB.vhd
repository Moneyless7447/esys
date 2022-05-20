----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2022 08:07:48
-- Design Name: 
-- Module Name: Schieberegister_TB - Behavioral
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

entity Schieberegister_TB is
--  Port ( );

end Schieberegister_TB;

architecture Behavioral of Schieberegister_TB is
component
Schieberegister
    Port(I, CLK : in std_logic;
        O: out std_logic_vector(7 downto 0)
        );
        end component;
        
    -- Inputs
    signal I_TB : std_logic :='0';
    signal CLK_TB : std_logic :='0';
    
    -- Output
    signal O_TB : std_logic_vector(7 downto 0) :="00000000";

begin

-- unit under test Instance (uut)
uut:Schieberegister Port map(
I=> I_TB,
CLK=> CLK_TB,
O=> O_TB);

--stimulus
stim_proc: process
begin
    CLK_TB <='0';
    wait for 10 ns;
    I_TB<= '1';
    CLK_TB <='1';
    wait for 100 ns;
    
    CLK_TB <='0';
    wait for 10 ns;
    I_TB<= '1';
    CLK_TB <='1';
    wait for 100 ns;
    
    CLK_TB <='0';
    wait for 10 ns;
    I_TB<= '1';
    CLK_TB <='1';
    wait for 100 ns;
    
    CLK_TB <='0';
    wait for 10 ns;
    I_TB<= '0';
    CLK_TB <='1';
    wait for 100 ns;
    
    CLK_TB <='0';
    wait for 10 ns;
    I_TB<= '1';
    CLK_TB <='1';
    wait for 100 ns;
    
    CLK_TB <='0';
    wait for 10 ns;
    I_TB<= '1';
    CLK_TB <='1';
    wait for 100 ns;
    
 
    wait;
end process;


end Behavioral;
