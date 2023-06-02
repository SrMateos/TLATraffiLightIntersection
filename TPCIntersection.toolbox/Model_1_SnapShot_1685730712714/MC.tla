---- MODULE MC ----
EXTENDS TPCIntersection, TLC

\* INVARIANT definition @modelCorrectnessInvariants:1
inv_168573071066845000 ==
~((pedLight="green" \/ pedLight="blinking green") /\ (tramLight="|" \/ carLight="green" \/ carLight="yellow"))
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_168573071066846000 ==
~((carLight="green" \/ carLight="yellow") /\ (tramLight="|" \/ pedLight="green" \/ pedLight="blinking green"))
----
\* INVARIANT definition @modelCorrectnessInvariants:3
inv_168573071066847000 ==
~(tramLight="|" /\ (pedLight="green" \/ pedLight="blinking green" \/ carLight="green" \/ carLight="yellow"))
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_168573071066848000 ==
[](tram => <> (tramLight = "|"))
----
\* PROPERTY definition @modelCorrectnessProperties:1
prop_168573071066849000 ==
pedestrian => <> (pedLight = "green")
----
\* PROPERTY definition @modelCorrectnessProperties:2
prop_168573071066850000 ==
car => <> (carLight = "green")
----
=============================================================================
\* Modification History
\* Created Fri Jun 02 20:31:50 CEST 2023 by jmate
