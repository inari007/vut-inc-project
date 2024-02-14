-- fsm.vhd: Finite State Machine
-- Author(s): Zdenek Dobes xdobes21
-- Codes: code1: 1283621358 code2: 1353305824
library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic;
   FSM_MX_MEM  : out std_logic;
   FSM_MX_LCD  : out std_logic;
   FSM_LCD_WR  : out std_logic;
   FSM_LCD_CLR : out std_logic
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration  
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (PRESSED_1, PRESSED_13, PRESSED_135, PRESSED_1353, PRESSED_13533, PRESSED_135330, PRESSED_1353305, PRESSED_13533058, PRESSED_135330582, PRESSED_1353305824, PRESSED_12, PRESSED_128, PRESSED_1283, PRESSED_12836, PRESSED_128362, PRESSED_1283621, PRESSED_12836213, PRESSED_128362135, PRESSED_1283621358, DEFAULT, ERROR, PRINT_MESSAGE, PRINT_ERROR, FINISH);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') then
      present_state <= DEFAULT;
   elsif (CLK'event AND CLK = '1') then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when DEFAULT =>
      next_state <= DEFAULT;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(1) = '1') then
         next_state <= PRESSED_1; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_1 =>
      next_state <= PRESSED_1;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(2) = '1') then
         next_state <= PRESSED_12;
		elsif (KEY(3) = '1') then
			next_state <= PRESSED_13;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_12 =>
      next_state <= PRESSED_12;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(8) = '1') then
         next_state <= PRESSED_128;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_128 =>
      next_state <= PRESSED_128;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(3) = '1') then
			next_state <= PRESSED_1283;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_1283 =>
      next_state <= PRESSED_1283;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(6) = '1') then
			next_state <= PRESSED_12836;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_12836 =>
      next_state <= PRESSED_12836;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(2) = '1') then
			next_state <= PRESSED_128362;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_128362 =>
      next_state <= PRESSED_128362;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(1) = '1') then
			next_state <= PRESSED_1283621;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_1283621 =>
      next_state <= PRESSED_1283621;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(3) = '1') then
			next_state <= PRESSED_12836213;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_12836213 =>
      next_state <= PRESSED_12836213;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(5) = '1') then
			next_state <= PRESSED_128362135;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_128362135 =>
      next_state <= PRESSED_128362135;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(8) = '1') then
			next_state <= PRESSED_1283621358;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_1283621358 =>
      next_state <= PRESSED_1283621358;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_13 =>
      next_state <= PRESSED_13;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(5) = '1') then
         next_state <= PRESSED_135;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_135 =>
      next_state <= PRESSED_135;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(3) = '1') then
         next_state <= PRESSED_1353;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_1353 =>
      next_state <= PRESSED_1353;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(3) = '1') then
         next_state <= PRESSED_13533;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_13533 =>
      next_state <= PRESSED_13533;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(0) = '1') then
         next_state <= PRESSED_135330;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_135330 =>
      next_state <= PRESSED_135330;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(5) = '1') then
         next_state <= PRESSED_1353305;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_1353305 =>
      next_state <= PRESSED_1353305;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(8) = '1') then
         next_state <= PRESSED_13533058;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_13533058 =>
      next_state <= PRESSED_13533058;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(2) = '1') then
         next_state <= PRESSED_135330582;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_135330582 =>
      next_state <= PRESSED_135330582;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(4) = '1') then
         next_state <= PRESSED_1353305824;
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRESSED_1353305824 =>
      next_state <= PRESSED_1353305824;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when ERROR =>
      next_state <= ERROR;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE =>
      next_state <= PRINT_MESSAGE;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRINT_ERROR =>
      next_state <= PRINT_ERROR;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      next_state <= FINISH;
      if (KEY(15) = '1') then
         next_state <= DEFAULT; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
      next_state <= DEFAULT;
   end case;
end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when  PRESSED_1 |PRESSED_13 | PRESSED_135 | PRESSED_1353 | PRESSED_135330 | PRESSED_1353305 | PRESSED_13533058 | PRESSED_135330582 | PRESSED_1353305824 | PRESSED_12 | PRESSED_128 | PRESSED_1283 | PRESSED_12836 | PRESSED_128362 | PRESSED_1283621 | PRESSED_12836213 | PRESSED_128362135 | PRESSED_1283621358 | DEFAULT | ERROR =>
      if (KEY(14 downto 0) /= "000000000000000") then
         FSM_LCD_WR     <= '1';
      end if;
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_ERROR =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRINT_MESSAGE =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
		FSM_MX_MEM		<= '1';
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
		if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
		elsif (KEY(14 downto 0) /= "000000000000000") then
         FSM_LCD_WR     <= '1';
			end if;
   end case;
end process output_logic;

end architecture behavioral;

