with GPIO;
with Ada.Text_IO;

procedure main is
   package TIO renames Ada.Text_IO;

   Pin_Num     : constant GPIO.Pin_Number := 0;
   Button_Pin  : constant GPIO.Pin_Number := 1;
   Blink_Delay : constant Float           := 0.25;
   Click_Count : Integer                  := 0;

   type LED_Modes is (LED_Off, LED_Blink, LED_On);

   task type Blinking_Light is
      entry Mode (Mode_Value : LED_Modes);
   end Blinking_Light;

   task body Blinking_Light is
      Current_Mode : LED_Modes := LED_On;
   begin
      loop
         if Current_Mode = LED_Off then
            GPIO.Digital_Write (Pin_Num, GPIO.Low);
            
         elsif Current_Mode = LED_Blink then
            GPIO.Digital_Write (Pin_Num, GPIO.High);
            delay Duration (Blink_Delay);
            GPIO.Digital_Write (Pin_Num, GPIO.Low);
            delay Duration (Blink_Delay);
            
         elsif Current_Mode = LED_On then
            GPIO.Digital_Write (Pin_Num, GPIO.Low);
         end if;
         
         accept Mode (Mode_Value : LED_Modes) do
            Current_Mode := Mode_Value;
         end Mode;
      end loop;
   end Blinking_Light;
   
   procedure Button_Clicked is
   begin
      Click_Count := Click_Count + 1;
      TIO.Put_Line ("button clicked " & Click_Count'Img);
   end Button_Clicked;
   
   Light : Blinking_Light;
begin
   GPIO.Setup;
   GPIO.Pin_Mode (Pin_Num, GPIO.Output);
   GPIO.Pin_Mode (Button_Pin, GPIO.Input);

   -- GPIO.Pin_Interrupt (Button_Pin, GPIO.Edge_Falling, Button_Clicked'Access);
   
   Light.Mode(LED_On);
   
   -- loop
   --   GPIO.Digital_Write(Pin_Num, GPIO.High);
   --   delay Duration(Blink_Delay);
   --   GPIO.Digital_Write(Pin_Num, GPIO.Low);
   --   delay Duration(Blink_Delay);
   -- end loop;
end main;
