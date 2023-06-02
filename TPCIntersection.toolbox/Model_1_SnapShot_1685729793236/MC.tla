---- MODULE MC ----
EXTENDS TPCIntersection, TLC

\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1685729791207562000 ==
~((pedLight="green" \/ pedLight="blinking green") /\ (tramLight="|" \/ carLight="green" \/ carLight="yellow"))
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1685729791207563000 ==
~((carLight="green" \/ carLight="yellow") /\ (tramLight="|" \/ pedLight="green" \/ pedLight="blinking green"))
----
\* INVARIANT definition @modelCorrectnessInvariants:3
inv_1685729791207564000 ==
~(tramLight="|" /\ (pedLight="green" \/ pedLight="blinking green" \/ carLight="green" \/ carLight="yellow"))
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_1685729791207565000 ==
[](tram => <> (tramLight = "|"))
----
=============================================================================
\* Modification History
\* Created Fri Jun 02 20:16:31 CEST 2023 by jmate
