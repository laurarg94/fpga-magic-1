//*****************************************************************************
//
// rom_map.h - Macros to facilitate calling functions in the ROM when they are
//             available and in flash otherwise.
//
// Copyright (c) 2008 Luminary Micro, Inc.  All rights reserved.
// Software License Agreement
// 
// Luminary Micro, Inc. (LMI) is supplying this software for use solely and
// exclusively on LMI's microcontroller products.
// 
// The software is owned by LMI and/or its suppliers, and is protected under
// applicable copyright laws.  All rights are reserved.  You may not combine
// this software with "viral" open-source software in order to form a larger
// program.  Any use in violation of the foregoing restrictions may subject
// the user to criminal sanctions under applicable laws, as well as to civil
// liability for the breach of the terms and conditions of this license.
// 
// THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
// OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
// LMI SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
// CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
// 
// This is part of revision 3618 of the Stellaris Peripheral Driver Library.
//
//*****************************************************************************

#ifndef __ROM_MAP_H__
#define __ROM_MAP_H__

//*****************************************************************************
//
// Macros for the ADC API.
//
//*****************************************************************************
#ifdef ROM_ADCSequenceDataGet
#define MAP_ADCSequenceDataGet \
        ROM_ADCSequenceDataGet
#else
#define MAP_ADCSequenceDataGet \
        ADCSequenceDataGet
#endif
#ifdef ROM_ADCIntDisable
#define MAP_ADCIntDisable \
        ROM_ADCIntDisable
#else
#define MAP_ADCIntDisable \
        ADCIntDisable
#endif
#ifdef ROM_ADCIntEnable
#define MAP_ADCIntEnable \
        ROM_ADCIntEnable
#else
#define MAP_ADCIntEnable \
        ADCIntEnable
#endif
#ifdef ROM_ADCIntStatus
#define MAP_ADCIntStatus \
        ROM_ADCIntStatus
#else
#define MAP_ADCIntStatus \
        ADCIntStatus
#endif
#ifdef ROM_ADCIntClear
#define MAP_ADCIntClear \
        ROM_ADCIntClear
#else
#define MAP_ADCIntClear \
        ADCIntClear
#endif
#ifdef ROM_ADCSequenceEnable
#define MAP_ADCSequenceEnable \
        ROM_ADCSequenceEnable
#else
#define MAP_ADCSequenceEnable \
        ADCSequenceEnable
#endif
#ifdef ROM_ADCSequenceDisable
#define MAP_ADCSequenceDisable \
        ROM_ADCSequenceDisable
#else
#define MAP_ADCSequenceDisable \
        ADCSequenceDisable
#endif
#ifdef ROM_ADCSequenceConfigure
#define MAP_ADCSequenceConfigure \
        ROM_ADCSequenceConfigure
#else
#define MAP_ADCSequenceConfigure \
        ADCSequenceConfigure
#endif
#ifdef ROM_ADCSequenceStepConfigure
#define MAP_ADCSequenceStepConfigure \
        ROM_ADCSequenceStepConfigure
#else
#define MAP_ADCSequenceStepConfigure \
        ADCSequenceStepConfigure
#endif
#ifdef ROM_ADCSequenceOverflow
#define MAP_ADCSequenceOverflow \
        ROM_ADCSequenceOverflow
#else
#define MAP_ADCSequenceOverflow \
        ADCSequenceOverflow
#endif
#ifdef ROM_ADCSequenceOverflowClear
#define MAP_ADCSequenceOverflowClear \
        ROM_ADCSequenceOverflowClear
#else
#define MAP_ADCSequenceOverflowClear \
        ADCSequenceOverflowClear
#endif
#ifdef ROM_ADCSequenceUnderflow
#define MAP_ADCSequenceUnderflow \
        ROM_ADCSequenceUnderflow
#else
#define MAP_ADCSequenceUnderflow \
        ADCSequenceUnderflow
#endif
#ifdef ROM_ADCSequenceUnderflowClear
#define MAP_ADCSequenceUnderflowClear \
        ROM_ADCSequenceUnderflowClear
#else
#define MAP_ADCSequenceUnderflowClear \
        ADCSequenceUnderflowClear
#endif
#ifdef ROM_ADCProcessorTrigger
#define MAP_ADCProcessorTrigger \
        ROM_ADCProcessorTrigger
#else
#define MAP_ADCProcessorTrigger \
        ADCProcessorTrigger
#endif
#ifdef ROM_ADCHardwareOversampleConfigure
#define MAP_ADCHardwareOversampleConfigure \
        ROM_ADCHardwareOversampleConfigure
#else
#define MAP_ADCHardwareOversampleConfigure \
        ADCHardwareOversampleConfigure
#endif

//*****************************************************************************
//
// Macros for the Comparator API.
//
//*****************************************************************************
#ifdef ROM_ComparatorIntClear
#define MAP_ComparatorIntClear \
        ROM_ComparatorIntClear
#else
#define MAP_ComparatorIntClear \
        ComparatorIntClear
#endif
#ifdef ROM_ComparatorConfigure
#define MAP_ComparatorConfigure \
        ROM_ComparatorConfigure
#else
#define MAP_ComparatorConfigure \
        ComparatorConfigure
#endif
#ifdef ROM_ComparatorRefSet
#define MAP_ComparatorRefSet \
        ROM_ComparatorRefSet
#else
#define MAP_ComparatorRefSet \
        ComparatorRefSet
#endif
#ifdef ROM_ComparatorValueGet
#define MAP_ComparatorValueGet \
        ROM_ComparatorValueGet
#else
#define MAP_ComparatorValueGet \
        ComparatorValueGet
#endif
#ifdef ROM_ComparatorIntEnable
#define MAP_ComparatorIntEnable \
        ROM_ComparatorIntEnable
#else
#define MAP_ComparatorIntEnable \
        ComparatorIntEnable
#endif
#ifdef ROM_ComparatorIntDisable
#define MAP_ComparatorIntDisable \
        ROM_ComparatorIntDisable
#else
#define MAP_ComparatorIntDisable \
        ComparatorIntDisable
#endif
#ifdef ROM_ComparatorIntStatus
#define MAP_ComparatorIntStatus \
        ROM_ComparatorIntStatus
#else
#define MAP_ComparatorIntStatus \
        ComparatorIntStatus
#endif

//*****************************************************************************
//
// Macros for the Flash API.
//
//*****************************************************************************
#ifdef ROM_FlashProgram
#define MAP_FlashProgram \
        ROM_FlashProgram
#else
#define MAP_FlashProgram \
        FlashProgram
#endif
#ifdef ROM_FlashUsecGet
#define MAP_FlashUsecGet \
        ROM_FlashUsecGet
#else
#define MAP_FlashUsecGet \
        FlashUsecGet
