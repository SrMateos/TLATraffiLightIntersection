---- MODULE MC ----
EXTENDS TPCIntersection, TLC

\* INVARIANT definition @modelCorrectnessInvariants:1
inv_168573069295812000 ==
~((pedLight="green" \/ pedLight="blinking green") /\ (tramLight="|" \/ carLight="green" \/ carLight="yellow"))
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_168573069295813000 ==
~((carLight="green" \/ carLight="yellow") /\ (tramLight="|" \/ pedLight="green" \/ pedLight="blinking green"))
----
\* INVARIANT definition @modelCorrectnessInvariants:3
inv_168573069295814000 ==
~(tramLight="|" /\ (pedLight="green" \/ pedLight="blinking green" \/ carLight="green" \/ carLight="yellow"))
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_168573069295815000 ==
[](tram => <> (tramLight = "|"))
----
\* PROPERTY definition @modelCorrectnessProperties:1
prop_168573069295816000 ==
pedestrian => <> (pedLight = "green")
----
\* PROPERTY definition @modelCorrectnessProperties:2
prop_168573069295817000 ==
car => <> (carLight = "green")
----
\* PROPERTY definition @modelCorrectnessProperties:4
prop_168573069295819000 ==
<>(tramLight = "|")
----
=============================================================================
\* Modification History
\* Created Fri Jun 02 20:31:32 CEST 2023 by jmate
