-------------------------- MODULE TPCIntersection --------------------------

VARIABLES
    car,  \* presence de coches en la intersection
    tram, \* presence de trams en la intersection
    pedestrian, \* indica si hay peatones cruzando la carretera o las tracks
    carLight,  
    tramLight, 
    pedLight

TPCTypeOK == /\ car \in {TRUE, FALSE}
             /\ tram \in {TRUE, FALSE}
             /\ pedestrian \in {TRUE, FALSE}
             /\ carLight \in {"red", "yellow", "green"} \* \subseteq si solo un estado
             /\ tramLight \in {"S", "-", "|"}
             /\ pedLight \in {"red", "green", "blinking green"} \* posibility of blinking green


TClearance == carLight = "red" /\ pedLight = "red"

CClearance == tramLight = "S" /\ pedLight = "red"  /\ ~tram /\ ~pedestrian \* priority case

PClearance == tramLight = "S" /\ carLight = "red"  /\ ~tram



TPCInit == /\ car = FALSE 
           /\ tram = FALSE
           /\ pedestrian = FALSE
           /\ carLight = "red"
           /\ tramLight = "S"
           /\ pedLight = "red"           

CNext == \/ /\ carLight = "green"
            /\ carLight' = "yellow"
            /\ UNCHANGED <<tram, car, pedestrian, tramLight, pedLight>>
         \/ /\ ~car
            /\ carLight = "yellow"
            /\ carLight' = "red"
            /\ UNCHANGED <<tram, car, pedestrian, tramLight, pedLight>>
         \/ /\ car
            /\ CClearance
            /\ carLight = "red"
            /\ carLight' = "green"
            /\ UNCHANGED <<tram, car, pedestrian, tramLight, pedLight>>
         

TNext == \/ /\ ~tram
            /\ tramLight = "|"
            /\ tramLight' = "S"
            /\ UNCHANGED <<tram, car, pedestrian, carLight, pedLight>>
         \/ /\ tram
            /\ tramLight = "S"
            /\ tramLight' = "-"
            /\ UNCHANGED <<tram, car, pedestrian, carLight, pedLight>>
         \/ /\ tram
            /\ TClearance
            /\ tramLight = "-"
            /\ tramLight' = "|"
            /\ UNCHANGED <<tram, car, pedestrian, carLight, pedLight>>

PNext == \/ /\ pedLight = "green"
            /\ pedLight' = "blinking green"
            /\ UNCHANGED <<tram, car, pedestrian, tramLight, carLight>>
         \/ /\ ~pedestrian
            /\ pedLight = "blinking green"
            /\ pedLight' = "red"
            /\ UNCHANGED <<tram, car, pedestrian, tramLight, carLight>>
         \/ /\ pedestrian
            /\ PClearance
            /\ pedLight = "red"
            /\ pedLight' = "green"
            /\ UNCHANGED <<tram, car, pedestrian, tramLight, carLight>>
            
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

Spec == TPCInit /\ [][TPCNext]_<<car, tram, pedestrian, carLight, tramLight, pedLight>>

=============================================================================
\* Modification History
\* Last modified Sun May 07 18:52:04 CEST 2023 by felix
\* Created Thu May 04 12:56:43 CEST 2023 by felix
