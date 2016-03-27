with Ada.Text_IO;
with WiringPi_H;
with Interfaces.C;

procedure main is
   use Interfaces.C;
   package TIO renames Ada.Text_IO;
   package GPIO renames WiringPi_H;
   Setup_Status : Interfaces.C.Int;
begin
   -- TIO.Put_Line("hello world");
   Setup_Status := GPIO.WiringPiSetup;
   if Setup_Status = -1 then
      TIO.Put_Line(TIO.Standard_Error, "problem seting up GPIO");
      return;
   end if;
end main;
