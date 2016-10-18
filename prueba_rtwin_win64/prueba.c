/*
 * prueba.c
 *
 * Code generation for model "prueba".
 *
 * Model version              : 1.6
 * Simulink Coder version : 8.6 (R2014a) 27-Dec-2013
 * C source code generated on : Tue Oct 18 08:33:21 2016
 *
 * Target selection: rtwin.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Generic->32-bit x86 compatible
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */
#include "prueba.h"
#include "prueba_private.h"
#include "prueba_dt.h"

/* list of Real-Time Windows Target timers */
const int RTWinTimerCount = 1;
const double RTWinTimers[2] = {
  0.1, 0.0,
};

/* Block signals (auto storage) */
B_prueba_T prueba_B;

/* Continuous states */
X_prueba_T prueba_X;

/* Block states (auto storage) */
DW_prueba_T prueba_DW;

/* Real-time model */
RT_MODEL_prueba_T prueba_M_;
RT_MODEL_prueba_T *const prueba_M = &prueba_M_;

/* This function updates continuous states using the ODE8 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  /* Solver Matrices */
#define prueba_NSTAGES                 13

  static real_T rt_ODE8_B[13] = {
    4.174749114153025E-2, 0.0, 0.0, 0.0,
    0.0, -5.54523286112393E-2, 2.393128072011801E-1, 7.03510669403443E-1,
    -7.597596138144609E-1, 6.605630309222863E-1, 1.581874825101233E-1,
    -2.381095387528628E-1, 2.5E-1
  };

  static real_T rt_ODE8_C[13] = {
    0.0, 5.555555555555556E-2, 8.333333333333333E-2, 1.25E-1,
    3.125E-1, 3.75E-1, 1.475E-1, 4.65E-1,
    5.648654513822596E-1, 6.5E-1, 9.246562776405044E-1, 1.0, 1.0
  };

  static real_T rt_ODE8_A[13][13] = {
    /* rt_ODE8_A[0][] */
    { 0.0, 0.0, 0.0, 0.0,
      0.0, 0.0, 0.0, 0.0,
      0.0, 0.0, 0.0, 0.0, 0.0 },

    /* rt_ODE8_A[1][] */
    { 5.555555555555556E-2, 0.0, 0.0, 0.0,
      0.0, 0.0, 0.0, 0.0,
      0.0, 0.0, 0.0, 0.0, 0.0 },

    /* rt_ODE8_A[2][] */
    { 2.083333333333333E-2, 6.25E-2, 0.0, 0.0,
      0.0, 0.0, 0.0, 0.0,
      0.0, 0.0, 0.0, 0.0, 0.0 },

    /* rt_ODE8_A[3][] */
    { 3.125E-2, 0.0, 9.375E-2, 0.0,
      0.0, 0.0, 0.0, 0.0,
      0.0, 0.0, 0.0, 0.0, 0.0 },

    /* rt_ODE8_A[4][] */
    { 3.125E-1, 0.0, -1.171875, 1.171875,
      0.0, 0.0, 0.0, 0.0,
      0.0, 0.0, 0.0, 0.0, 0.0 },

    /* rt_ODE8_A[5][] */
    { 3.75E-2, 0.0, 0.0, 1.875E-1,
      1.5E-1, 0.0, 0.0, 0.0,
      0.0, 0.0, 0.0, 0.0, 0.0 },

    /* rt_ODE8_A[6][] */
    { 4.791013711111111E-2, 0.0, 0.0, 1.122487127777778E-1,
      -2.550567377777778E-2, 1.284682388888889E-2, 0.0, 0.0,
      0.0, 0.0, 0.0, 0.0, 0.0 },

    /* rt_ODE8_A[7][] */
    { 1.691798978729228E-2, 0.0, 0.0, 3.878482784860432E-1,
      3.597736985150033E-2, 1.969702142156661E-1, -1.727138523405018E-1, 0.0,
      0.0, 0.0, 0.0, 0.0, 0.0 },

    /* rt_ODE8_A[8][] */
    { 6.90957533591923E-2, 0.0, 0.0, -6.342479767288542E-1,
      -1.611975752246041E-1, 1.386503094588253E-1, 9.409286140357563E-1,
      2.11636326481944E-1,
      0.0, 0.0, 0.0, 0.0, 0.0 },

    /* rt_ODE8_A[9][] */
    { 1.835569968390454E-1, 0.0, 0.0, -2.468768084315592,
      -2.912868878163005E-1, -2.647302023311738E-2, 2.8478387641928,
      2.813873314698498E-1,
      1.237448998633147E-1, 0.0, 0.0, 0.0, 0.0 },

    /* rt_ODE8_A[10][] */
    { -1.215424817395888, 0.0, 0.0, 1.667260866594577E1,
      9.157418284168179E-1, -6.056605804357471, -1.600357359415618E1,
      1.484930308629766E1,
      -1.337157573528985E1, 5.134182648179638, 0.0, 0.0, 0.0 },

    /* rt_ODE8_A[11][] */
    { 2.588609164382643E-1, 0.0, 0.0, -4.774485785489205,
      -4.350930137770325E-1, -3.049483332072241, 5.577920039936099,
      6.155831589861039,
      -5.062104586736938, 2.193926173180679, 1.346279986593349E-1, 0.0, 0.0 },

    /* rt_ODE8_A[12][] */
    { 8.224275996265075E-1, 0.0, 0.0, -1.165867325727766E1,
      -7.576221166909362E-1, 7.139735881595818E-1, 1.207577498689006E1,
      -2.127659113920403,
      1.990166207048956, -2.342864715440405E-1, 1.758985777079423E-1, 0.0, 0.0 },
  };

  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE8_IntgData *intgData = (ODE8_IntgData *) rtsiGetSolverData(si);
  real_T *deltaY = intgData->deltaY;
  real_T *x0 = intgData->x0;
  real_T* f[prueba_NSTAGES];
  int idx,stagesIdx,statesIdx;
  double deltaX;
  int_T nXc = 3;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);
  f[0] = intgData->f[0];
  f[1] = intgData->f[1];
  f[2] = intgData->f[2];
  f[3] = intgData->f[3];
  f[4] = intgData->f[4];
  f[5] = intgData->f[5];
  f[6] = intgData->f[6];
  f[7] = intgData->f[7];
  f[8] = intgData->f[8];
  f[9] = intgData->f[9];
  f[10] = intgData->f[10];
  f[11] = intgData->f[11];
  f[12] = intgData->f[12];

  /* Save the state values at time t in y and x0*/
  (void) memset(deltaY, 0,
                (uint_T)nXc*sizeof(real_T));
  (void) memcpy(x0, x,
                nXc*sizeof(real_T));
  for (stagesIdx=0;stagesIdx<prueba_NSTAGES;stagesIdx++) {
    (void) memcpy(x, x0,
                  (uint_T)nXc*sizeof(real_T));
    for (statesIdx=0;statesIdx<nXc;statesIdx++) {
      deltaX = 0;
      for (idx=0;idx<stagesIdx;idx++) {
        deltaX = deltaX + h*rt_ODE8_A[stagesIdx][idx]*f[idx][statesIdx];
      }

      x[statesIdx] = x0[statesIdx] + deltaX;
    }

    if (stagesIdx==0) {
      rtsiSetdX(si, f[stagesIdx]);
      prueba_derivatives();
    } else {
      (stagesIdx==prueba_NSTAGES-1)? rtsiSetT(si, tnew) : rtsiSetT(si, t + h*
        rt_ODE8_C[stagesIdx]);
      rtsiSetdX(si, f[stagesIdx]);
      prueba_output();
      prueba_derivatives();
    }

    for (statesIdx=0;statesIdx<nXc;statesIdx++) {
      deltaY[statesIdx] = deltaY[statesIdx] + h*rt_ODE8_B[stagesIdx]*f[stagesIdx]
        [statesIdx];
    }
  }

  for (statesIdx=0;statesIdx<nXc;statesIdx++) {
    x[statesIdx] = x0[statesIdx] + deltaY[statesIdx];
  }

  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/* Model output function */
