with GPIO;
with Ada.Text_IO;

procedure main is
   package TIO renames Ada.Text_IO;

   Pin_Num     : constant GPIO.Pin_Number := 0;
   Button_Pin  : constant GPIO.Pin_Number := 1;
   Blink_Delay : constant Float           := 0.25;

   type LED_Modes is (LED_Off, LED_Blink, LED_On);

   task type Blinking_Light is
      entry Mode (Mode_Value : LED_Modes);
   end Blinking_Light;

   task body Blinking_Light is
      Current_Mode : LED_Modes := LED_Off;
   begin
      loop
         select
            accept Mode (Mode_Value : LED_Modes) do
               Current_Mode := Mode_Value;
            end Mode;
         else
            if Current_Mode = LED_Off then
               GPIO.Digital_Write (Pin_Num, GPIO.Low);

            elsif Current_Mode = LED_Blink then
               GPIO.Digital_Write (Pin_Num, GPIO.High);
               delay Duration (Blink_Delay);
               GPIO.Digital_Write (Pin_Num, GPIO.Low);
               delay Duration (Blink_Delay);

            elsif Current_Mode = LED_On then
               GPIO.Digital_Write (Pin_Num, GPIO.High);
            end if;

         end select;
      end loop;
   end Blinking_Light;

   Light      : Blinking_Light;
   Light_Mode : LED_Modes := LED_Off;
   Down_Press : Boolean   := True;

   procedure Button_Clicked is
   begin
      if Down_Press then
         TIO.Put_Line ("button clicked " & LED_Modes'Image (Light_Mode));
         Light.Mode (Light_Mode);
         if Light_Mode = LED_Modes'Last then
            Light_Mode := LED_Modes'First;
         else
            Light_Mode := LED_Modes'Val (LED_Modes'Pos (Light_Mode) + 1);
         end if;
      end if;
      Down_Press := not Down_Press;
   end Button_Clicked;

begin
   GPIO.Setup;
   GPIO.Pin_Mode (Pin_Num, GPIO.Output);
   GPIO.Pin_Mode (Button_Pin, GPIO.Input);

   -- register button callback
   GPIO.Pin_Interrupt (Button_Pin, GPIO.Edge_Both, Button_Clicked'Access);
end main;
