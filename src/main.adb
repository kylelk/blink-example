with GPIO;

procedure main is
   Pin_Num : constant Integer := 0;
   Blink_Delay : constant Float := 0.25;
begin
   GPIO.Setup;

   GPIO.Pin_Mode(Pin_Num, GPIO.Output);
   loop
      GPIO.Digital_Write(Pin_Num, GPIO.High);
      delay Duration(Blink_Delay);
      GPIO.Digital_Write(Pin_Num, GPIO.Low);
      delay Duration(Blink_Delay);
   end loop;
end main;
