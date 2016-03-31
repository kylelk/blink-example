with GPIO;
with Ada.Text_IO;

procedure main is
    package TIO renames Ada.Text_IO;

   Pin_Num : constant GPIO.Pin_Number := 0;
   Button_Pin : constant GPIO.Pin_Number := 1;
   Blink_Delay : constant Float := 0.25;
   Click_Count : Integer := 0;
   
   procedure Button_Clicked is
   begin
       Click_Count := Click_Count + 1;
       TIO.Put_Line("button clicked " & Click_Count'Img);
   end Button_Clicked;
begin
   GPIO.Setup;
   GPIO.Pin_Mode(Pin_Num, GPIO.Output);
   GPIO.Pin_Mode(Button_Pin, GPIO.Input);
   
   GPIO.Pin_Interrupt(Button_Pin, GPIO.Edge_Falling, Button_Clicked'Access);
   -- loop
   --   GPIO.Digital_Write(Pin_Num, GPIO.High);
   --   delay Duration(Blink_Delay);
   --   GPIO.Digital_Write(Pin_Num, GPIO.Low);
   --   delay Duration(Blink_Delay);
   -- end loop;
end main;