void prueba_output(void)
{
  /* local block i/o variables */
  real_T rtb_Step;
  real_T rtb_Clock;
  real_T rtb_Impulse;
  real_T rtb_Gain;
  real_T Sum;
  if (rtmIsMajorTimeStep(prueba_M)) {
    /* set solver stop time */
    if (!(prueba_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&prueba_M->solverInfo,
                            ((prueba_M->Timing.clockTickH0 + 1) *
        prueba_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&prueba_M->solverInfo, ((prueba_M->Timing.clockTick0
        + 1) * prueba_M->Timing.stepSize0 + prueba_M->Timing.clockTickH0 *
        prueba_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(prueba_M)) {
    prueba_M->Timing.t[0] = rtsiGetT(&prueba_M->solverInfo);
  }

  /* TransferFcn: '<Root>/Transfer Fcn' */
  prueba_B.TransferFcn = 0.0;
  prueba_B.TransferFcn += prueba_P.TransferFcn_C[0] *
    prueba_X.TransferFcn_CSTATE[0];
  prueba_B.TransferFcn += prueba_P.TransferFcn_C[1] *
    prueba_X.TransferFcn_CSTATE[1];
  if (rtmIsMajorTimeStep(prueba_M)) {
    /* Constant: '<Root>/Constant' */
    prueba_B.Constant = prueba_P.Constant_Value;

    /* DSP System Toolbox Discrete Impulse Generator (sdspimpgen2) - '<Root>/  Impulse' */
    if (prueba_DW.Impulse_COUNT > 0) {
      if (prueba_DW.Impulse_COUNT == 1) {
        rtb_Impulse = (1.0);
      } else {
        rtb_Impulse = (0.0);
      }

      prueba_DW.Impulse_COUNT--;
    } else {
      rtb_Impulse = (0.0);
    }

    /* Gain: '<Root>/Gain' */
    rtb_Gain = prueba_P.Gain_Gain * rtb_Impulse;
  }

  /* Sum: '<Root>/Sum' */
  Sum = prueba_B.Constant - prueba_B.TransferFcn;

  /* Clock: '<S1>/Clock' */
  rtb_Step = prueba_M->Timing.t[0];

  /* Step: '<S1>/Step' */
  if (prueba_M->Timing.t[0] < prueba_P.Ramp_start) {
    rtb_Clock = prueba_P.Step_Y0;
  } else {
    rtb_Clock = prueba_P.Ramp_slope;
  }

  /* End of Step: '<S1>/Step' */
  if (rtmIsMajorTimeStep(prueba_M)) {
    /* Sum: '<Root>/Sum2' incorporates:
     *  Constant: '<Root>/p11'
     *  Constant: '<Root>/p22'
     *  Constant: '<Root>/step'
     *  Product: '<Root>/p1'
     *  Product: '<Root>/p2'
     */
    prueba_B.Sum2 = prueba_P.p11_Value * rtb_Gain + prueba_P.p22_Value *
      prueba_P.step_Value;
  }

  /* Sum: '<Root>/Sum5' incorporates:
   *  Constant: '<Root>/p33'
   *  Constant: '<Root>/p44'
   *  Constant: '<S1>/Constant'
   *  Constant: '<S1>/Constant1'
   *  Gain: '<Root>/Gain1'
   *  Gain: '<Root>/Gain2'
   *  Gain: '<Root>/Gain3'
   *  Integrator: '<Root>/Integrator'
   *  Product: '<Root>/p3'
   *  Product: '<Root>/p4'
   *  Product: '<S1>/Product'
   *  Sum: '<Root>/Sum1'
   *  Sum: '<Root>/Sum3'
   *  Sum: '<Root>/Sum4'
   *  Sum: '<Root>/Sum6'
   *  Sum: '<S1>/Output'
   *  Sum: '<S1>/Sum'
   *  TransferFcn: '<Root>/P'
   *  TransferFcn: '<Root>/Pd'
   *  TransferFcn: '<Root>/Pi'
   */
  prueba_B.Sum5 = ((((rtb_Step - prueba_P.Ramp_start) * rtb_Clock +
                     prueba_P.Ramp_X0) * prueba_P.p33_Value + prueba_P.p44_Value
                    * prueba_X.Integrator_CSTATE) + prueba_B.Sum2) +
    ((prueba_P.Pi_D * Sum * prueba_P.Gain2_Gain + prueba_P.Pd_D * Sum *
      prueba_P.Gain3_Gain) + prueba_P.P_D * Sum * prueba_P.Gain1_Gain);

  /* Clock: '<S2>/Clock' */
  rtb_Clock = prueba_M->Timing.t[0];

  /* Step: '<S2>/Step' */
  if (prueba_M->Timing.t[0] < prueba_P.parabola_start) {
    rtb_Step = prueba_P.Step_Y0_l;
  } else {
    rtb_Step = prueba_P.parabola_slope;
  }

  /* End of Step: '<S2>/Step' */

  /* Sum: '<S2>/Output' incorporates:
   *  Constant: '<S2>/Constant'
   *  Constant: '<S2>/Constant1'
   *  Product: '<S2>/Product'
   *  Sum: '<S2>/Sum'
   */
  prueba_B.Output = (rtb_Clock - prueba_P.parabola_start) * rtb_Step +
    prueba_P.parabola_X0;

  /* Clock: '<Root>/Clock' */
  prueba_B.Clock = prueba_M->Timing.t[0];
}

/* Model update function */
void prueba_update(void)
{
  if (rtmIsMajorTimeStep(prueba_M)) {
    rt_ertODEUpdateContinuousStates(&prueba_M->solverInfo);
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++prueba_M->Timing.clockTick0)) {
    ++prueba_M->Timing.clockTickH0;
  }

  prueba_M->Timing.t[0] = rtsiGetSolverStopTime(&prueba_M->solverInfo);

  {
    /* Update absolute timer for sample time: [0.1s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick1"
     * and "Timing.stepSize1". Size of "clockTick1" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++prueba_M->Timing.clockTick1)) {
      ++prueba_M->Timing.clockTickH1;
    }

    prueba_M->Timing.t[1] = prueba_M->Timing.clockTick1 *
      prueba_M->Timing.stepSize1 + prueba_M->Timing.clockTickH1 *
      prueba_M->Timing.stepSize1 * 4294967296.0;
  }
}

/* Derivatives for root system: '<Root>' */
void prueba_derivatives(void)
{
  XDot_prueba_T *_rtXdot;
  _rtXdot = ((XDot_prueba_T *) prueba_M->ModelData.derivs);

  /* Derivatives for TransferFcn: '<Root>/Transfer Fcn' */
  _rtXdot->TransferFcn_CSTATE[0] = 0.0;
  _rtXdot->TransferFcn_CSTATE[1] = 0.0;
  _rtXdot->TransferFcn_CSTATE[0U] += prueba_P.TransferFcn_A[0] *
    prueba_X.TransferFcn_CSTATE[0];
  _rtXdot->TransferFcn_CSTATE[0U] += prueba_P.TransferFcn_A[1] *
    prueba_X.TransferFcn_CSTATE[1];
  _rtXdot->TransferFcn_CSTATE[1] += prueba_X.TransferFcn_CSTATE[0];
  _rtXdot->TransferFcn_CSTATE[0U] += prueba_B.Sum5;

  /* Derivatives for Integrator: '<Root>/Integrator' */
  _rtXdot->Integrator_CSTATE = prueba_B.Output;
}

/* Model initialize function */
void prueba_initialize(void)
{
  /* InitializeConditions for TransferFcn: '<Root>/Transfer Fcn' */
  prueba_X.TransferFcn_CSTATE[0] = 0.0;
  prueba_X.TransferFcn_CSTATE[1] = 0.0;

  /* DSP System Toolbox Discrete Impulse Generator (sdspimpgen2) - '<Root>/  Impulse' */
  prueba_DW.Impulse_COUNT = ((int_T)50) + 1;

  /* InitializeConditions for Integrator: '<Root>/Integrator' */
  prueba_X.Integrator_CSTATE = prueba_P.Integrator_IC;
}

/* Model terminate function */
void prueba_terminate(void)
{
  /* (no terminate code required) */
}

/*========================================================================*
 * Start of Classic call interface                                        *
 *========================================================================*/

/* Solver interface called by GRT_Main */
#ifndef USE_GENERATED_SOLVER

void rt_ODECreateIntegrationData(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

void rt_ODEDestroyIntegrationData(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

void rt_ODEUpdateContinuousStates(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

#endif

void MdlOutputs(int_T tid)
{
  prueba_output();
  UNUSED_PARAMETER(tid);
}

void MdlUpdate(int_T tid)
{
  prueba_update();
  UNUSED_PARAMETER(tid);
}

void MdlInitializeSizes(void)
{
}

void MdlInitializeSampleTimes(void)
{
}

void MdlInitialize(void)
{
}

void MdlStart(void)
{
  prueba_initialize();
}

void MdlTerminate(void)
{
  prueba_terminate();
}

/* Registration function */
RT_MODEL_prueba_T *prueba(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)prueba_M, 0,
                sizeof(RT_MODEL_prueba_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&prueba_M->solverInfo, &prueba_M->Timing.simTimeStep);
    rtsiSetTPtr(&prueba_M->solverInfo, &rtmGetTPtr(prueba_M));
    rtsiSetStepSizePtr(&prueba_M->solverInfo, &prueba_M->Timing.stepSize0);
    rtsiSetdXPtr(&prueba_M->solverInfo, &prueba_M->ModelData.derivs);
    rtsiSetContStatesPtr(&prueba_M->solverInfo, (real_T **)
                         &prueba_M->ModelData.contStates);
    rtsiSetNumContStatesPtr(&prueba_M->solverInfo,
      &prueba_M->Sizes.numContStates);
    rtsiSetErrorStatusPtr(&prueba_M->solverInfo, (&rtmGetErrorStatus(prueba_M)));
    rtsiSetRTModelPtr(&prueba_M->solverInfo, prueba_M);
  }

  rtsiSetSimTimeStep(&prueba_M->solverInfo, MAJOR_TIME_STEP);
  prueba_M->ModelData.intgData.deltaY= prueba_M->ModelData.OdeDeltaY;
  prueba_M->ModelData.intgData.f[0] = prueba_M->ModelData.odeF[0];
  prueba_M->ModelData.intgData.f[1] = prueba_M->ModelData.odeF[1];
  prueba_M->ModelData.intgData.f[2] = prueba_M->ModelData.odeF[2];
  prueba_M->ModelData.intgData.f[3] = prueba_M->ModelData.odeF[3];
  prueba_M->ModelData.intgData.f[4] = prueba_M->ModelData.odeF[4];
  prueba_M->ModelData.intgData.f[5] = prueba_M->ModelData.odeF[5];
  prueba_M->ModelData.intgData.f[6] = prueba_M->ModelData.odeF[6];
  prueba_M->ModelData.intgData.f[7] = prueba_M->ModelData.odeF[7];
  prueba_M->ModelData.intgData.f[8] = prueba_M->ModelData.odeF[8];
  prueba_M->ModelData.intgData.f[9] = prueba_M->ModelData.odeF[9];
  prueba_M->ModelData.intgData.f[10] = prueba_M->ModelData.odeF[10];
  prueba_M->ModelData.intgData.f[11] = prueba_M->ModelData.odeF[11];
  prueba_M->ModelData.intgData.f[12] = prueba_M->ModelData.odeF[12];
  prueba_M->ModelData.intgData.x0 = prueba_M->ModelData.odeX0;
  prueba_M->ModelData.contStates = ((real_T *) &prueba_X);
  rtsiSetSolverData(&prueba_M->solverInfo, (void *)&prueba_M->ModelData.intgData);
  rtsiSetSolverName(&prueba_M->solverInfo,"ode8");

  /* Initialize timing info */
  {
    int_T *mdlTsMap = prueba_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    prueba_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    prueba_M->Timing.sampleTimes = (&prueba_M->Timing.sampleTimesArray[0]);
    prueba_M->Timing.offsetTimes = (&prueba_M->Timing.offsetTimesArray[0]);

    /* task periods */
    prueba_M->Timing.sampleTimes[0] = (0.0);
    prueba_M->Timing.sampleTimes[1] = (0.1);

    /* task offsets */
    prueba_M->Timing.offsetTimes[0] = (0.0);
    prueba_M->Timing.offsetTimes[1] = (0.0);
  }

  rtmSetTPtr(prueba_M, &prueba_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = prueba_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    prueba_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(prueba_M, -1);
  prueba_M->Timing.stepSize0 = 0.1;
  prueba_M->Timing.stepSize1 = 0.1;

  /* External mode info */
  prueba_M->Sizes.checksums[0] = (296707143U);
  prueba_M->Sizes.checksums[1] = (2965405624U);
  prueba_M->Sizes.checksums[2] = (2777147921U);
  prueba_M->Sizes.checksums[3] = (3497691000U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    prueba_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(prueba_M->extModeInfo,
      &prueba_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(prueba_M->extModeInfo, prueba_M->Sizes.checksums);
    rteiSetTPtr(prueba_M->extModeInfo, rtmGetTPtr(prueba_M));
  }

  prueba_M->solverInfoPtr = (&prueba_M->solverInfo);
  prueba_M->Timing.stepSize = (0.1);
  rtsiSetFixedStepSize(&prueba_M->solverInfo, 0.1);
  rtsiSetSolverMode(&prueba_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  prueba_M->ModelData.blockIO = ((void *) &prueba_B);
  (void) memset(((void *) &prueba_B), 0,
                sizeof(B_prueba_T));

  /* parameters */
  prueba_M->ModelData.defaultParam = ((real_T *)&prueba_P);

  /* states (continuous) */
  {
    real_T *x = (real_T *) &prueba_X;
    prueba_M->ModelData.contStates = (x);
    (void) memset((void *)&prueba_X, 0,
                  sizeof(X_prueba_T));
  }

  /* states (dwork) */
  prueba_M->ModelData.dwork = ((void *) &prueba_DW);
  (void) memset((void *)&prueba_DW, 0,
                sizeof(DW_prueba_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    prueba_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.B = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.P = &rtPTransTable;
  }

  /* Initialize Sizes */
  prueba_M->Sizes.numContStates = (3); /* Number of continuous states */
  prueba_M->Sizes.numY = (0);          /* Number of model outputs */
  prueba_M->Sizes.numU = (0);          /* Number of model inputs */
  prueba_M->Sizes.sysDirFeedThru = (0);/* The model is not direct feedthrough */
  prueba_M->Sizes.numSampTimes = (2);  /* Number of sample times */
  prueba_M->Sizes.numBlocks = (43);    /* Number of blocks */
  prueba_M->Sizes.numBlockIO = (7);    /* Number of block outputs */
  prueba_M->Sizes.numBlockPrms = (26); /* Sum of parameter "widths" */
  return prueba_M;
}

/*========================================================================*
 * End of Classic call interface                                          *
 *========================================================================*/
