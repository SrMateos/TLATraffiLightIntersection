---- MODULE MC ----
EXTENDS TPCIntersection, TLC

\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1685730202743573000 ==
~((pedLight="green" \/ pedLight="blinking green") /\ (tramLight="|" \/ carLight="green" \/ carLight="yellow"))
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1685730202743574000 ==
~((carLight="green" \/ carLight="yellow") /\ (tramLight="|" \/ pedLight="green" \/ pedLight="blinking green"))
----
\* INVARIANT definition @modelCorrectnessInvariants:3
inv_1685730202743575000 ==
~(tramLight="|" /\ (pedLight="green" \/ pedLight="blinking green" \/ carLight="green" \/ carLight="yellow"))
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_1685730202743576000 ==
<>(tramLight="|")
----
=============================================================================
\* Modification History
\* Created Fri Jun 02 20:23:22 CEST 2023 by jmate