#endif
#ifdef ROM_FlashUsecSet
#define MAP_FlashUsecSet \
        ROM_FlashUsecSet
#else
#define MAP_FlashUsecSet \
        FlashUsecSet
#endif
#ifdef ROM_FlashErase
#define MAP_FlashErase \
        ROM_FlashErase
#else
#define MAP_FlashErase \
        FlashErase
#endif
#ifdef ROM_FlashProtectGet
#define MAP_FlashProtectGet \
        ROM_FlashProtectGet
#else
#define MAP_FlashProtectGet \
        FlashProtectGet
#endif
#ifdef ROM_FlashProtectSet
#define MAP_FlashProtectSet \
        ROM_FlashProtectSet
#else
#define MAP_FlashProtectSet \
        FlashProtectSet
#endif
#ifdef ROM_FlashProtectSave
#define MAP_FlashProtectSave \
        ROM_FlashProtectSave
#else
#define MAP_FlashProtectSave \
        FlashProtectSave
#endif
#ifdef ROM_FlashUserGet
#define MAP_FlashUserGet \
        ROM_FlashUserGet
#else
#define MAP_FlashUserGet \
        FlashUserGet
#endif
#ifdef ROM_FlashUserSet
#define MAP_FlashUserSet \
        ROM_FlashUserSet
#else
#define MAP_FlashUserSet \
        FlashUserSet
#endif
#ifdef ROM_FlashUserSave
#define MAP_FlashUserSave \
        ROM_FlashUserSave
#else
#define MAP_FlashUserSave \
        FlashUserSave
#endif
#ifdef ROM_FlashIntEnable
#define MAP_FlashIntEnable \
        ROM_FlashIntEnable
#else
#define MAP_FlashIntEnable \
        FlashIntEnable
#endif
#ifdef ROM_FlashIntDisable
#define MAP_FlashIntDisable \
        ROM_FlashIntDisable
#else
#define MAP_FlashIntDisable \
        FlashIntDisable
#endif
#ifdef ROM_FlashIntGetStatus
#define MAP_FlashIntGetStatus \
        ROM_FlashIntGetStatus
#else
#define MAP_FlashIntGetStatus \
        FlashIntGetStatus
#endif
#ifdef ROM_FlashIntClear
#define MAP_FlashIntClear \
        ROM_FlashIntClear
#else
#define MAP_FlashIntClear \
        FlashIntClear
#endif

//*****************************************************************************
//
// Macros for the GPIO API.
//
//*****************************************************************************
#ifdef ROM_GPIOPinWrite
#define MAP_GPIOPinWrite \
        ROM_GPIOPinWrite
#else
#define MAP_GPIOPinWrite \
        GPIOPinWrite
#endif
#ifdef ROM_GPIODirModeSet
#define MAP_GPIODirModeSet \
        ROM_GPIODirModeSet
#else
#define MAP_GPIODirModeSet \
        GPIODirModeSet
#endif
#ifdef ROM_GPIODirModeGet
#define MAP_GPIODirModeGet \
        ROM_GPIODirModeGet
#else
#define MAP_GPIODirModeGet \
        GPIODirModeGet
#endif
#ifdef ROM_GPIOIntTypeSet
#define MAP_GPIOIntTypeSet \
        ROM_GPIOIntTypeSet
#else
#define MAP_GPIOIntTypeSet \
        GPIOIntTypeSet
#endif
#ifdef ROM_GPIOIntTypeGet
#define MAP_GPIOIntTypeGet \
        ROM_GPIOIntTypeGet
#else
#define MAP_GPIOIntTypeGet \
        GPIOIntTypeGet
#endif
#ifdef ROM_GPIOPadConfigSet
#define MAP_GPIOPadConfigSet \
        ROM_GPIOPadConfigSet
#else
#define MAP_GPIOPadConfigSet \
        GPIOPadConfigSet
#endif
#ifdef ROM_GPIOPadConfigGet
#define MAP_GPIOPadConfigGet \
        ROM_GPIOPadConfigGet
#else
#define MAP_GPIOPadConfigGet \
        GPIOPadConfigGet
#endif
#ifdef ROM_GPIOPinIntEnable
#define MAP_GPIOPinIntEnable \
        ROM_GPIOPinIntEnable
#else
#define MAP_GPIOPinIntEnable \
        GPIOPinIntEnable
#endif
#ifdef ROM_GPIOPinIntDisable
#define MAP_GPIOPinIntDisable \
        ROM_GPIOPinIntDisable
#else
#define MAP_GPIOPinIntDisable \
        GPIOPinIntDisable
#endif
#ifdef ROM_GPIOPinIntStatus
#define MAP_GPIOPinIntStatus \
        ROM_GPIOPinIntStatus
#else
#define MAP_GPIOPinIntStatus \
        GPIOPinIntStatus
#endif
#ifdef ROM_GPIOPinIntClear
#define MAP_GPIOPinIntClear \
        ROM_GPIOPinIntClear
#else
#define MAP_GPIOPinIntClear \
        GPIOPinIntClear
#endif
#ifdef ROM_GPIOPinRead
#define MAP_GPIOPinRead \
        ROM_GPIOPinRead
#else
#define MAP_GPIOPinRead \
        GPIOPinRead
#endif
#ifdef ROM_GPIOPinTypeCAN
#define MAP_GPIOPinTypeCAN \
        ROM_GPIOPinTypeCAN
#else
#define MAP_GPIOPinTypeCAN \
        GPIOPinTypeCAN
#endif
#ifdef ROM_GPIOPinTypeComparator
#define MAP_GPIOPinTypeComparator \
        ROM_GPIOPinTypeComparator
#else
#define MAP_GPIOPinTypeComparator \
        GPIOPinTypeComparator
#endif
#ifdef ROM_GPIOPinTypeGPIOInput
#define MAP_GPIOPinTypeGPIOInput \
        ROM_GPIOPinTypeGPIOInput
#else
#define MAP_GPIOPinTypeGPIOInput \
        GPIOPinTypeGPIOInput
#endif
#ifdef ROM_GPIOPinTypeGPIOOutput
#define MAP_GPIOPinTypeGPIOOutput \
        ROM_GPIOPinTypeGPIOOutput
#else
#define MAP_GPIOPinTypeGPIOOutput \
        GPIOPinTypeGPIOOutput
#endif
#ifdef ROM_GPIOPinTypeI2C
#define MAP_GPIOPinTypeI2C \
        ROM_GPIOPinTypeI2C
#else
#define MAP_GPIOPinTypeI2C \
        GPIOPinTypeI2C
#endif
#ifdef ROM_GPIOPinTypePWM
#define MAP_GPIOPinTypePWM \
        ROM_GPIOPinTypePWM
#else
#define MAP_GPIOPinTypePWM \
        GPIOPinTypePWM
