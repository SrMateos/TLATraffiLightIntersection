---- MODULE MC ----
EXTENDS TPCIntersection, TLC

\* INVARIANT definition @modelCorrectnessInvariants:1
inv_168573072373279000 ==
~((pedLight="green" \/ pedLight="blinking green") /\ (tramLight="|" \/ carLight="green" \/ carLight="yellow"))
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_168573072373280000 ==
~((carLight="green" \/ carLight="yellow") /\ (tramLight="|" \/ pedLight="green" \/ pedLight="blinking green"))
----
\* INVARIANT definition @modelCorrectnessInvariants:3
inv_168573072373281000 ==
~(tramLight="|" /\ (pedLight="green" \/ pedLight="blinking green" \/ carLight="green" \/ carLight="yellow"))
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_168573072373282000 ==
[](tram => <> (tramLight = "|"))
----
\* PROPERTY definition @modelCorrectnessProperties:1
prop_168573072373283000 ==
pedestrian => <> (pedLight = "green")
----
\* PROPERTY definition @modelCorrectnessProperties:2
prop_168573072373284000 ==
car => <> (carLight = "green")
----
=============================================================================
\* Modification History
\* Created Fri Jun 02 20:32:03 CEST 2023 by jmate
