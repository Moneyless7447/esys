----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2022 16:21:25
-- Design Name: 
-- Module Name: endlicherAutomat - Behavioral
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

entity endlicherAutomat is
--  Port ( );
    port(
    CLK, SD, NOTRESET, ENABLE : in std_logic;
    UPnotDOWN : out std_logic
    );
end endlicherAutomat;

architecture Behavioral of endlicherAutomat is
type ZUSTAENDE is (UP, DOWNPREP, DOWN, UPPREP);
signal ZUSTAND, FOLGE_Z: ZUSTAENDE;

begin
    Z_SPEICHER:PROCESS(CLK,NOTRESET)-- Z_Speicher verwaltet das Zustandsregister ZUSTAND
    begin
        if NOTRESET = '0' then
            ZUSTAND <= UP;
        elsif CLK='1' and CLK'event then
            if ENABLE ='1' then
                ZUSTAND <= FOLGE_Z;
            end if;
        end if;
    end process Z_SPEICHER;
    
    
    UE_SN: PROCESS(SD, ZUSTAND) -- Prozess Übergangsschaltnetz
    begin
        case ZUSTAND is 
            when UP => if SD ='1'then
                            FOLGE_Z <= DOWNPREP;
                        else
                            FOLGE_Z <= UP;
                        end if;
                        
            when DOWNPREP => if SD ='0'then
                            FOLGE_Z <= DOWN;
                        else
                            FOLGE_Z <= DOWNPREP;
                        end if;
                    
            when DOWN => if SD ='1'then
                            FOLGE_Z <= UPPREP;
                        else
                            FOLGE_Z <= DOWN;
                        end if;
                        
            when UPPREP => if SD ='0'then
                            FOLGE_Z <= UP;
                        else
                            FOLGE_Z <= UPPREP;
                        end if;
        end case;
    end process UE_SN;
    
    
    AUS_SN: PROCESS (ZUSTAND) --Prozess Ausgangsschaltnetz
    begin
        case ZUSTAND is
            when UP => UPnotDOWN <= '1';
            when others => UPnotDOWN <= '0';
        end case;
    end process AUS_SN;


end Behavioral;
