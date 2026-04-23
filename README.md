# llama.cpp DirectML Windows Build

This repository provides a pre-compiled version of llama.cpp optimized for Windows using the DirectML backend.

DirectML ensures maximum compatibility across a wide range of hardware, allowing for GPU acceleration on AMD Radeon, Intel Arc, and NVIDIA GeForce graphics cards by leveraging DirectX 12.

## 📦 Quick Start
Don't want to clone the repo? Download the **ready-to-run .zip package** from the [Releases](https://github.com/Caerleus/llama-cpp-directml/releases) section!

## 🚀 Key Features
Wide Compatibility: Works on almost any DX12-compatible GPU.

Smart Memory Management: Better stability when models exceed physical VRAM (System Memory Fallback).

Advanced Launcher: Includes a professional .bat script to manage:

Model selection from the /models folder.

Adjustable CPU thread allocation.

Configurable GPU Layer offloading (-ngl).

Custom Context Size selection (up to 8k, 32k, or more).

Custom Server Port configuration.

Here is a professional, clear, and comprehensive README.md tailored for your new repository. It highlights the DirectML advantages and provides clear instructions for users with similar hardware (like your RX 580).

llama.cpp DirectML Windows Build
This repository provides a pre-compiled version of llama.cpp optimized for Windows using the DirectML backend.

DirectML ensures maximum compatibility across a wide range of hardware, allowing for GPU acceleration on AMD Radeon, Intel Arc, and NVIDIA GeForce graphics cards by leveraging DirectX 12.

## 🚀 Key Features
Wide Compatibility: Works on almost any DX12-compatible GPU.

Smart Memory Management: Better stability when models exceed physical VRAM (System Memory Fallback).

Advanced Launcher: Includes a professional .bat script to manage:

Model selection from the /models folder.

Adjustable CPU thread allocation.

Configurable GPU Layer offloading (-ngl).

Custom Context Size selection (up to 8k, 32k, or more).

Custom Server Port configuration.

## 📂 Repository Structure
llama-server.exe: The main executable compiled with DirectML support.

DirectML.dll: Required Microsoft DirectML runtime library.

launch_directml.bat: The interactive launcher script.

models/: Folder where you should place your .gguf files.

## 🛠️ Requirements
Windows 10 or 11 (64-bit).

DirectX 12 compatible GPU.

Visual C++ Redistributable (usually installed with Windows).

## 📥 Installation & Usage
Download/Clone this repository.

Ensure DirectML.dll is in the same folder as llama-server.exe.

Create a folder named models (if not present) and move your .gguf models into it.

Run launch_directml.bat.

Follow the interactive prompts to configure your session.

## 💡 Recommended Settings for 4GB GPUs (e.g., RX 580)
If you are using a 4GB VRAM card with a model larger than 4GB (like Gemma 4B or Llama 8B Q4/Q8):

GPU Layers: Set between 20 and 28. This allows the GPU to handle most of the work while leaving room for the Windows UI.

CPU Threads: Set to 4 (or half of your CPU cores) to prevent the processor from bottlenecking the GPU data transfer.

Context Size: Start with 4096. Increasing this significantly will consume more VRAM.

## ⚠️ Performance Note
DirectML is optimized for compatibility and stability. While it works on nearly all hardware, users looking for absolute maximum performance on AMD cards might also want to check the Vulkan version of llama.cpp. DirectML is the preferred choice for users experiencing crashes with other backends or those using shared system memory.

## 📄 License
This project is based on llama.cpp. The build and scripts in this repo are provided under the MIT License.