#endif
#ifdef ROM_GPIOPinTypeQEI
#define MAP_GPIOPinTypeQEI \
        ROM_GPIOPinTypeQEI
#else
#define MAP_GPIOPinTypeQEI \
        GPIOPinTypeQEI
#endif
#ifdef ROM_GPIOPinTypeSSI
#define MAP_GPIOPinTypeSSI \
        ROM_GPIOPinTypeSSI
#else
#define MAP_GPIOPinTypeSSI \
        GPIOPinTypeSSI
#endif
#ifdef ROM_GPIOPinTypeTimer
#define MAP_GPIOPinTypeTimer \
        ROM_GPIOPinTypeTimer
#else
#define MAP_GPIOPinTypeTimer \
        GPIOPinTypeTimer
#endif
#ifdef ROM_GPIOPinTypeUART
#define MAP_GPIOPinTypeUART \
        ROM_GPIOPinTypeUART
#else
#define MAP_GPIOPinTypeUART \
        GPIOPinTypeUART
#endif
#ifdef ROM_GPIOPinTypeGPIOOutputOD
#define MAP_GPIOPinTypeGPIOOutputOD \
        ROM_GPIOPinTypeGPIOOutputOD
#else
#define MAP_GPIOPinTypeGPIOOutputOD \
        GPIOPinTypeGPIOOutputOD
#endif

//*****************************************************************************
//
// Macros for the I2C API.
//
//*****************************************************************************
#ifdef ROM_I2CMasterDataPut
#define MAP_I2CMasterDataPut \
        ROM_I2CMasterDataPut
#else
#define MAP_I2CMasterDataPut \
        I2CMasterDataPut
#endif
#ifdef ROM_I2CMasterInitExpClk
#define MAP_I2CMasterInitExpClk \
        ROM_I2CMasterInitExpClk
#else
#define MAP_I2CMasterInitExpClk \
        I2CMasterInitExpClk
#endif
#ifdef ROM_I2CSlaveInit
#define MAP_I2CSlaveInit \
        ROM_I2CSlaveInit
#else
#define MAP_I2CSlaveInit \
        I2CSlaveInit
#endif
#ifdef ROM_I2CMasterEnable
#define MAP_I2CMasterEnable \
        ROM_I2CMasterEnable
#else
#define MAP_I2CMasterEnable \
        I2CMasterEnable
#endif
#ifdef ROM_I2CSlaveEnable
#define MAP_I2CSlaveEnable \
        ROM_I2CSlaveEnable
#else
#define MAP_I2CSlaveEnable \
        I2CSlaveEnable
#endif
#ifdef ROM_I2CMasterDisable
#define MAP_I2CMasterDisable \
        ROM_I2CMasterDisable
#else
#define MAP_I2CMasterDisable \
        I2CMasterDisable
#endif
#ifdef ROM_I2CSlaveDisable
#define MAP_I2CSlaveDisable \
        ROM_I2CSlaveDisable
#else
#define MAP_I2CSlaveDisable \
        I2CSlaveDisable
#endif
#ifdef ROM_I2CMasterIntEnable
#define MAP_I2CMasterIntEnable \
        ROM_I2CMasterIntEnable
#else
#define MAP_I2CMasterIntEnable \
        I2CMasterIntEnable
#endif
#ifdef ROM_I2CSlaveIntEnable
#define MAP_I2CSlaveIntEnable \
        ROM_I2CSlaveIntEnable
#else
#define MAP_I2CSlaveIntEnable \
        I2CSlaveIntEnable
#endif
#ifdef ROM_I2CMasterIntDisable
#define MAP_I2CMasterIntDisable \
        ROM_I2CMasterIntDisable
#else
#define MAP_I2CMasterIntDisable \
        I2CMasterIntDisable
#endif
#ifdef ROM_I2CSlaveIntDisable
#define MAP_I2CSlaveIntDisable \
        ROM_I2CSlaveIntDisable
#else
#define MAP_I2CSlaveIntDisable \
        I2CSlaveIntDisable
#endif
#ifdef ROM_I2CMasterIntStatus
#define MAP_I2CMasterIntStatus \
        ROM_I2CMasterIntStatus
#else
#define MAP_I2CMasterIntStatus \
        I2CMasterIntStatus
#endif
#ifdef ROM_I2CSlaveIntStatus
#define MAP_I2CSlaveIntStatus \
        ROM_I2CSlaveIntStatus
#else
#define MAP_I2CSlaveIntStatus \
        I2CSlaveIntStatus
#endif
#ifdef ROM_I2CMasterIntClear
#define MAP_I2CMasterIntClear \
        ROM_I2CMasterIntClear
#else
#define MAP_I2CMasterIntClear \
        I2CMasterIntClear
#endif
#ifdef ROM_I2CSlaveIntClear
#define MAP_I2CSlaveIntClear \
        ROM_I2CSlaveIntClear
#else
#define MAP_I2CSlaveIntClear \
        I2CSlaveIntClear
#endif
#ifdef ROM_I2CMasterSlaveAddrSet
#define MAP_I2CMasterSlaveAddrSet \
        ROM_I2CMasterSlaveAddrSet
#else
#define MAP_I2CMasterSlaveAddrSet \
        I2CMasterSlaveAddrSet
#endif
#ifdef ROM_I2CMasterBusy
#define MAP_I2CMasterBusy \
        ROM_I2CMasterBusy
#else
#define MAP_I2CMasterBusy \
        I2CMasterBusy
#endif
#ifdef ROM_I2CMasterBusBusy
#define MAP_I2CMasterBusBusy \
        ROM_I2CMasterBusBusy
#else
#define MAP_I2CMasterBusBusy \
        I2CMasterBusBusy
#endif
#ifdef ROM_I2CMasterControl
#define MAP_I2CMasterControl \
        ROM_I2CMasterControl
#else
#define MAP_I2CMasterControl \
        I2CMasterControl
#endif
#ifdef ROM_I2CMasterErr
#define MAP_I2CMasterErr \
        ROM_I2CMasterErr
#else
#define MAP_I2CMasterErr \
        I2CMasterErr
#endif
#ifdef ROM_I2CMasterDataGet
#define MAP_I2CMasterDataGet \
        ROM_I2CMasterDataGet
#else
#define MAP_I2CMasterDataGet \
        I2CMasterDataGet
#endif
#ifdef ROM_I2CSlaveStatus
#define MAP_I2CSlaveStatus \
        ROM_I2CSlaveStatus
#else
#define MAP_I2CSlaveStatus \
        I2CSlaveStatus
#endif
#ifdef ROM_I2CSlaveDataPut
#define MAP_I2CSlaveDataPut \
        ROM_I2CSlaveDataPut
#else
#define MAP_I2CSlaveDataPut \
        I2CSlaveDataPut
