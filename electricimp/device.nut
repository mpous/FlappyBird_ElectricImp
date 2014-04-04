
imp.configure("Flappy Bird Electric Imp", [], []);

// whenever pin1 changes, send it's state to agent
function pin1Changed() {
    local data = hardware.pin1.read();
    agent.send("stateChanged", data);
}

hardware.pin1.configure(DIGITAL_IN, pin1Changed);
