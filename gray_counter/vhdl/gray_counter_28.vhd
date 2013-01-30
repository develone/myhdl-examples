-- File: gray_counter_28.vhd
-- Generated by MyHDL 0.8dev
-- Date: Wed Jan 30 17:30:31 2013


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;

use work.pck_myhdl_08.all;

entity gray_counter_28 is
    port (
        gray_count: out unsigned(27 downto 0);
        enable: in std_logic;
        clock: in std_logic;
        reset: in std_logic
    );
end entity gray_counter_28;


architecture MyHDL of gray_counter_28 is

signal even: std_logic;
signal gray: unsigned(27 downto 0);

begin




GRAY_COUNTER_28_SEQ: process (clock, reset) is
    variable word: unsigned(27 downto 0);
    variable toggled: std_logic;
begin
    if (reset = '1') then
        even <= '1';
        gray <= (others => '0');
    elsif rising_edge(clock) then
        word := unsigned'("1" & gray((28 - 2)-1 downto 0) & even);
        if bool(enable) then
            toggled := '0';
            for i in 0 to 28-1 loop
                if ((word(i) = '1') and (not bool(toggled))) then
                    gray(i) <= stdl((not bool(gray(i))));
                    toggled := '1';
                end if;
            end loop;
            even <= stdl((not bool(even)));
        end if;
    end if;
end process GRAY_COUNTER_28_SEQ;



gray_count <= gray;

end architecture MyHDL;
