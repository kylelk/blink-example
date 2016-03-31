with WiringPi_H;
with Interfaces.C;

package body GPIO is
   use Interfaces.C;

   procedure Setup is
   begin
      if WiringPi_H.WiringPiSetup = -1 then
         raise Setup_Exception with "GPIO setup failed";
      end if;
   end Setup;

   procedure Pin_Mode(Pin : Pin_Number; Mode : Pin_Mode_Type) is
   begin
      WiringPi_H.PinMode(Int(Pin), Int(Pin_Mode_Type'Pos(Mode)));
   end Pin_Mode;

   procedure Digital_Write(Pin : Pin_Number; Value : Pin_Value) is
   begin
      WiringPi_H.DigitalWrite(Int(Pin), Int(Pin_Value'Pos(Value)));
   end Digital_Write;

   function Digital_Read(Pin : Pin_Number) return Pin_Value is
   begin
      return Pin_Value'Val(WiringPi_H.DigitalRead(Int(Pin)));
   end Digital_Read;

   procedure Pin_Interrupt(Pin : Pin_Number; Edge_Type : Pin_Edge_Type; Callback : access procedure) is
      Result : Int;
      pragma Unreferenced (Result);
      Edge_Type_Int : constant Int := Int(Pin_Edge_Type'Pos(Edge_Type));
   begin
      Result := WiringPi_H.wiringPiISR(Int(Pin), Edge_Type_Int, Callback);
   end Pin_Interrupt;
end GPIO;
