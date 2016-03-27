with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;

package wiringPi_h is

   --  unsupported macro: NUM_PINS 17
   --  unsupported macro: WPI_MODE_PINS 0
   --  unsupported macro: WPI_MODE_GPIO 1
   --  unsupported macro: WPI_MODE_GPIO_SYS 2
   --  unsupported macro: WPI_MODE_PHYS 3
   --  unsupported macro: WPI_MODE_PIFACE 4
   --  unsupported macro: WPI_MODE_UNINITIALISED -1
   --  unsupported macro: INPUT 0
   --  unsupported macro: OUTPUT 1
   --  unsupported macro: PWM_OUTPUT 2
   --  unsupported macro: GPIO_CLOCK 3
   --  unsupported macro: SOFT_PWM_OUTPUT 4
   --  unsupported macro: SOFT_TONE_OUTPUT 5
   --  unsupported macro: PWM_TONE_OUTPUT 6
   --  unsupported macro: LOW 0
   --  unsupported macro: HIGH 1
   --  unsupported macro: PUD_OFF 0
   --  unsupported macro: PUD_DOWN 1
   --  unsupported macro: PUD_UP 2
   --  unsupported macro: PWM_MODE_MS 0
   --  unsupported macro: PWM_MODE_BAL 1
   --  unsupported macro: INT_EDGE_SETUP 0
   --  unsupported macro: INT_EDGE_FALLING 1
   --  unsupported macro: INT_EDGE_RISING 2
   --  unsupported macro: INT_EDGE_BOTH 3
   --  unsupported macro: PI_MODEL_UNKNOWN 0
   --  unsupported macro: PI_MODEL_A 1
   --  unsupported macro: PI_MODEL_B 2
   --  unsupported macro: PI_MODEL_BP 3
   --  unsupported macro: PI_MODEL_CM 4
   --  unsupported macro: PI_MODEL_AP 5
   --  unsupported macro: PI_MODEL_2 6
   --  unsupported macro: PI_VERSION_UNKNOWN 0
   --  unsupported macro: PI_VERSION_1 1
   --  unsupported macro: PI_VERSION_1_1 2
   --  unsupported macro: PI_VERSION_1_2 3
   --  unsupported macro: PI_VERSION_2 4
   --  unsupported macro: PI_MAKER_UNKNOWN 0
   --  unsupported macro: PI_MAKER_EGOMAN 1
   --  unsupported macro: PI_MAKER_SONY 2
   --  unsupported macro: PI_MAKER_QISDA 3
   --  unsupported macro: PI_MAKER_MBEST 4
   --  arg-macro: procedure PI_THREAD (X)
   --    void *X (void *dummy)
   --  unsupported macro: WPI_FATAL (1==1)
   --  unsupported macro: WPI_ALMOST (1==2)
  -- * wiringPi:
  -- *	Arduino compatable (ish) Wiring library for the Raspberry Pi
  -- *	Copyright (c) 2012 Gordon Henderson
  -- ***********************************************************************
  -- * This file is part of wiringPi:
  -- *	https://projects.drogon.net/raspberry-pi/wiringpi/
  -- *
  -- *    wiringPi is free software: you can redistribute it and/or modify
  -- *    it under the terms of the GNU Lesser General Public License as published by
  -- *    the Free Software Foundation, either version 3 of the License, or
  -- *    (at your option) any later version.
  -- *
  -- *    wiringPi is distributed in the hope that it will be useful,
  -- *    but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- *    GNU Lesser General Public License for more details.
  -- *
  -- *    You should have received a copy of the GNU Lesser General Public License
  -- *    along with wiringPi.  If not, see <http://www.gnu.org/licenses/>.
  -- ***********************************************************************
  --  

  -- Handy defines
  -- Deprecated
  -- Pin modes
  -- Pull up/down/none
  -- PWM
  -- Interrupt levels
  -- Pi model types and version numbers
  --	Intended for the GPIO program Use at your own risk.
   piModelNames : aliased array (0 .. 6) of Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/wiringPi.h:93
   pragma Import (C, piModelNames, "piModelNames");

   piRevisionNames : aliased array (0 .. 4) of Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/wiringPi.h:94
   pragma Import (C, piRevisionNames, "piRevisionNames");

   piMakerNames : aliased array (0 .. 4) of Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/wiringPi.h:95
   pragma Import (C, piMakerNames, "piMakerNames");

  --	Intended for the GPIO program Use at your own risk.
  -- Threads
  -- Failure modes
  -- wiringPiNodeStruct:
  --	This describes additional device nodes in the extended wiringPi
  --	2.0 scheme of things.
  --	It's a simple linked list for now, but will hopefully migrate to 
  --	a binary tree for efficiency reasons - but then again, the chances
  --	of more than 1 or 2 devices being added are fairly slim, so who
  --	knows....
   type wiringPiNodeStruct is record
      pinBase : aliased int;  -- /usr/local/include/wiringPi.h:120
      pinMax : aliased int;  -- /usr/local/include/wiringPi.h:121
      fd : aliased int;  -- /usr/local/include/wiringPi.h:123
      data0 : aliased unsigned;  -- /usr/local/include/wiringPi.h:124
      data1 : aliased unsigned;  -- /usr/local/include/wiringPi.h:125
      data2 : aliased unsigned;  -- /usr/local/include/wiringPi.h:126
      data3 : aliased unsigned;  -- /usr/local/include/wiringPi.h:127
      pinMode : access procedure
           (arg1 : access wiringPiNodeStruct;
            arg2 : int;
            arg3 : int);  -- /usr/local/include/wiringPi.h:129
      pullUpDnControl : access procedure
           (arg1 : access wiringPiNodeStruct;
            arg2 : int;
            arg3 : int);  -- /usr/local/include/wiringPi.h:130
      digitalRead : access function (arg1 : access wiringPiNodeStruct; arg2 : int) return int;  -- /usr/local/include/wiringPi.h:131
      digitalWrite : access procedure
           (arg1 : access wiringPiNodeStruct;
            arg2 : int;
            arg3 : int);  -- /usr/local/include/wiringPi.h:132
      pwmWrite : access procedure
           (arg1 : access wiringPiNodeStruct;
            arg2 : int;
            arg3 : int);  -- /usr/local/include/wiringPi.h:133
      analogRead : access function (arg1 : access wiringPiNodeStruct; arg2 : int) return int;  -- /usr/local/include/wiringPi.h:134
      analogWrite : access procedure
           (arg1 : access wiringPiNodeStruct;
            arg2 : int;
            arg3 : int);  -- /usr/local/include/wiringPi.h:135
      next : access wiringPiNodeStruct;  -- /usr/local/include/wiringPi.h:137
   end record;
   pragma Convention (C_Pass_By_Copy, wiringPiNodeStruct);  -- /usr/local/include/wiringPi.h:118

  -- Node specific
  --  ditto
  --  ditto
  --  ditto
  --  ditto
   wiringPiNodes : access wiringPiNodeStruct;  -- /usr/local/include/wiringPi.h:140
   pragma Import (C, wiringPiNodes, "wiringPiNodes");

  -- Function prototypes
  --	c++ wrappers thanks to a comment by Nick Lott
  --	(and others on the Raspberry Pi forums)
  -- Data
  -- Internal
   function wiringPiFailure (fatal : int; message : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/local/include/wiringPi.h:155
   pragma Import (C, wiringPiFailure, "wiringPiFailure");

  -- Core wiringPi functions
   function wiringPiFindNode (pin : int) return access wiringPiNodeStruct;  -- /usr/local/include/wiringPi.h:159
   pragma Import (C, wiringPiFindNode, "wiringPiFindNode");

   function wiringPiNewNode (pinBase : int; numPins : int) return access wiringPiNodeStruct;  -- /usr/local/include/wiringPi.h:160
   pragma Import (C, wiringPiNewNode, "wiringPiNewNode");

   function wiringPiSetup return int;  -- /usr/local/include/wiringPi.h:162
   pragma Import (C, wiringPiSetup, "wiringPiSetup");

   function wiringPiSetupSys return int;  -- /usr/local/include/wiringPi.h:163
   pragma Import (C, wiringPiSetupSys, "wiringPiSetupSys");

   function wiringPiSetupGpio return int;  -- /usr/local/include/wiringPi.h:164
   pragma Import (C, wiringPiSetupGpio, "wiringPiSetupGpio");

   function wiringPiSetupPhys return int;  -- /usr/local/include/wiringPi.h:165
   pragma Import (C, wiringPiSetupPhys, "wiringPiSetupPhys");

   procedure pinModeAlt (pin : int; mode : int);  -- /usr/local/include/wiringPi.h:167
   pragma Import (C, pinModeAlt, "pinModeAlt");

   procedure pinMode (pin : int; mode : int);  -- /usr/local/include/wiringPi.h:168
   pragma Import (C, pinMode, "pinMode");

   procedure pullUpDnControl (pin : int; pud : int);  -- /usr/local/include/wiringPi.h:169
   pragma Import (C, pullUpDnControl, "pullUpDnControl");

   function digitalRead (pin : int) return int;  -- /usr/local/include/wiringPi.h:170
   pragma Import (C, digitalRead, "digitalRead");

   procedure digitalWrite (pin : int; value : int);  -- /usr/local/include/wiringPi.h:171
   pragma Import (C, digitalWrite, "digitalWrite");

   procedure pwmWrite (pin : int; value : int);  -- /usr/local/include/wiringPi.h:172
   pragma Import (C, pwmWrite, "pwmWrite");

   function analogRead (pin : int) return int;  -- /usr/local/include/wiringPi.h:173
   pragma Import (C, analogRead, "analogRead");

   procedure analogWrite (pin : int; value : int);  -- /usr/local/include/wiringPi.h:174
   pragma Import (C, analogWrite, "analogWrite");

  -- PiFace specifics 
  --	(Deprecated)
   function wiringPiSetupPiFace return int;  -- /usr/local/include/wiringPi.h:179
   pragma Import (C, wiringPiSetupPiFace, "wiringPiSetupPiFace");

  -- Don't use this - for gpio program only
   function wiringPiSetupPiFaceForGpioProg return int;  -- /usr/local/include/wiringPi.h:180
   pragma Import (C, wiringPiSetupPiFaceForGpioProg, "wiringPiSetupPiFaceForGpioProg");

  -- On-Board Raspberry Pi hardware specific stuff
   function piBoardRev return int;  -- /usr/local/include/wiringPi.h:184
   pragma Import (C, piBoardRev, "piBoardRev");

   procedure piBoardId
     (model : access int;
      rev : access int;
      mem : access int;
      maker : access int;
      overVolted : access int);  -- /usr/local/include/wiringPi.h:185
   pragma Import (C, piBoardId, "piBoardId");

   function wpiPinToGpio (wpiPin : int) return int;  -- /usr/local/include/wiringPi.h:186
   pragma Import (C, wpiPinToGpio, "wpiPinToGpio");

   function physPinToGpio (physPin : int) return int;  -- /usr/local/include/wiringPi.h:187
   pragma Import (C, physPinToGpio, "physPinToGpio");

   procedure setPadDrive (group : int; value : int);  -- /usr/local/include/wiringPi.h:188
   pragma Import (C, setPadDrive, "setPadDrive");

   function getAlt (pin : int) return int;  -- /usr/local/include/wiringPi.h:189
   pragma Import (C, getAlt, "getAlt");

   procedure pwmToneWrite (pin : int; freq : int);  -- /usr/local/include/wiringPi.h:190
   pragma Import (C, pwmToneWrite, "pwmToneWrite");

   procedure digitalWriteByte (value : int);  -- /usr/local/include/wiringPi.h:191
   pragma Import (C, digitalWriteByte, "digitalWriteByte");

   procedure pwmSetMode (mode : int);  -- /usr/local/include/wiringPi.h:192
   pragma Import (C, pwmSetMode, "pwmSetMode");

   procedure pwmSetRange (c_range : unsigned);  -- /usr/local/include/wiringPi.h:193
   pragma Import (C, pwmSetRange, "pwmSetRange");

   procedure pwmSetClock (divisor : int);  -- /usr/local/include/wiringPi.h:194
   pragma Import (C, pwmSetClock, "pwmSetClock");

   procedure gpioClockSet (pin : int; freq : int);  -- /usr/local/include/wiringPi.h:195
   pragma Import (C, gpioClockSet, "gpioClockSet");

  -- Interrupts
  --	(Also Pi hardware specific)
   function waitForInterrupt (pin : int; mS : int) return int;  -- /usr/local/include/wiringPi.h:200
   pragma Import (C, waitForInterrupt, "waitForInterrupt");

   function wiringPiISR
     (pin : int;
      mode : int;
      c_function : access procedure) return int;  -- /usr/local/include/wiringPi.h:201
   pragma Import (C, wiringPiISR, "wiringPiISR");

  -- Threads
   function piThreadCreate (fn : access function (arg1 : System.Address) return System.Address) return int;  -- /usr/local/include/wiringPi.h:205
   pragma Import (C, piThreadCreate, "piThreadCreate");

   procedure piLock (key : int);  -- /usr/local/include/wiringPi.h:206
   pragma Import (C, piLock, "piLock");

   procedure piUnlock (key : int);  -- /usr/local/include/wiringPi.h:207
   pragma Import (C, piUnlock, "piUnlock");

  -- Schedulling priority
   function piHiPri (pri : int) return int;  -- /usr/local/include/wiringPi.h:211
   pragma Import (C, piHiPri, "piHiPri");

  -- Extras from arduino land
   procedure c_delay (howLong : unsigned);  -- /usr/local/include/wiringPi.h:215
   pragma Import (C, c_delay, "delay");

   procedure delayMicroseconds (howLong : unsigned);  -- /usr/local/include/wiringPi.h:216
   pragma Import (C, delayMicroseconds, "delayMicroseconds");

   function millis return unsigned;  -- /usr/local/include/wiringPi.h:217
   pragma Import (C, millis, "millis");

   function micros return unsigned;  -- /usr/local/include/wiringPi.h:218
   pragma Import (C, micros, "micros");

end wiringPi_h;
