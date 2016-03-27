package GPIO is
   Setup_Exception : exception;
   subtype Pin_Number is Integer range 0..40;

   type Pin_Mode_Type is (Input, Output);
   for Pin_Mode_Type use (Input=>0, Output=>1);

   type Pin_Value is (Low, High);
   for Pin_Value use (Low=>0, High=>1);

   procedure Setup;

   procedure Pin_Mode(Pin : Pin_Number; Mode : Pin_Mode_Type);
   procedure Digital_Write(Pin : Pin_Number; Value : Pin_Value);
   function Digital_Read(Pin : Pin_Number) return Pin_Value;
end GPIO;