#endif
#ifdef ROM_I2CSlaveDataGet
#define MAP_I2CSlaveDataGet \
        ROM_I2CSlaveDataGet
#else
#define MAP_I2CSlaveDataGet \
        I2CSlaveDataGet
#endif

//*****************************************************************************
//
// Macros for the Interrupt API.
//
//*****************************************************************************
#ifdef ROM_IntEnable
#define MAP_IntEnable \
        ROM_IntEnable
#else
#define MAP_IntEnable \
        IntEnable
#endif
#ifdef ROM_IntDisable
#define MAP_IntDisable \
        ROM_IntDisable
#else
#define MAP_IntDisable \
        IntDisable
#endif
#ifdef ROM_IntPriorityGroupingSet
#define MAP_IntPriorityGroupingSet \
        ROM_IntPriorityGroupingSet
#else
#define MAP_IntPriorityGroupingSet \
        IntPriorityGroupingSet
#endif
#ifdef ROM_IntPriorityGroupingGet
#define MAP_IntPriorityGroupingGet \
        ROM_IntPriorityGroupingGet
#else
#define MAP_IntPriorityGroupingGet \
        IntPriorityGroupingGet
#endif
#ifdef ROM_IntPrioritySet
#define MAP_IntPrioritySet \
        ROM_IntPrioritySet
#else
#define MAP_IntPrioritySet \
        IntPrioritySet
#endif
#ifdef ROM_IntPriorityGet
#define MAP_IntPriorityGet \
        ROM_IntPriorityGet
#else
#define MAP_IntPriorityGet \
        IntPriorityGet
#endif

//*****************************************************************************
//
// Macros for the PWM API.
//
//*****************************************************************************
#ifdef ROM_PWMPulseWidthSet
#define MAP_PWMPulseWidthSet \
        ROM_PWMPulseWidthSet
#else
#define MAP_PWMPulseWidthSet \
        PWMPulseWidthSet
#endif
#ifdef ROM_PWMGenConfigure
#define MAP_PWMGenConfigure \
        ROM_PWMGenConfigure
#else
#define MAP_PWMGenConfigure \
        PWMGenConfigure
#endif
#ifdef ROM_PWMGenPeriodSet
#define MAP_PWMGenPeriodSet \
        ROM_PWMGenPeriodSet
#else
#define MAP_PWMGenPeriodSet \
        PWMGenPeriodSet
#endif
#ifdef ROM_PWMGenPeriodGet
#define MAP_PWMGenPeriodGet \
        ROM_PWMGenPeriodGet
#else
#define MAP_PWMGenPeriodGet \
        PWMGenPeriodGet
#endif
#ifdef ROM_PWMGenEnable
#define MAP_PWMGenEnable \
        ROM_PWMGenEnable
#else
#define MAP_PWMGenEnable \
        PWMGenEnable
#endif
#ifdef ROM_PWMGenDisable
#define MAP_PWMGenDisable \
        ROM_PWMGenDisable
#else
#define MAP_PWMGenDisable \
        PWMGenDisable
#endif
#ifdef ROM_PWMPulseWidthGet
#define MAP_PWMPulseWidthGet \
        ROM_PWMPulseWidthGet
#else
#define MAP_PWMPulseWidthGet \
        PWMPulseWidthGet
#endif
#ifdef ROM_PWMDeadBandEnable
#define MAP_PWMDeadBandEnable \
        ROM_PWMDeadBandEnable
#else
#define MAP_PWMDeadBandEnable \
        PWMDeadBandEnable
#endif
#ifdef ROM_PWMDeadBandDisable
#define MAP_PWMDeadBandDisable \
        ROM_PWMDeadBandDisable
#else
#define MAP_PWMDeadBandDisable \
        PWMDeadBandDisable
#endif
#ifdef ROM_PWMSyncUpdate
#define MAP_PWMSyncUpdate \
        ROM_PWMSyncUpdate
#else
#define MAP_PWMSyncUpdate \
        PWMSyncUpdate
#endif
#ifdef ROM_PWMSyncTimeBase
#define MAP_PWMSyncTimeBase \
        ROM_PWMSyncTimeBase
#else
#define MAP_PWMSyncTimeBase \
        PWMSyncTimeBase
#endif
#ifdef ROM_PWMOutputState
#define MAP_PWMOutputState \
        ROM_PWMOutputState
#else
#define MAP_PWMOutputState \
        PWMOutputState
#endif
#ifdef ROM_PWMOutputInvert
#define MAP_PWMOutputInvert \
        ROM_PWMOutputInvert
#else
#define MAP_PWMOutputInvert \
        PWMOutputInvert
#endif
#ifdef ROM_PWMOutputFault
#define MAP_PWMOutputFault \
        ROM_PWMOutputFault
#else
#define MAP_PWMOutputFault \
        PWMOutputFault
#endif
#ifdef ROM_PWMGenIntTrigEnable
#define MAP_PWMGenIntTrigEnable \
        ROM_PWMGenIntTrigEnable
#else
#define MAP_PWMGenIntTrigEnable \
        PWMGenIntTrigEnable
#endif
#ifdef ROM_PWMGenIntTrigDisable
#define MAP_PWMGenIntTrigDisable \
        ROM_PWMGenIntTrigDisable
#else
#define MAP_PWMGenIntTrigDisable \
        PWMGenIntTrigDisable
#endif
#ifdef ROM_PWMGenIntStatus
#define MAP_PWMGenIntStatus \
        ROM_PWMGenIntStatus
#else
#define MAP_PWMGenIntStatus \
        PWMGenIntStatus
#endif
#ifdef ROM_PWMGenIntClear
#define MAP_PWMGenIntClear \
        ROM_PWMGenIntClear
#else
#define MAP_PWMGenIntClear \
        PWMGenIntClear
#endif
#ifdef ROM_PWMIntEnable
#define MAP_PWMIntEnable \
        ROM_PWMIntEnable
#else
#define MAP_PWMIntEnable \
        PWMIntEnable
#endif
#ifdef ROM_PWMIntDisable
#define MAP_PWMIntDisable \
        ROM_PWMIntDisable
#else
#define MAP_PWMIntDisable \
        PWMIntDisable
#endif
#ifdef ROM_PWMFaultIntClear
#define MAP_PWMFaultIntClear \
        ROM_PWMFaultIntClear
#else
#define MAP_PWMFaultIntClear \
        PWMFaultIntClear
#endif
#ifdef ROM_PWMIntStatus
#define MAP_PWMIntStatus \
        ROM_PWMIntStatus
#else
#define MAP_PWMIntStatus \
        PWMIntStatus
#endif

//*****************************************************************************
//
// Macros for the QEI API.
//
//*****************************************************************************
#ifdef ROM_QEIPositionGet
#define MAP_QEIPositionGet \
        ROM_QEIPositionGet
