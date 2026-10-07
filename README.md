# Embedded Linux Roadmap

[![ci](https://github.com/KaithanNguyen/embedded-linux-roadmap/actions/workflows/ci.yml/badge.svg)](https://github.com/KaithanNguyen/embedded-linux-roadmap/actions/workflows/ci.yml)

Hands-on embedded Linux and embedded C/C++ engineering on real hardware: experiments with measured results, root-cause debug reports, design decisions and an end-to-end sensor + camera system built on an STM32MP257F-DK and a Jetson Nano.

Linux BSP work — boot, device tree, kernel drivers, Yocto — is the main axis. The system is grown as a walking skeleton: a minimal sensor → driver → C service → TCP → host path runs first, then one part at a time is replaced (own driver, custom image, Jetson service in C++, camera, security) and measured again with the same scripts.

Results are recorded only with reproducible evidence — exact commands, logs, measurements and tests — and every topic carries a verification level that an automated check holds to account (see [How work is verified](#how-work-is-verified)).

Depth goes where engineering judgment cannot be delegated: hardware bring-up, kernel internals, timing and memory ordering, debugging on real boards, and verifying AI-generated code against datasheets ([approach](docs/ai-assisted-engineering.md)).

> Learning notes are written in Vietnamese with English technical terms. This page, the [conventions](CONVENTIONS.md) and the [tooling](tools/README.md) are in English.

## Scope

| Area | Focus |
| --- | --- |
| C/C++ | Memory and ownership, linking and startup code, undefined behavior, concurrency, debugging; modern C++ for embedded |
| Arm architecture | Exception levels and TrustZone, MMU and caches, memory ordering, GIC/NVIC, ABI and assembly, Cortex-M faults |
| Linux | System programming, real-time latency, durable storage, boot flow, U-Boot, device tree, kernel drivers (I2C/SPI, IIO, interrupts, DMA), Yocto |
| Hardware | Datasheets and schematics, register-level programming, UART/GPIO/I2C/SPI, sensor signals, logic analyzer and current measurements |
| Connectivity & media | Sockets, TCP/UDP, Wi-Fi, TLS, MQTT; V4L2, H.264, GStreamer |
| Robustness | Crash/restart and fault-injection tests from the first service, power-loss safety, threat modeling and least privilege from design time; A/B OTA with signed images and secure boot as extensions |
| Engineering practice | Debug drills with planted faults, unit and system tests, CI, ADRs, verified use of AI, technical writing |

## Hardware & toolchain

| Item | Details |
| --- | --- |
| Main board | STM32MP257F-DK — 2× Cortex-A35 + Cortex-M33, OpenSTLinux (Yocto) |
| Second board | Jetson Nano Developer Kit (Tegra X1, 4 GB) — JetPack 4.6, camera and GPU |
| Sensor | LSM6DSOX 6-axis IMU over I2C (SPI as an extension) |
| Bench | 8-channel logic analyzer, multimeter, 3.3 V USB-UART, Ethernet switch |
| Host | Ubuntu (WSL2/VM, then native), GCC, GDB, QEMU, STM32CubeProgrammer, Yocto |

## Repository map

| Path | Contents |
| --- | --- |
| [ROADMAP.md](ROADMAP.md) | 10/2026–09/2027 plan: quarters, months, gates, metrics |
| [TRACKING.md](TRACKING.md) | Competency matrix: verification level and evidence for every topic |
| [WORKFLOW.md](WORKFLOW.md) | Weekly rhythm, verification loop, evidence and AI-usage rules |
| [sprints/](sprints/README.md) | Weekly plans with target vs actual output |
| [c-cpp-foundation/](c-cpp-foundation/README.md) | 13 C/C++ labs |
| [arm-architecture/](arm-architecture/README.md) | 6 labs on Armv8-A and Armv8-M internals |
| [linux-system/](linux-system/README.md) | 8 labs on Linux system programming, storage and real-time |
| [linux-kernel/](linux-kernel/README.md) | 13 labs from boot chain to IIO drivers, DMA and upstreaming |
| [hardware/](hardware/README.md) | Board profiles, bench safety, 7 hardware labs |
| [debug-drills/](debug-drills/README.md) | 20 planted-fault drills for root-cause practice |
| [projects/](projects/README.md) | STM32MP257F-DK + Jetson Nano edge sensor and camera system |
| [leetcode/](leetcode/README.md), [livecoding/](livecoding/README.md) | 62 core algorithm problems; 15 timed embedded C problems and monthly AI-assisted mini projects |
| [debug-logs/](debug-logs/README.md) | Debug journal: symptom → hypothesis → evidence → root cause |
| [docs/](docs/README.md) | AI-assisted engineering guide, ADRs, design studies, self-check questions, write-ups, AI error log |
| [LEARNING_LOG.md](LEARNING_LOG.md), [log/](log/2026-10.md) | One line per day of logged output |
| [templates/](templates/README.md), [tools/](tools/README.md) | Report templates; repository checks |

## Roadmap at a glance

| Quarter | Outcome |
| --- | --- |
| Q4/2026 | Linux user space on the host; STM32MP257F-DK boot, U-Boot, self-built kernel + DTB; LSM6DSOX over I2C and IIO; walking skeleton v0: IMU samples over TCP to the host |
| Q1/2027 | Skeleton hardened with crash, timeout and restart tests; own IIO driver replaces the stock one; custom Yocto image — **Gate 1** |
| Q2/2027 | Stable main path: IIO → C service → mTLS → C++ service on the Jetson → event-triggered recorder, with power-loss and 24-hour tests, CI — **Gate 2** |
| Q3/2027 | Extensions: A/B OTA with signed images, secure boot, Cortex-M33 over RPMsg or edge AI, first upstream patch |

## Progress

<!-- progress:start -->

_Generated by `python tools/repo_check.py progress --write` on 2026-10-07._

| Scope | Topics | ≥ L2 reproduced | ≥ L3 verified | Overdue |
| --- | --- | --- | --- | --- |
| Gate 1 core | 48 | 0 | 0 | 0 |
| Gate 2 core (in addition to Gate 1) | 18 | 0 | 0 | 0 |
| Extensions (after the core path is stable) | 34 | 0 | 0 | 0 |
| Practice tracks (measured, not gating) | 13 | 0 | 0 | 0 |
| Optional | 5 | 0 | 0 | 0 |

| Area | Topics | ≥ L2 reproduced | ≥ L3 verified | Overdue |
| --- | --- | --- | --- | --- |
| C/C++ | 13 | 0 | 0 | 0 |
| Arm architecture | 6 | 0 | 0 | 0 |
| Linux system programming | 9 | 0 | 0 | 0 |
| Hardware & bench | 8 | 0 | 0 | 0 |
| Boot, BSP & kernel | 12 | 0 | 0 | 0 |
| Yocto & build | 5 | 0 | 0 | 0 |
| Power & thermal | 4 | 0 | 0 | 0 |
| Networking | 10 | 0 | 0 | 0 |
| Camera & video | 7 | 0 | 0 | 0 |
| Reliability & update | 8 | 0 | 0 | 0 |
| Security | 7 | 0 | 0 | 0 |
| Testing & CI | 7 | 0 | 0 | 0 |
| MCU & RTOS | 5 | 0 | 0 | 0 |
| Debugging | 3 | 0 | 0 | 0 |
| AI-assisted engineering | 4 | 0 | 0 | 0 |
| Algorithms & timed coding | 2 | 0 | 0 | 0 |
| Design & communication | 8 | 0 | 0 | 0 |
| **Total** | **118** | **0** | **0** | **0** |

| Metric | Current | Target 06/2027 |
| --- | --- | --- |
| Days with logged output | 0 | — |
| Debug journal entries | 0 | 30 |
| Debug drills completed | 0 / 20 | 12 |
| LeetCode solved / verified | 0 / 0 | 60 / 30 |
| ADRs | 0 | 5 |
| English write-ups | 0 | 12 |
| Self-check questions answered | 0 / 93 | 93 / 93 |

<!-- progress:end -->

## How work is verified

| Level | Meaning |
| --- | --- |
| L0 | Not started |
| L1 | Understood — self-check questions answered without notes or AI |
| L2 | Reproduced — lab with source, exact commands, expected vs actual, evidence in the repository |
| L3 | Verified — redone from scratch after at least 7 days without notes or AI, one deep-dive exercise done, explained in English |
| L4 | Applied — used on real hardware in a project, a real debug case or a write-up |

`python tools/repo_check.py check` runs in CI and fails when a link is broken, a report claims Done without a result, or a topic claims a level its evidence does not support. Details: [TRACKING.md](TRACKING.md#mức-verify).

## Conventions

Naming, status vocabulary, evidence policy, code style, commit and pull request format: [CONVENTIONS.md](CONVENTIONS.md).

## Author

Nguyen Minh Khai — [@KaithanNguyen](https://github.com/KaithanNguyen)
