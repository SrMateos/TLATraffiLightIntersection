-------------------------- MODULE TPCIntersection --------------------------

VARIABLES
    car,
    tram,
    pedestrian, 
    carLight,  
    tramLight, 
    pedLight

vars == <<car, tram, pedestrian, carLight, tramLight, pedLight>>

varsC == <<tram, car, pedestrian, tramLight, pedLight>>

varsP == <<tram, car, pedestrian, tramLight, carLight>>

varsT == <<tram, car, pedestrian, carLight, pedLight>>

TPCTypeOK == /\ car \in {TRUE, FALSE}
             /\ tram \in {TRUE, FALSE}
             /\ pedestrian \in {TRUE, FALSE}
             /\ carLight \in {"red", "yellow", "green"} 
             /\ tramLight \in {"S", "-", "|"}
             /\ pedLight \in {"red", "green", "blinking green"}


TClearance == carLight = "red" /\ pedLight = "red" 

CClearance == tramLight = "S" /\ pedLight = "red"  /\ ~tram /\ ~pedestrian

PClearance == tramLight = "S" /\ carLight = "red"  /\ ~tram



TPCInit == /\ car = FALSE 
           /\ tram = FALSE
           /\ pedestrian = FALSE
           /\ carLight = "red"
           /\ tramLight = "S"
           /\ pedLight = "red"           

CNext == \/ /\ carLight = "green"
            /\ carLight' = "yellow"
            /\ UNCHANGED varsC
         \/ /\ ~car
            /\ carLight = "yellow"
            /\ carLight' = "red"
            /\ UNCHANGED varsC
         \/ /\ car
            /\ CClearance
            /\ carLight = "red"
            /\ carLight' = "green"
            /\ UNCHANGED varsC


TNext == \/ /\ ~tram
            /\ tramLight = "|"
            /\ tramLight' = "S"
            /\ UNCHANGED varsT
         \/ /\ tram
            /\ tramLight = "S"
            /\ tramLight' = "-"
            /\ UNCHANGED varsT
         \/ /\ tram
            /\ TClearance
            /\ tramLight = "-"
            /\ tramLight' = "|"
            /\ UNCHANGED varsT

PNext == \/ /\ pedLight = "green"
            /\ pedLight' = "blinking green"
            /\ UNCHANGED varsP
         \/ /\ ~pedestrian
            /\ pedLight = "blinking green"
            /\ pedLight' = "red"
            /\ UNCHANGED varsP
         \/ /\ pedestrian
            /\ PClearance
            /\ pedLight = "red"
            /\ pedLight' = "green"
            /\ UNCHANGED varsP
            
TPCRandNext == \/ /\ ~pedestrian
                  /\ pedLight = "red"
                  /\ pedestrian' = TRUE
                  /\ UNCHANGED <<tram, car, tramLight, carLight, pedLight>>
               \/ /\ ~car
                  /\ carLight = "red"
                  /\ car' = TRUE
                  /\ UNCHANGED <<tram, pedestrian, tramLight, carLight, pedLight>>
               \/ /\ ~tram
                  /\ tramLight = "S"
                  /\ tram' = TRUE
                  /\ UNCHANGED <<car, pedestrian, tramLight, carLight, pedLight>>
               \/ /\ pedestrian
                  /\ pedLight \in {"green", "blinking green"} 
                  /\ pedestrian' = FALSE
                  /\ UNCHANGED <<tram, car, tramLight, carLight, pedLight>>
               \/ /\ car
                  /\ carLight \in {"green", "yellow"}
                  /\ car' = FALSE
                  /\ UNCHANGED <<tram, pedestrian, tramLight, carLight, pedLight>>
               \/ /\ tram
                  /\ tramLight = "|"
                  /\ tram' = FALSE
                  /\ UNCHANGED <<car, pedestrian, tramLight, carLight, pedLight>>


TPCNext == CNext \/ TNext \/ PNext \/ TPCRandNext

Spec == /\ TPCInit
        /\ [][TPCNext]_vars
        /\ SF_vars(TNext)
        /\ SF_vars(PNext)
        /\ SF_vars(CNext)
        /\ SF_vars(TPCRandNext)

         
THEOREM Spec => []TPCTypeOK
=============================================================================
\* Modification History
\* Last modified Fri Jun 02 20:30:17 CEST 2023 by jmate
\* Last modified Sun May 07 20:12:15 CEST 2023 by felix
\* Created Thu May 04 12:56:43 CEST 2023 by felix
