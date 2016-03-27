with GPIO;

procedure main is
   Pin_Num : constant Integer := 0;
begin
   GPIO.Setup;

   GPIO.Pin_Mode(Pin_Num, GPIO.Output);
   loop
      GPIO.Digital_Write(Pin_Num, GPIO.High);
      delay Duration(0.25);
      GPIO.Digital_Write(Pin_Num, GPIO.Low);
      delay Duration(0.25);
   end loop;
end main;
