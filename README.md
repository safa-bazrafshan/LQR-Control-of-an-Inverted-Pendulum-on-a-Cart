# LQR Control of an Inverted Pendulum on a Cart

This project presents a simulation and control study of an inverted pendulum mounted on a cart using the Linear Quadratic Regulator (LQR) technique. It is developed in MATLAB R2023b and includes system modeling, simulation results, and graphical analysis.

---

## Project Structure

- lqr_pendulum.m: Main MATLAB script that defines the system and simulates the open-loop and closed-loop (LQR controlled) responses.
- figures/: Contains exported response plots (Figure 1 & Figure 2).
- report/: PDF version of the academic-style report (can be used for LinkedIn or academic CV).
- README.md: This file.

---

## System Description

The system modeled is a classic control problem in engineering: an inverted pendulum on a cart. The pendulum is inherently unstable and requires active control to balance in the upright position.

---

## Control Strategy

We apply LQR control to stabilize the pendulum. The MATLAB simulation includes:
- State-space modeling
- Pole placement
- System response to initial conditions

---

## Plots

Figure 1: Open-loop response  
Figure 2: Closed-loop response under LQR

---

## Requirements

- MATLAB R2022a or later  
- Control System Toolbox

---

## Author

Safa  
Electrical Engineering – Control Systems  
For questions, collaboration, or feedback: [safa.bazrafshan@gmail.com]

---

## License

MIT License – Free to use for academic and educational purposes.
