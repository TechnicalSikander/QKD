# QKD
# What is QKD?
QKD is a method for securely distributing cryptographic keys between two parties (Alice and Bob) using principles of quantum mechanics. Unlike classical encryption, QKD provides information-theoretic security - meaning its security is mathematically proven against any computational attack, even by future quantum computers.
# Why QKD is Needed
•	Traditional encryption (e.g., RSA) relies on computational complexity, which quantum computers could break
•	QKD enables unconditionally secure communication when combined with the One-Time Pad (OTP) encryption
•	Only solution to the key distribution problem for OTP (which requires keys as long as messages)
# How QKD Works? 
The process involves two main phases:
A. Quantum Transmission Phase
•	Alice encodes random bits into quantum states (e.g., photon polarizations)
•	Sends these states to Bob through a quantum channel (e.g., optical fiber)
•	Quantum principles provide security:
o	No-Cloning Theorem: Eavesdroppers (Eve) can't copy quantum states
o	Heisenberg Uncertainty: Any measurement disturbs the system, revealing eavesdropping
B. Postprocessing Phase (Classical Computation)
Converts raw quantum measurements into a secure key through:
1.	Parameter Estimation: Estimate channel errors to detect eavesdropping
2.	Sifting: Filter out measurements where Alice/Bob used incompatible bases
3.	Information Reconciliation: Correct errors in remaining bits
4.	Privacy Amplification: Compress keys to eliminate Eve's partial knowledge
5.	Authentication: Verify classical communication integrity

# What is QKD protocols
In Quantum Key Distribution (QKD), protocols are specific sets of rules that define how quantum states are prepared, transmitted, and measured to securely distribute cryptographic keys. Here’s a breakdown of the key protocols mentioned in your papers, including BB84, E91, and B92, along with others referenced:
________________________________________
1. BB84 (Bennett-Brassard 1984)
•	Core Idea: The first and most widely used QKD protocol. Uses two conjugate bases to encode bits in quantum states.
•	How it works:
o	Alice sends photons polarized in one of four states:
	Rectilinear basis (Z): Vertical (|0⟩) or Horizontal (|1⟩)
	Diagonal basis (X): +45° (|+⟩) or -45° (|−⟩)
o	Bob randomly measures in either basis. They discard mismatched bases (sifting) and keep matched ones as the raw key.
•	Security: Eve’s measurements disturb the states (due to quantum uncertainty), revealing her presence.
•	Key Feature: Simple to implement with weak laser pulses or single photons.
________________________________________
2. E91 (Ekert 1991)
•	Core Idea: Uses quantum entanglement (Einstein-Podolsky-Rosen pairs) instead of prepared states.
•	How it works:
o	A third party (or Alice) generates entangled photon pairs (e.g., |Φ⁺⟩ = (|00⟩ + |11⟩)/√2).
o	Alice and Bob each receive one photon and measure in randomly chosen bases.
o	Correlations between their measurements form the key.
•	Security: Relies on Bell’s theorem—any eavesdropping breaks entanglement, detectable through statistical tests.
•	Key Feature: No need to trust the photon source (useful for device-independent QKD).
# Different Protocols
In Quantum Key Distribution (QKD), protocols are specific sets of rules that define how quantum states are prepared, transmitted, and measured to securely distribute cryptographic keys. Here’s a breakdown of the key protocols mentioned in your papers, including BB84, E91, and B92, along with others referenced:

1. BB84 (Bennett-Brassard 1984)
•	Core Idea: The first and most widely used QKD protocol. Uses two conjugate bases to encode bits in quantum states.
•	How it works:
o	Alice sends photons polarized in one of four states:
	Rectilinear basis (Z): Vertical (|0⟩) or Horizontal (|1⟩)
	Diagonal basis (X): +45° (|+⟩) or -45° (|−⟩)
o	Bob randomly measures in either basis. They discard mismatched bases (sifting) and keep matched ones as the raw key.
•	Security: Eve’s measurements disturb the states (due to quantum uncertainty), revealing her presence.
•	Key Feature: Simple to implement with weak laser pulses or single photons.

2. E91 (Ekert 1991)
•	Core Idea: Uses quantum entanglement (Einstein-Podolsky-Rosen pairs) instead of prepared states.
•	How it works:
o	A third party (or Alice) generates entangled photon pairs (e.g., |Φ⁺⟩ = (|00⟩ + |11⟩)/√2).
o	Alice and Bob each receive one photon and measure in randomly chosen bases.
o	Correlations between their measurements form the key.
•	Security: Relies on Bell’s theorem—any eavesdropping breaks entanglement, detectable through statistical tests.
•	Key Feature: No need to trust the photon source (useful for device-independent QKD).

 B92 (Bennett 1992)
•	Core Idea: A simplified version of BB84 using only two non-orthogonal states.
•	How it works:
o	Alice sends photons in either |0⟩ or |+⟩ (no need for all four BB84 states).
o	Bob measures in the Z or X basis. If his measurement yields an orthogonal state (e.g., he gets |1⟩ when Alice sent |0⟩), he discards the result. Otherwise, he keeps it.
•	Security: Eve can’t distinguish |0⟩ and |+⟩ perfectly, introducing errors.
•	Key Feature: Fewer states needed than BB84, but lower efficiency.

Other Notable Protocols
CV-QKD (Continuous-Variable QKD)
•	Encodes information in continuous properties of light (e.g., amplitude/phase quadratures).
•	Example: GG02 (Grosshans-Grangier 2002) uses coherent states and homodyne detection.
Measurement-Device-Independent (MDI-QKD)
•	Removes vulnerabilities in detectors (a common hacking target).
•	Alice and Bob send states to a central untrusted node that performs measurements.
Twin-Field (TF-QKD)
•	Extends QKD range beyond traditional limits by interfering phase-encoded signals from Alice and Bob at a middle node.


