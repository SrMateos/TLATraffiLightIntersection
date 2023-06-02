---- MODULE MC ----
EXTENDS TPCIntersection, TLC

\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1685730277545583000 ==
~((pedLight="green" \/ pedLight="blinking green") /\ (tramLight="|" \/ carLight="green" \/ carLight="yellow"))
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1685730277545584000 ==
~((carLight="green" \/ carLight="yellow") /\ (tramLight="|" \/ pedLight="green" \/ pedLight="blinking green"))
----
\* INVARIANT definition @modelCorrectnessInvariants:3
inv_1685730277545585000 ==
~(tramLight="|" /\ (pedLight="green" \/ pedLight="blinking green" \/ carLight="green" \/ carLight="yellow"))
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_1685730277545586000 ==
<>(tram)
----
=============================================================================
\* Modification History
\* Created Fri Jun 02 20:24:37 CEST 2023 by jmate