#else
#define MAP_QEIPositionGet \
        QEIPositionGet
#endif
#ifdef ROM_QEIEnable
#define MAP_QEIEnable \
        ROM_QEIEnable
#else
#define MAP_QEIEnable \
        QEIEnable
#endif
#ifdef ROM_QEIDisable
#define MAP_QEIDisable \
        ROM_QEIDisable
#else
#define MAP_QEIDisable \
        QEIDisable
#endif
#ifdef ROM_QEIConfigure
#define MAP_QEIConfigure \
        ROM_QEIConfigure
#else
#define MAP_QEIConfigure \
        QEIConfigure
#endif
#ifdef ROM_QEIPositionSet
#define MAP_QEIPositionSet \
        ROM_QEIPositionSet
#else
#define MAP_QEIPositionSet \
        QEIPositionSet
#endif
#ifdef ROM_QEIDirectionGet
#define MAP_QEIDirectionGet \
        ROM_QEIDirectionGet
#else
#define MAP_QEIDirectionGet \
        QEIDirectionGet
#endif
#ifdef ROM_QEIErrorGet
#define MAP_QEIErrorGet \
        ROM_QEIErrorGet
#else
#define MAP_QEIErrorGet \
        QEIErrorGet
#endif
#ifdef ROM_QEIVelocityEnable
#define MAP_QEIVelocityEnable \
        ROM_QEIVelocityEnable
#else
#define MAP_QEIVelocityEnable \
        QEIVelocityEnable
#endif
#ifdef ROM_QEIVelocityDisable
#define MAP_QEIVelocityDisable \
        ROM_QEIVelocityDisable
#else
#define MAP_QEIVelocityDisable \
        QEIVelocityDisable
#endif
#ifdef ROM_QEIVelocityConfigure
#define MAP_QEIVelocityConfigure \
        ROM_QEIVelocityConfigure
#else
#define MAP_QEIVelocityConfigure \
        QEIVelocityConfigure
#endif
#ifdef ROM_QEIVelocityGet
#define MAP_QEIVelocityGet \
        ROM_QEIVelocityGet
#else
#define MAP_QEIVelocityGet \
        QEIVelocityGet
#endif
#ifdef ROM_QEIIntEnable
#define MAP_QEIIntEnable \
        ROM_QEIIntEnable
#else
#define MAP_QEIIntEnable \
        QEIIntEnable
#endif
#ifdef ROM_QEIIntDisable
#define MAP_QEIIntDisable \
        ROM_QEIIntDisable
#else
#define MAP_QEIIntDisable \
        QEIIntDisable
#endif
#ifdef ROM_QEIIntStatus
#define MAP_QEIIntStatus \
        ROM_QEIIntStatus
#else
#define MAP_QEIIntStatus \
        QEIIntStatus
#endif
#ifdef ROM_QEIIntClear
#define MAP_QEIIntClear \
        ROM_QEIIntClear
#else
#define MAP_QEIIntClear \
        QEIIntClear
#endif

//*****************************************************************************
//
// Macros for the SSI API.
//
//*****************************************************************************
#ifdef ROM_SSIDataPut
#define MAP_SSIDataPut \
        ROM_SSIDataPut
#else
#define MAP_SSIDataPut \
        SSIDataPut
#endif
#ifdef ROM_SSIConfigSetExpClk
#define MAP_SSIConfigSetExpClk \
        ROM_SSIConfigSetExpClk
#else
#define MAP_SSIConfigSetExpClk \
        SSIConfigSetExpClk
#endif
#ifdef ROM_SSIEnable
#define MAP_SSIEnable \
        ROM_SSIEnable
#else
#define MAP_SSIEnable \
        SSIEnable
#endif
#ifdef ROM_SSIDisable
#define MAP_SSIDisable \
        ROM_SSIDisable
#else
#define MAP_SSIDisable \
        SSIDisable
#endif
#ifdef ROM_SSIIntEnable
#define MAP_SSIIntEnable \
        ROM_SSIIntEnable
#else
#define MAP_SSIIntEnable \
        SSIIntEnable
#endif
#ifdef ROM_SSIIntDisable
#define MAP_SSIIntDisable \
        ROM_SSIIntDisable
#else
#define MAP_SSIIntDisable \
        SSIIntDisable
#endif
#ifdef ROM_SSIIntStatus
#define MAP_SSIIntStatus \
        ROM_SSIIntStatus
#else
#define MAP_SSIIntStatus \
        SSIIntStatus
#endif
#ifdef ROM_SSIIntClear
#define MAP_SSIIntClear \
        ROM_SSIIntClear
#else
#define MAP_SSIIntClear \
        SSIIntClear
#endif
#ifdef ROM_SSIDataPutNonBlocking
#define MAP_SSIDataPutNonBlocking \
        ROM_SSIDataPutNonBlocking
#else
#define MAP_SSIDataPutNonBlocking \
        SSIDataPutNonBlocking
#endif
#ifdef ROM_SSIDataGet
#define MAP_SSIDataGet \
        ROM_SSIDataGet
#else
#define MAP_SSIDataGet \
        SSIDataGet
#endif
#ifdef ROM_SSIDataGetNonBlocking
#define MAP_SSIDataGetNonBlocking \
        ROM_SSIDataGetNonBlocking
#else
#define MAP_SSIDataGetNonBlocking \
        SSIDataGetNonBlocking
#endif

//*****************************************************************************
//
// Macros for the SysCtl API.
//
//*****************************************************************************
#ifdef ROM_SysCtlSleep
#define MAP_SysCtlSleep \
        ROM_SysCtlSleep
#else
#define MAP_SysCtlSleep \
        SysCtlSleep
#endif
#ifdef ROM_SysCtlSRAMSizeGet
#define MAP_SysCtlSRAMSizeGet \
        ROM_SysCtlSRAMSizeGet
#else
#define MAP_SysCtlSRAMSizeGet \
        SysCtlSRAMSizeGet
#endif
#ifdef ROM_SysCtlFlashSizeGet
#define MAP_SysCtlFlashSizeGet \
        ROM_SysCtlFlashSizeGet
#else
#define MAP_SysCtlFlashSizeGet \
        SysCtlFlashSizeGet
#endif
#ifdef ROM_SysCtlPinPresent
#define MAP_SysCtlPinPresent \
        ROM_SysCtlPinPresent
#else
#define MAP_SysCtlPinPresent \
        SysCtlPinPresent
#endif
#ifdef ROM_SysCtlPeripheralPresent
#define MAP_SysCtlPeripheralPresent \
        ROM_SysCtlPeripheralPresent
#else
#define MAP_SysCtlPeripheralPresent \
        SysCtlPeripheralPresent
