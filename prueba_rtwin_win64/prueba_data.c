/*
 * prueba_data.c
 *
 * Code generation for model "prueba".
 *
 * Model version              : 1.8
 * Simulink Coder version : 8.6 (R2014a) 27-Dec-2013
 * C source code generated on : Tue Oct 18 14:01:36 2016
 *
 * Target selection: rtwin.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Generic->32-bit x86 compatible
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */
#include "prueba.h"
#include "prueba_private.h"

/* Block parameters (auto storage) */
P_prueba_T prueba_P = {
  0.0,                                 /* Mask Parameter: Ramp_X0
                                        * Referenced by: '<S1>/Constant1'
                                        */
  0.0,                                 /* Mask Parameter: parabola_X0
                                        * Referenced by: '<S2>/Constant1'
                                        */
  1.0,                                 /* Mask Parameter: Ramp_slope
                                        * Referenced by: '<S1>/Step'
                                        */
  1.0,                                 /* Mask Parameter: parabola_slope
                                        * Referenced by: '<S2>/Step'
                                        */
  0.0,                                 /* Mask Parameter: Ramp_start
                                        * Referenced by:
                                        *   '<S1>/Constant'
                                        *   '<S1>/Step'
                                        */
  0.0,                                 /* Mask Parameter: parabola_start
                                        * Referenced by:
                                        *   '<S2>/Constant'
                                        *   '<S2>/Step'
                                        */
  -4.0,                                /* Computed Parameter: planta_A
                                        * Referenced by: '<Root>/planta'
                                        */
  1.0,                                 /* Computed Parameter: planta_C
                                        * Referenced by: '<Root>/planta'
                                        */
  6.0,                                 /* Expression: 6
                                        * Referenced by: '<Root>/Consig'
                                        */
  1.0,                                 /* Expression: 1
                                        * Referenced by: '<Root>/p11'
                                        */
  20.0,                                /* Expression: 20
                                        * Referenced by: '<Root>/Gain'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<Root>/p22'
                                        */
  5.0,                                 /* Expression: 5
                                        * Referenced by: '<Root>/step'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<Root>/p44'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<Root>/Integrator'
                                        */
  1.0,                                 /* Expression: 1
                                        * Referenced by: '<Root>/p33'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S1>/Step'
                                        */
  1.0,                                 /* Computed Parameter: Sensor_D
                                        * Referenced by: '<Root>/Sensor'
                                        */
  1.0,                                 /* Computed Parameter: Controlador_D
                                        * Referenced by: '<Root>/Controlador'
                                        */
  1.0,                                 /* Computed Parameter: actuador_D
                                        * Referenced by: '<Root>/actuador'
                                        */
  0.0                                  /* Expression: 0
                                        * Referenced by: '<S2>/Step'
                                        */
};
