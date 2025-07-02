# Verilog Traffic Light Controller 🚦

A finite state machine (FSM)-based traffic light controller written in Verilog HDL.

## 🚧 How it Works

This controller manages traffic signals for a highway and a side road with the following timing logic:

- **Highway Green**: 10 clock cycles
- **Highway Yellow**: 3 clock cycles
- **Side Road Green**: 5 clock cycles
- **Side Road Yellow**: 3 clock cycles

Traffic lights are represented using 3-bit outputs:
- `100` – Red
- `010` – Yellow
- `001` – Green

## 💻 Files

- `traffic_light_controller.v` — Main FSM implementation in Verilog

## 🛠️ Tools Used

- Verilog HDL
- Vivado Design Suite
- Testbench (optional)

## 📈 Status

✅ Fully synthesizable  
✅ Simulated for correct timing  
✅ Ready for FPGA implementation

## 📬 Feedback

Feel free to open issues or connect if you have suggestions or improvements!