#endif
#ifdef ROM_SysCtlPeripheralReset
#define MAP_SysCtlPeripheralReset \
        ROM_SysCtlPeripheralReset
#else
#define MAP_SysCtlPeripheralReset \
        SysCtlPeripheralReset
#endif
#ifdef ROM_SysCtlPeripheralEnable
#define MAP_SysCtlPeripheralEnable \
        ROM_SysCtlPeripheralEnable
#else
#define MAP_SysCtlPeripheralEnable \
        SysCtlPeripheralEnable
#endif
#ifdef ROM_SysCtlPeripheralDisable
#define MAP_SysCtlPeripheralDisable \
        ROM_SysCtlPeripheralDisable
#else
#define MAP_SysCtlPeripheralDisable \
        SysCtlPeripheralDisable
#endif
#ifdef ROM_SysCtlPeripheralSleepEnable
#define MAP_SysCtlPeripheralSleepEnable \
        ROM_SysCtlPeripheralSleepEnable
#else
#define MAP_SysCtlPeripheralSleepEnable \
        SysCtlPeripheralSleepEnable
#endif
#ifdef ROM_SysCtlPeripheralSleepDisable
#define MAP_SysCtlPeripheralSleepDisable \
        ROM_SysCtlPeripheralSleepDisable
#else
#define MAP_SysCtlPeripheralSleepDisable \
        SysCtlPeripheralSleepDisable
#endif
#ifdef ROM_SysCtlPeripheralDeepSleepEnable
#define MAP_SysCtlPeripheralDeepSleepEnable \
        ROM_SysCtlPeripheralDeepSleepEnable
#else
#define MAP_SysCtlPeripheralDeepSleepEnable \
        SysCtlPeripheralDeepSleepEnable
#endif
#ifdef ROM_SysCtlPeripheralDeepSleepDisable
#define MAP_SysCtlPeripheralDeepSleepDisable \
        ROM_SysCtlPeripheralDeepSleepDisable
#else
#define MAP_SysCtlPeripheralDeepSleepDisable \
        SysCtlPeripheralDeepSleepDisable
#endif
#ifdef ROM_SysCtlPeripheralClockGating
#define MAP_SysCtlPeripheralClockGating \
        ROM_SysCtlPeripheralClockGating
#else
#define MAP_SysCtlPeripheralClockGating \
        SysCtlPeripheralClockGating
#endif
#ifdef ROM_SysCtlIntEnable
#define MAP_SysCtlIntEnable \
        ROM_SysCtlIntEnable
#else
#define MAP_SysCtlIntEnable \
        SysCtlIntEnable
#endif
#ifdef ROM_SysCtlIntDisable
#define MAP_SysCtlIntDisable \
        ROM_SysCtlIntDisable
#else
#define MAP_SysCtlIntDisable \
        SysCtlIntDisable
#endif
#ifdef ROM_SysCtlIntClear
#define MAP_SysCtlIntClear \
        ROM_SysCtlIntClear
#else
#define MAP_SysCtlIntClear \
        SysCtlIntClear
#endif
#ifdef ROM_SysCtlIntStatus
#define MAP_SysCtlIntStatus \
        ROM_SysCtlIntStatus
#else
#define MAP_SysCtlIntStatus \
        SysCtlIntStatus
#endif
#ifdef ROM_SysCtlLDOSet
#define MAP_SysCtlLDOSet \
        ROM_SysCtlLDOSet
#else
#define MAP_SysCtlLDOSet \
        SysCtlLDOSet
#endif
#ifdef ROM_SysCtlLDOGet
#define MAP_SysCtlLDOGet \
        ROM_SysCtlLDOGet
#else
#define MAP_SysCtlLDOGet \
        SysCtlLDOGet
#endif
#ifdef ROM_SysCtlReset
#define MAP_SysCtlReset \
        ROM_SysCtlReset
#else
#define MAP_SysCtlReset \
        SysCtlReset
#endif
#ifdef ROM_SysCtlDeepSleep
#define MAP_SysCtlDeepSleep \
        ROM_SysCtlDeepSleep
#else
#define MAP_SysCtlDeepSleep \
        SysCtlDeepSleep
#endif
#ifdef ROM_SysCtlResetCauseGet
#define MAP_SysCtlResetCauseGet \
        ROM_SysCtlResetCauseGet
#else
#define MAP_SysCtlResetCauseGet \
        SysCtlResetCauseGet
#endif
#ifdef ROM_SysCtlResetCauseClear
#define MAP_SysCtlResetCauseClear \
        ROM_SysCtlResetCauseClear
#else
#define MAP_SysCtlResetCauseClear \
        SysCtlResetCauseClear
#endif
#ifdef ROM_SysCtlClockSet
#define MAP_SysCtlClockSet \
        ROM_SysCtlClockSet
#else
#define MAP_SysCtlClockSet \
        SysCtlClockSet
#endif
#ifdef ROM_SysCtlClockGet
#define MAP_SysCtlClockGet \
        ROM_SysCtlClockGet
#else
#define MAP_SysCtlClockGet \
        SysCtlClockGet
#endif
#ifdef ROM_SysCtlPWMClockSet
#define MAP_SysCtlPWMClockSet \
        ROM_SysCtlPWMClockSet
#else
#define MAP_SysCtlPWMClockSet \
        SysCtlPWMClockSet
#endif
#ifdef ROM_SysCtlPWMClockGet
#define MAP_SysCtlPWMClockGet \
        ROM_SysCtlPWMClockGet
#else
#define MAP_SysCtlPWMClockGet \
        SysCtlPWMClockGet
#endif
#ifdef ROM_SysCtlADCSpeedSet
#define MAP_SysCtlADCSpeedSet \
        ROM_SysCtlADCSpeedSet
#else
#define MAP_SysCtlADCSpeedSet \
        SysCtlADCSpeedSet
#endif
#ifdef ROM_SysCtlADCSpeedGet
#define MAP_SysCtlADCSpeedGet \
        ROM_SysCtlADCSpeedGet
#else
#define MAP_SysCtlADCSpeedGet \
        SysCtlADCSpeedGet
#endif
#ifdef ROM_SysCtlGPIOAHBEnable
#define MAP_SysCtlGPIOAHBEnable \
        ROM_SysCtlGPIOAHBEnable
#else
#define MAP_SysCtlGPIOAHBEnable \
        SysCtlGPIOAHBEnable
#endif
#ifdef ROM_SysCtlGPIOAHBDisable
#define MAP_SysCtlGPIOAHBDisable \
        ROM_SysCtlGPIOAHBDisable
#else
#define MAP_SysCtlGPIOAHBDisable \
        SysCtlGPIOAHBDisable
#endif

//*****************************************************************************
//
// Macros for the SysTick API.
//
//*****************************************************************************
#ifdef ROM_SysTickValueGet
#define MAP_SysTickValueGet \
        ROM_SysTickValueGet
