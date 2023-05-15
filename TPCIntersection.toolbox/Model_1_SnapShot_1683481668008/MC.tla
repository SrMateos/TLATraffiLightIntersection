---- MODULE MC ----
EXTENDS TPCIntersection, TLC

\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1683481664973413000 ==
~((pedLight="green" \/ pedLight="blinking green") /\ (tramLight="|" \/ carLight="green" \/ carLight="yellow"))
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1683481664973414000 ==
~((carLight="green" \/ carLight="yellow") /\ (tramLight="|" \/ pedLight="green" \/ pedLight="blinking green"))
----
\* INVARIANT definition @modelCorrectnessInvariants:3
inv_1683481664973415000 ==
~(tramLight="|" /\ (pedLight="green" \/ pedLight="blinking green" \/ carLight="green" \/ carLight="yellow"))
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_1683481664973416000 ==
tram => <> (tramLight = "|")
----
\* PROPERTY definition @modelCorrectnessProperties:1
prop_1683481664973417000 ==
pedestrian => <> (pedLight = "green")
----
\* PROPERTY definition @modelCorrectnessProperties:2
prop_1683481664973418000 ==
car => <> (carLight = "green")
----
\* PROPERTY definition @modelCorrectnessProperties:4
prop_1683481664973420000 ==
(~car) => <> (carLight="green")
----
=============================================================================
\* Modification History
\* Created Sun May 07 19:47:44 CEST 2023 by felix
