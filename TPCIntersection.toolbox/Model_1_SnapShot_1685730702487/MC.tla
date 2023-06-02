---- MODULE MC ----
EXTENDS TPCIntersection, TLC

\* INVARIANT definition @modelCorrectnessInvariants:1
inv_168573070045029000 ==
~((pedLight="green" \/ pedLight="blinking green") /\ (tramLight="|" \/ carLight="green" \/ carLight="yellow"))
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_168573070045030000 ==
~((carLight="green" \/ carLight="yellow") /\ (tramLight="|" \/ pedLight="green" \/ pedLight="blinking green"))
----
\* INVARIANT definition @modelCorrectnessInvariants:3
inv_168573070045031000 ==
~(tramLight="|" /\ (pedLight="green" \/ pedLight="blinking green" \/ carLight="green" \/ carLight="yellow"))
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_168573070045032000 ==
[](tram => <> (tramLight = "|"))
----
\* PROPERTY definition @modelCorrectnessProperties:1
prop_168573070045033000 ==
pedestrian => <> (pedLight = "green")
----
\* PROPERTY definition @modelCorrectnessProperties:2
prop_168573070045034000 ==
car => <> (carLight = "green")
----
=============================================================================
\* Modification History
\* Created Fri Jun 02 20:31:40 CEST 2023 by jmate
