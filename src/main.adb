with Ada.Text_IO;
with WiringPi_H;
with Interfaces.C;

procedure main is
   use Interfaces.C;
   package TIO renames Ada.Text_IO;
   package GPIO renames WiringPi_H;
   Setup_Status : Interfaces.C.Int;
   Pin_Num : constant Int := Int(0);
begin
   -- TIO.Put_Line("hello world");
   Setup_Status := GPIO.WiringPiSetup;
   if Setup_Status = -1 then
      TIO.Put_Line(TIO.Standard_Error, "problem seting up GPIO");
      return;
   end if;
   GPIO.PinMode(Pin_Num, Int(1));
   loop
      GPIO.DigitalWrite(Pin_Num, Int(1));
      delay Duration(0.25);
      GPIO.DigitalWrite(Pin_Num, Int(0));
      delay Duration(0.25);
   end loop;
end main;
