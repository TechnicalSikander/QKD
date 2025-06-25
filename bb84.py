# -*- coding: utf-8 -*-
"""BB84.ipynb

**BB84 Quantum Key Distribution Protocol (QKD)**
This notebook simulates the BB84 QKD protocol, a quantum communication protocol to securely share a key using qubits. This is ideal for educational and research purposes.

🔁 Step 1: Import Libraries
"""

import numpy as np
from math import sqrt
from random import randint

"""⚛️ Step 2: Define the Qubit Class
This class represents a single qubit, its initial state, and operations like Hadamard (H), NOT (X), and measurement.
"""

class Qubit:
    def __init__(self, initial_state):
        self.state = np.matrix([[0], [1]]) if initial_state else np.matrix([[1], [0]])
        self.measured = False
        self.H = (1/sqrt(2)) * np.matrix([[1, 1], [1, -1]])
        self.X = np.matrix([[0, 1], [1, 0]])

    def show(self):
        output = ""
        amp_0 = round((np.matrix([1, 0]) @ self.state).item(), 2)
        amp_1 = round((np.matrix([0, 1]) @ self.state).item(), 2)

        if amp_0:
            output += f"{'' if amp_0 == 1.0 else amp_0}|0>"
        if amp_1:
            if output:
                output += " + "
            output += f"{'' if amp_1 == 1.0 else amp_1}|1>"
        return output

    def measure(self):
        if self.measured:
            raise Exception("Qubit already measured!")
        threshold = round((np.matrix([1, 0]) @ self.state).item() ** 2, 2)
        self.measured = True
        return 0 if randint(0, 999999) < threshold * 1e6 else 1

    def hadamard(self):
        if self.measured:
            raise Exception("Qubit already measured!")
        self.state = self.H @ self.state

    def apply_X(self):
        if self.measured:
            raise Exception("Qubit already measured!")
        self.state = self.X @ self.state

"""👤 Step 3: Define the QuantumUser Class
Each user (Alice, Bob, Eve) uses this class to send or receive qubits based on their bit and basis choices.
"""

class QuantumUser:
    def __init__(self, name):
        self.name = name

    def send(self, data, basis):
        qubits = []
        for bit, base in zip(data, basis):
            q = Qubit(bit)
            if base:  # Hadamard basis
                q.hadamard()
            qubits.append(q)
        return qubits

    def receive(self, qubits, basis):
        bits = []
        for q, base in zip(qubits, basis):
            if base:  # Hadamard basis
                q.hadamard()
            bits.append(q.measure())
        return bits

"""🔁 Step 4: Generate Random Bits"""

def generate_random_bits(N):
    return [randint(0, 1) for _ in range(N)]

"""🔐 Step 5: Define BB84 Protocol Simulation"""

def QKD(N=10, verbose=False, eve_present=False):
    alice = QuantumUser("Alice")
    bob = QuantumUser("Bob")

    alice_bits = generate_random_bits(N)
    alice_basis = generate_random_bits(N)
    alice_qubits = alice.send(alice_bits, alice_basis)

    if eve_present:
        eve = QuantumUser("Eve")
        eve_basis = generate_random_bits(N)
        eve_bits = eve.receive(alice_qubits, eve_basis)
        alice_qubits = eve.send(eve_bits, eve_basis)

    bob_basis = generate_random_bits(N)
    bob_bits = bob.receive(alice_qubits, bob_basis)

    # Key sifting
    alice_key = []
    bob_key = []
    for ab, bb, abit, bbit in zip(alice_basis, bob_basis, alice_bits, bob_bits):
        if ab == bb:
            alice_key.append(abit)
            bob_key.append(bbit)

    if verbose:
        print(f"Alice's bits:  {alice_bits}")
        print(f"Alice's basis: {alice_basis}")
        if eve_present:
            print("Eve intercepted and resent...")
        print(f"Bob's basis:   {bob_basis}")
        print(f"Bob's bits:    {bob_bits}")
        print(f"Matched bits:  {alice_key}")
        print(f"Bob's key:     {bob_key}")

    if alice_key == bob_key:
        print("✅ Key successfully exchanged!")
    else:
        print("⚠️ Key mismatch detected (Eve may be present).")

    return alice_key, bob_key, alice_key == bob_key

"""▶️ Step 6: Run the Simulation"""

# Run once
alice_key, bob_key, result = QKD(N=20, verbose=True, eve_present=False)