#else
#define MAP_SysTickValueGet \
        SysTickValueGet
#endif
#ifdef ROM_SysTickEnable
#define MAP_SysTickEnable \
        ROM_SysTickEnable
#else
#define MAP_SysTickEnable \
        SysTickEnable
#endif
#ifdef ROM_SysTickDisable
#define MAP_SysTickDisable \
        ROM_SysTickDisable
#else
#define MAP_SysTickDisable \
        SysTickDisable
#endif
#ifdef ROM_SysTickIntEnable
#define MAP_SysTickIntEnable \
        ROM_SysTickIntEnable
#else
#define MAP_SysTickIntEnable \
        SysTickIntEnable
#endif
#ifdef ROM_SysTickIntDisable
#define MAP_SysTickIntDisable \
        ROM_SysTickIntDisable
#else
#define MAP_SysTickIntDisable \
        SysTickIntDisable
#endif
#ifdef ROM_SysTickPeriodSet
#define MAP_SysTickPeriodSet \
        ROM_SysTickPeriodSet
#else
#define MAP_SysTickPeriodSet \
        SysTickPeriodSet
#endif
#ifdef ROM_SysTickPeriodGet
#define MAP_SysTickPeriodGet \
        ROM_SysTickPeriodGet
#else
#define MAP_SysTickPeriodGet \
        SysTickPeriodGet
#endif

//*****************************************************************************
//
// Macros for the Timer API.
//
//*****************************************************************************
#ifdef ROM_TimerIntClear
#define MAP_TimerIntClear \
        ROM_TimerIntClear
#else
#define MAP_TimerIntClear \
        TimerIntClear
#endif
#ifdef ROM_TimerEnable
#define MAP_TimerEnable \
        ROM_TimerEnable
#else
#define MAP_TimerEnable \
        TimerEnable
#endif
#ifdef ROM_TimerDisable
#define MAP_TimerDisable \
        ROM_TimerDisable
#else
#define MAP_TimerDisable \
        TimerDisable
#endif
#ifdef ROM_TimerConfigure
#define MAP_TimerConfigure \
        ROM_TimerConfigure
#else
#define MAP_TimerConfigure \
        TimerConfigure
#endif
#ifdef ROM_TimerControlLevel
#define MAP_TimerControlLevel \
        ROM_TimerControlLevel
#else
#define MAP_TimerControlLevel \
        TimerControlLevel
#endif
#ifdef ROM_TimerControlTrigger
#define MAP_TimerControlTrigger \
        ROM_TimerControlTrigger
#else
#define MAP_TimerControlTrigger \
        TimerControlTrigger
#endif
#ifdef ROM_TimerControlEvent
#define MAP_TimerControlEvent \
        ROM_TimerControlEvent
#else
#define MAP_TimerControlEvent \
        TimerControlEvent
#endif
#ifdef ROM_TimerControlStall
#define MAP_TimerControlStall \
        ROM_TimerControlStall
#else
#define MAP_TimerControlStall \
        TimerControlStall
#endif
#ifdef ROM_TimerRTCEnable
#define MAP_TimerRTCEnable \
        ROM_TimerRTCEnable
#else
#define MAP_TimerRTCEnable \
        TimerRTCEnable
#endif
#ifdef ROM_TimerRTCDisable
#define MAP_TimerRTCDisable \
        ROM_TimerRTCDisable
#else
#define MAP_TimerRTCDisable \
        TimerRTCDisable
#endif
#ifdef ROM_TimerPrescaleSet
#define MAP_TimerPrescaleSet \
        ROM_TimerPrescaleSet
#else
#define MAP_TimerPrescaleSet \
        TimerPrescaleSet
#endif
#ifdef ROM_TimerPrescaleGet
#define MAP_TimerPrescaleGet \
        ROM_TimerPrescaleGet
#else
#define MAP_TimerPrescaleGet \
        TimerPrescaleGet
#endif
#ifdef ROM_TimerLoadSet
#define MAP_TimerLoadSet \
        ROM_TimerLoadSet
#else
#define MAP_TimerLoadSet \
        TimerLoadSet
#endif
#ifdef ROM_TimerLoadGet
#define MAP_TimerLoadGet \
        ROM_TimerLoadGet
#else
#define MAP_TimerLoadGet \
        TimerLoadGet
#endif
#ifdef ROM_TimerValueGet
#define MAP_TimerValueGet \
        ROM_TimerValueGet
#else
#define MAP_TimerValueGet \
        TimerValueGet
#endif
#ifdef ROM_TimerMatchSet
#define MAP_TimerMatchSet \
        ROM_TimerMatchSet
#else
#define MAP_TimerMatchSet \
        TimerMatchSet
#endif
#ifdef ROM_TimerMatchGet
#define MAP_TimerMatchGet \
        ROM_TimerMatchGet
#else
#define MAP_TimerMatchGet \
        TimerMatchGet
#endif
#ifdef ROM_TimerIntEnable
#define MAP_TimerIntEnable \
        ROM_TimerIntEnable
#else
#define MAP_TimerIntEnable \
        TimerIntEnable
#endif
#ifdef ROM_TimerIntDisable
#define MAP_TimerIntDisable \
        ROM_TimerIntDisable
#else
#define MAP_TimerIntDisable \
        TimerIntDisable
#endif
#ifdef ROM_TimerIntStatus
#define MAP_TimerIntStatus \
        ROM_TimerIntStatus
#else
#define MAP_TimerIntStatus \
        TimerIntStatus
#endif

//*****************************************************************************
//
// Macros for the UART API.
//
//*****************************************************************************
#ifdef ROM_UARTCharPut
#define MAP_UARTCharPut \
        ROM_UARTCharPut
#else
#define MAP_UARTCharPut \
        UARTCharPut
#endif
#ifdef ROM_UARTParityModeSet
#define MAP_UARTParityModeSet \
        ROM_UARTParityModeSet
#else
#define MAP_UARTParityModeSet \
        UARTParityModeSet
#endif
#ifdef ROM_UARTParityModeGet
#define MAP_UARTParityModeGet \
        ROM_UARTParityModeGet
#else
#define MAP_UARTParityModeGet \
        UARTParityModeGet
#endif
#ifdef ROM_UARTFIFOLevelSet
#define MAP_UARTFIFOLevelSet \
        ROM_UARTFIFOLevelSet
#else
#define MAP_UARTFIFOLevelSet \
        UARTFIFOLevelSet
#endif
#ifdef ROM_UARTFIFOLevelGet
#define MAP_UARTFIFOLevelGet \
        ROM_UARTFIFOLevelGet
#else
#define MAP_UARTFIFOLevelGet \
        UARTFIFOLevelGet
#endif
#ifdef ROM_UARTConfigSetExpClk
#define MAP_UARTConfigSetExpClk \
        ROM_UARTConfigSetExpClk
#else
#define MAP_UARTConfigSetExpClk \
        UARTConfigSetExpClk
#endif
#ifdef ROM_UARTConfigGetExpClk
#define MAP_UARTConfigGetExpClk \
        ROM_UARTConfigGetExpClk
#else
#define MAP_UARTConfigGetExpClk \
        UARTConfigGetExpClk
#endif
#ifdef ROM_UARTEnable
#define MAP_UARTEnable \
        ROM_UARTEnable
#else
#define MAP_UARTEnable \
        UARTEnable
#endif
#ifdef ROM_UARTDisable
#define MAP_UARTDisable \
        ROM_UARTDisable
#else
#define MAP_UARTDisable \
        UARTDisable
#endif
#ifdef ROM_UARTEnableSIR
#define MAP_UARTEnableSIR \
        ROM_UARTEnableSIR
#else
#define MAP_UARTEnableSIR \
        UARTEnableSIR
#endif
#ifdef ROM_UARTDisableSIR
#define MAP_UARTDisableSIR \
        ROM_UARTDisableSIR
#else
#define MAP_UARTDisableSIR \
        UARTDisableSIR
#endif
#ifdef ROM_UARTCharsAvail
#define MAP_UARTCharsAvail \
        ROM_UARTCharsAvail
#else
#define MAP_UARTCharsAvail \
        UARTCharsAvail
#endif
#ifdef ROM_UARTSpaceAvail
#define MAP_UARTSpaceAvail \
        ROM_UARTSpaceAvail
#else
#define MAP_UARTSpaceAvail \
        UARTSpaceAvail
#endif
#ifdef ROM_UARTCharGetNonBlocking
#define MAP_UARTCharGetNonBlocking \
        ROM_UARTCharGetNonBlocking
#else
#define MAP_UARTCharGetNonBlocking \
        UARTCharGetNonBlocking
#endif
#ifdef ROM_UARTCharGet
#define MAP_UARTCharGet \
        ROM_UARTCharGet
#else
#define MAP_UARTCharGet \
        UARTCharGet
#endif
#ifdef ROM_UARTCharPutNonBlocking
#define MAP_UARTCharPutNonBlocking \
        ROM_UARTCharPutNonBlocking
#else
#define MAP_UARTCharPutNonBlocking \
        UARTCharPutNonBlocking
#endif
#ifdef ROM_UARTBreakCtl
#define MAP_UARTBreakCtl \
        ROM_UARTBreakCtl
#else
#define MAP_UARTBreakCtl \
        UARTBreakCtl
#endif
#ifdef ROM_UARTIntEnable
#define MAP_UARTIntEnable \
        ROM_UARTIntEnable
#else
#define MAP_UARTIntEnable \
        UARTIntEnable
#endif
#ifdef ROM_UARTIntDisable
#define MAP_UARTIntDisable \
        ROM_UARTIntDisable
#else
#define MAP_UARTIntDisable \
        UARTIntDisable
#endif
#ifdef ROM_UARTIntStatus
#define MAP_UARTIntStatus \
        ROM_UARTIntStatus
#else
#define MAP_UARTIntStatus \
        UARTIntStatus
#endif
#ifdef ROM_UARTIntClear
#define MAP_UARTIntClear \
        ROM_UARTIntClear
#else
#define MAP_UARTIntClear \
        UARTIntClear
#endif

//*****************************************************************************
//
// Macros for the Watchdog API.
//
//*****************************************************************************
#ifdef ROM_WatchdogIntClear
#define MAP_WatchdogIntClear \
        ROM_WatchdogIntClear
#else
#define MAP_WatchdogIntClear \
        WatchdogIntClear
#endif
#ifdef ROM_WatchdogRunning
#define MAP_WatchdogRunning \
        ROM_WatchdogRunning
#else
#define MAP_WatchdogRunning \
        WatchdogRunning
#endif
#ifdef ROM_WatchdogEnable
#define MAP_WatchdogEnable \
        ROM_WatchdogEnable
#else
#define MAP_WatchdogEnable \
        WatchdogEnable
#endif
#ifdef ROM_WatchdogResetEnable
#define MAP_WatchdogResetEnable \
        ROM_WatchdogResetEnable
#else
#define MAP_WatchdogResetEnable \
        WatchdogResetEnable
#endif
#ifdef ROM_WatchdogResetDisable
#define MAP_WatchdogResetDisable \
        ROM_WatchdogResetDisable
#else
#define MAP_WatchdogResetDisable \
        WatchdogResetDisable
#endif
#ifdef ROM_WatchdogLock
#define MAP_WatchdogLock \
        ROM_WatchdogLock
#else
#define MAP_WatchdogLock \
        WatchdogLock
#endif
#ifdef ROM_WatchdogUnlock
#define MAP_WatchdogUnlock \
        ROM_WatchdogUnlock
#else
#define MAP_WatchdogUnlock \
        WatchdogUnlock
#endif
#ifdef ROM_WatchdogLockState
#define MAP_WatchdogLockState \
        ROM_WatchdogLockState
#else
#define MAP_WatchdogLockState \
        WatchdogLockState
#endif
#ifdef ROM_WatchdogReloadSet
#define MAP_WatchdogReloadSet \
        ROM_WatchdogReloadSet
#else
#define MAP_WatchdogReloadSet \
        WatchdogReloadSet
#endif
#ifdef ROM_WatchdogReloadGet
#define MAP_WatchdogReloadGet \
        ROM_WatchdogReloadGet
#else
#define MAP_WatchdogReloadGet \
        WatchdogReloadGet
#endif
#ifdef ROM_WatchdogValueGet
#define MAP_WatchdogValueGet \
        ROM_WatchdogValueGet
#else
#define MAP_WatchdogValueGet \
        WatchdogValueGet
#endif
#ifdef ROM_WatchdogIntEnable
#define MAP_WatchdogIntEnable \
        ROM_WatchdogIntEnable
#else
#define MAP_WatchdogIntEnable \
        WatchdogIntEnable
#endif
#ifdef ROM_WatchdogIntStatus
#define MAP_WatchdogIntStatus \
        ROM_WatchdogIntStatus
#else
#define MAP_WatchdogIntStatus \
        WatchdogIntStatus
#endif
#ifdef ROM_WatchdogStallEnable
#define MAP_WatchdogStallEnable \
        ROM_WatchdogStallEnable
#else
#define MAP_WatchdogStallEnable \
        WatchdogStallEnable
#endif
#ifdef ROM_WatchdogStallDisable
#define MAP_WatchdogStallDisable \
        ROM_WatchdogStallDisable
#else
#define MAP_WatchdogStallDisable \
        WatchdogStallDisable
#endif

#endif // __ROM_MAP_H__
